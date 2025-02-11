#!/bin/bash
which_cpc_layer=-1
cgn_root_dir=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/cgn/s5/
model_name=final
stage=0
stop_stage=1
nj=1
input_feat_affix=
nnet3_affix=
train_set=train_unlab_600
num_epochs=3
lang_appoint=english
dur_appoint=120s
tdnn_affix=1b
cpc_notation_config= #apc_5L100_feat13_mfcc_cm_e100_tshift5_res
lat_generator_acwt=10.0
train_subset=_subset900utt # can be left blank, or _subset3600utt etc.
# CPC related
cpc_layers=2
cpc_max_size_loaded=50000000
cpc_lr=0.00005
cpc_gpu_suffix=_2GPU
. cmd.sh
. ./path.sh
. ./utils/parse_options.sh

dir=exp/chain${nnet3_affix}_cgn_lat_label/${train_set}${train_subset}/lat_gen_acwt${lat_generator_acwt}/cpc_feats/dnn${tdnn_affix}_bi_epoch${num_epochs}${input_feat_affix}
data_root_dir=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/CPC_audio/egs/libri-light/exp/tune_LSTMlayers/${train_set}${train_subset}${cpc_layers}_${cpc_max_size_loaded}_lr${cpc_lr}${cpc_gpu_suffix}/cpc_feats/zr17

## Ivector is not required
#if [ $stage -le 0 ] && [ $stop_stage -gt 0 ]; then
#  echo "extract ivectors for ZRSC test set"
#  ivector_extractor=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/cgn/s5/exp/nnet3/extractor
#  data_root_path=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/relocated_from_DSP/zerospeech2017/kaldi_stuff/data_hires_conf_cgn/
#  for lang in english french mandarin; do
#    for dur in 1s 10s 120s; do
#    input_data=$data_root_path/test/$lang/$dur
#    output_data=$ivector_extractor/../ivectors_zr17_hires/test/$lang/$dur
#    steps/online/nnet2/extract_ivectors_online.sh --nj $nj \
#        $input_data $ivector_extractor $output_data || exit 1;
#    done
#  done
#fi

if [ $stage -le 1 ] && [ $stop_stage -gt 1 ]; then
  echo "extract bnf for zerospeech test sets using $model_name"
  bnf_name=tdnn6.affine
  data_root_path=${data_root_dir}/test
  for lang in  $lang_appoint  ; do
    for dur in $dur_appoint ; do
    set=${lang}_${dur}
    input_data=$data_root_path/${lang_appoint}/${dur}/data_kaldi
    if [ "$model_name" = "final" ]; then
      output_data=$dir/bnf_for_zr17/$set/
    else # use intermediate model *.mdl as extractor, specify it
      echo "using intermediate model ${model_name}.mdl"
      output_data=$dir/bnf_for_zr17_${model_name}/$set
    fi
    echo "Model: $dir; Output: $output_data"
    echo "Input: $input_data"
    steps/nnet3/make_bottleneck_features.sh --model-name $model_name  --use-gpu true  \
           --cmd run.pl  --nj 1 \
           $bnf_name $input_data $output_data $dir || exit 1;
    done
  done
fi


if [ $stage -le 2 ] && [ $stop_stage -gt 2 ]; then
 echo "construct _by_utt" folder
   for lang in $lang_appoint  ; do
      for dur in  $dur_appoint ; do
         # (
          echo "starting ${lang}-${dur}"
          data_file=${lang}_${dur}
          if [ "$model_name" = "final" ]; then
            input_data=$dir/bnf_for_zr17/$data_file
            output_path=$dir/bnf_for_zr17_by_utt/$data_file
          else
            input_data=$dir/bnf_for_zr17_${model_name}/$data_file
            output_path=$dir/bnf_for_zr17_by_utt_${model_name}/$data_file
          fi
          foo_path=$output_path/../
          mkdir -p $output_path
          zr17_data=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/relocated_from_DSP/zerospeech2017/kaldi_stuff/data/
          cp $zr17_data/test/${lang}_${dur}_template_foo.scp $foo_path/foo_${lang}-${dur}.scp
          sed -i "s| PathToRep| $output_path\/|g"  $foo_path/foo_${lang}-${dur}.scp || exit 1
          #apply-cmvn --utt2spk=ark:data/$data_file/utt2spk scp:data/$data_file/cmvn.scp scp:data/$data_file/feats.scp scp,t:$foo_path/foo_${lang}-${dur}.scp || exit 1;
          copy-feats scp:$input_data/feats.scp scp,t:$foo_path/foo_${lang}-${dur}.scp || exit 1;
          echo "${lang}-${dur}: starting removing [ and ], will construct .npy.txt files and remove .n ones"
	  time_stamp_file=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/Autoregressive-Predictive-Coding/zr17_data/time_stamp_${dur}_2more_cpc.txt
          if [ ! -z $output_path ] ; then
                for file in $output_path/*.n ; do
                    sed -e "/\[/d" -e "s/\]//g" -e "s/^ //g" -e "s/ $//g"  $file | paste -d' ' $time_stamp_file - > ${file:0:-1}feat  # ${file}py.txt;
#		    paste -d' ' $time_stamp_file ${}	    
                    if [ "$dur" = "1s" ]; then
                      last_line=$(tail -n 1 ${file:0:-1}feat | tr ' ' '\n' | wc -l)
                      if [ $last_line -le 2 ]; then
                        sed -i '$ d' ${file:0:-1}feat
                      fi
                    fi 
                done
                # mkdir -p $output_path/fea_files;
                # rm -f $output_path/*.fea || exit 1;
                find $output_path/ -name "*.n" -delete
#                find $output_path/ -name "*.npy" -delete
          fi
          echo "${lang}-${dur} .npy.txt finished"
#          echo "constructing .npy format "
#          python baseline/convert_txt_npy.py $output_path

        #  ) &
      done
   done

fi

if [ $stage -le 3 ] && [ $stop_stage -gt 3 ]; then
   echo "ABX evaluation"
   echo "$0: $(hostname)"
   echo "enter (zerospeech)"
   source /scratch/siyuanfeng/software/anaconda3/bin/activate zerospeech  # enter env: (libri-light)
   zr17_root=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/relocated_from_DSP/zerospeech2017
    lang=$lang_appoint
    dur=$dur_appoint
    eval_set=${lang}_${dur}

    data_file=${lang}_${dur}
    if [ "$model_name" = "final" ]; then
           source_dir=$dir/bnf_for_zr17_by_utt/$data_file
    else
           source_dir=$dir/bnf_for_zr17_by_utt_${model_name}/$data_file
    fi
     target_dir=$source_dir/../eval/$data_file
     echo "$0: target dir: $target_dir"
     echo "$0: source dir: $source_dir"
     mkdir -p $target_dir || exit 1;
     ls $source_dir/*.feat | wc -l
     echo "nj=$nj"
     python ${zr17_root}/track1/eval/eval_track1.py -j $nj -n 1 $lang ${dur:0:-1} $zr17_root/data $source_dir/ $target_dir/  # duration is like 120s, we need 120 instead

   source /scratch/siyuanfeng/software/anaconda3/bin/deactivate # reset
fi
