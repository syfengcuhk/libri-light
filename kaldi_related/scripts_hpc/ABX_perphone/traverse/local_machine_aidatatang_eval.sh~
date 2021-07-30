#!/bin/bash

#conda activate libri-light
source /scratch/siyuanfeng/software/anaconda3/bin/activate libri-light  # enter env: (libri-light)
eval_set=dev-clean

phoneme_list_csl="AE,EH,IH,IY,AA,AH,ER,AO,UH,UW,EY,OW,AW,OY,AY,CH,JH,Y,W,R,L,S,TH,SH,F,HH,Z,ZH,DH,V,M,N,NG,K,T,P,G,D,B"

phoneme_list=($(echo $phoneme_list_csl | tr ',:' ' '))
num_phonemes=${#phoneme_list[@]}

echo "total number of phonemes: $num_phonemes"

output_dir=exp/chain_aidatatang_lat_label/train_unlab_600/lat_gen_acwt10.0/apc_feats_unlab_600_full/apc_5L100_feat13_mfcc_cm_e100_tshift5_res/dnn1b_bi_epoch3/bnf_for_libri_light_by_utt/eval/per_phone/traverse/$eval_set/ #data_by_utt${cmvn_suffix}/eval_by_ABX/per_phone/traverse/${eval_set}
#output_dir=exp/chain_aidatatang_lat_label/train_unlab_600/lat_gen_acwt10.0/dnn1b_bi_epoch5_inputmfcc_hires_pitch_only/bnf_for_libri_light_by_utt/eval/per_phone/traverse/$eval_set/

mkdir -p $output_dir
#eval_phone1=AE
#eval_phone2=EH
cmvn_suffix=   #_no_cmvn
for  eval_phone1_ind in $(seq 0 $[num_phonemes-2]); do
  for eval_phone2_ind in $(seq $[eval_phone1_ind+1] $[num_phonemes-1]); do
    eval_phone1=${phoneme_list[$eval_phone1_ind]}
    eval_phone2=${phoneme_list[$eval_phone2_ind]}
    if [  -s $output_dir/result_${eval_phone1}_${eval_phone2}/ABX_scores.json ]; then
      echo "$eval_phone1 - $eval_phone2 pairwise ABX error rate already done"
      continue
    fi
    echo "processing $eval_phone1 - $eval_phone2 pairwise ABX error rate"
    #mkdir -p $output_dir 
    mkdir -p $output_dir/result_${eval_phone1}_${eval_phone2}
    python ../eval/eval_ABX.py $output_dir/../../../../${eval_set}_npy/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/traverse/${eval_set}_${eval_phone1}_${eval_phone2}.item --file_extension .npy --out $output_dir/result_${eval_phone1}_${eval_phone2} --cuda --max_size_group 250 --max_x_across 5 || echo "-1" > $output_dir/result_${eval_phone1}_${eval_phone2}/ABX_scores.json
  done
done
