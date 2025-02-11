#!/bin/bash

source /scratch/siyuanfeng/software/anaconda3/bin/activate libri-light  # enter env: (libri-light)
eval_set=dev-clean

phoneme_list_csl="AE,EH,IH,IY,AA,AH,ER,AO,UH,UW,EY,OW,AW,OY,AY,CH,JH,Y,W,R,L,S,TH,SH,F,HH,Z,ZH,DH,V,M,N,NG,K,T,P,G,D,B"

phoneme_list=($(echo $phoneme_list_csl | tr ',:' ' '))
num_phonemes=${#phoneme_list[@]}

echo "total number of phonemes: $num_phonemes"
apc_exp_dir=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/Autoregressive-Predictive-Coding/exp/unlab_600_full/apc_5L100_feat13_mfcc_cm_e100_tshift5_res.dir/extracted_feats_no_pad
output_dir=$apc_exp_dir/eval_by_ABX/per_phone/traverse/${eval_set}

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
    #python ../eval/eval_ABX.py data_by_utt${cmvn_suffix}/${eval_set}_npy/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/traverse/${eval_set}_${eval_phone1}_${eval_phone2}.item --file_extension .npy --out $output_dir/result_${eval_phone1}_${eval_phone2} --cuda --max_size_group 250 --max_x_across 5 || echo "-1" > $output_dir/result_${eval_phone1}_${eval_phone2}/ABX_scores.json  #mkdir -p $output_dir/result_${eval_phone1}_${eval_phone2};
    python ../eval/eval_ABX.py $apc_exp_dir/${eval_set}_-1/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/traverse/${eval_set}_${eval_phone1}_${eval_phone2}.item --file_extension .pt --out $output_dir/result_${eval_phone1}_${eval_phone2} --cuda --max_size_group 50 --max_x_across 5 || echo "-1" > $output_dir/result_${eval_phone1}_${eval_phone2}/ABX_scores.json
  done
done
