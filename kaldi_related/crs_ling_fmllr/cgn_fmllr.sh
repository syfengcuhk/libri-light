#!/bin/bash

############NOT YET READY, COPIED FROM crs_cgn_bnf.sh
nj=1
stage=0
stop_stage=1
model=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/cgn/s5/exp/chain/bn_layer/tdnn1a_sp_bi_epoch3_inputmfcc_hires_only
abx_eval_set_appoint=dev-clean
. ./path.sh
. ./utils/parse_options.sh
if [ $stage -le -1 ]  && [ $stop_stage -gt -1 ];then
    echo "$0: extracting ivectors"
    ivector_extractor=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/cgn/s5/exp/nnet3/extractor
    data_root_path=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/libri-light/kaldi_related/data_hires_conf_cgn
    for set in  dev-other dev-clean test-other test-clean; do
        input_data=$data_root_path/$set
        output_data=$ivector_extractor/../ivectors_libri_light_hires/$set
        steps/online/nnet2/extract_ivectors_online.sh --nj $nj \
	    $input_data $ivector_extractor $output_data || exit 1;
    done 
fi
#model=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/cgn/s5/exp/chain/bn_layer/tdnn1a_sp_bi_epoch3_inputmfcc_hires_only
if [ $stage -le 0 ] && [ $stop_stage -gt 0 ];then
    data_root_path=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/libri-light/kaldi_related/data_hires_conf_cgn
    #bnf_name=tdnn6
    bnf_name=tdnn6.affine
    for set in  dev-other dev-clean test-other test-clean; do
        input_data=$data_root_path/$set
        output_data=$model/bnf_for_libri_light/$set/
        input_ivec_dir=$model/../../../nnet3/ivectors_libri_light_hires/$set
        steps/nnet3/make_bottleneck_features.sh \
           --cmd run.pl  --nj $nj --ivector-dir $input_ivec_dir \
	   $bnf_name $input_data $output_data $model || exit 1; 
    done
fi
#
#if [ $stage -le 1 ] && [ $stop_stage -gt 1 ];then
#   for set in train_unlab_600 unseg_train_unlab_600 ; do
#       steps/make_mfcc.sh --nj $nj data/$set || exit 1;
#       steps/compute_cmvn_stats.sh data/$set || exit 1;
#   done
#fi
#
#if [ $stage -le 2 ] && [ $stop_stage -gt 2 ];then
#   for set in train_unlab_6k  ; do
#       steps/make_mfcc.sh --nj $nj data/$set || exit 1;
#       steps/compute_cmvn_stats.sh data/$set || exit 1;
#   done
#fi
#
if [ $stage -le 3 ] && [ $stop_stage -gt 3 ];then
   for set in dev test; do
      for cond in clean other; do
	 # (
 	  echo "starting ${set}-${cond}"
          data_file=${set}-${cond}
          input_data=$model/bnf_for_libri_light/$data_file
	  output_path=$model/bnf_for_libri_light_by_utt/$data_file
          foo_path=$output_path/../
          mkdir -p $output_path
	  cp data/$data_file/foo_template.scp $foo_path/foo_${set}-${cond}.scp
   	  sed -i "s| PathToRep| $output_path\/|g"  $foo_path/foo_${set}-${cond}.scp || exit 1
	  #apply-cmvn --utt2spk=ark:data/$data_file/utt2spk scp:data/$data_file/cmvn.scp scp:data/$data_file/feats.scp scp,t:$foo_path/foo_${set}-${cond}.scp || exit 1;
	  copy-feats scp:$input_data/feats.scp scp,t:$foo_path/foo_${set}-${cond}.scp || exit 1;
          echo "${set}-${cond}: starting removing [ and ], will construct .npy.txt files and remove .n ones"
          if [ ! -z $output_path ] ; then
                for file in $output_path/*.n ; do
                    sed -e "/\[/d" -e "s/\]//g" -e "s/^ //g" -e "s/ $//g"  $file  > ${file}py.txt;
                done
                # mkdir -p $output_path/fea_files;
                # rm -f $output_path/*.fea || exit 1;
                find $output_path/ -name "*.n" -delete
		find $output_path/ -name "*.npy" -delete
          fi
 	  echo "${set}-${cond} .npy.txt finished"
	  echo "constructing .npy format "
	  python baseline/convert_txt_npy.py $output_path 

	#  ) &
      done
   done

fi

if   [ $stage -le 5 ] && [ $stop_stage -gt 5 ]; then
   echo "$0: stage 5, evaluated by ABX"
   #conda activate libri-light
   echo "enter (libri-light)"
   source /scratch/siyuanfeng/software/anaconda3/bin/activate libri-light  # enter env: (libri-light)
   module load cuda/10.0
   PYTHONPATH=    # otherwise torchaudio cannot be imported
   echo "reset PYTHONPATH, value=$PYTHONPATH"
   libri_light_root=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/libri-light/
   #for eval_set in dev-clean dev-other test-clean test-other; do
   #for eval_set in dev-clean ; do
   eval_set=$abx_eval_set_appoint
   source_dir=$model/bnf_for_libri_light_by_utt/${eval_set}_npy/
   target_dir=$model/bnf_for_libri_light_by_utt/eval/$eval_set
   mkdir -p $target_dir || exit 1;
   #reason use python3 instead of python is that in ~/.bash_profile I add alias python=@/anaconda3/bin/python, not in @anaconda3/envs/libri-light/bin/python
   python3 ${libri_light_root}/eval/eval_ABX.py $source_dir/ ${libri_light_root}/eval/ABX_src/ABX_data/${eval_set}.item --file_extension .npy --out $target_dir/ --cuda

   #done
   #conda deactivate
   source /scratch/siyuanfeng/software/anaconda3/bin/deactivate # reset
   module load cuda/8.0 # reset
   #. ./path.sh
   PYTHONPAT=./:./src:$KALDI_PYTHON_DIR:$PYTHONPATH # reset
fi

echo "succeeded"
