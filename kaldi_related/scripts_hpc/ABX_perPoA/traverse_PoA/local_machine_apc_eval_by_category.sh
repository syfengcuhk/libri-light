#!/bin/bash

source /scratch/siyuanfeng/software/anaconda3/bin/activate libri-light  # enter env: (libri-light)
eval_set=dev-clean

PoA_list_csl="BI,LA,DA,AL,PO,PA,VE,GL" #"AE,EH,IH,IY,AA,AH,ER,AO,UH,UW,EY,OW,AW,OY,AY,CH,JH,Y,W,R,L,S,TH,SH,F,HH,Z,ZH,DH,V,M,N,NG,K,T,P,G,D,B"

PoA_list=($(echo $PoA_list_csl | tr ',:' ' '))
num_PoAs=${#PoA_list[@]}

echo "total number of PoAs: $num_PoAs"
apc_exp_dir=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/Autoregressive-Predictive-Coding/exp/unlab_600_full/apc_5L100_feat13_mfcc_cm_e100_tshift5_res.dir/extracted_feats_no_pad
output_dir=$apc_exp_dir/eval_by_ABX/per_articulatory_place_category/traverse/${eval_set}

for  eval_PoA1_ind in $(seq 0 $[num_PoAs-2]); do
  for eval_PoA2_ind in $(seq $[eval_PoA1_ind+1] $[num_PoAs-1]); do
    eval_PoA1=${PoA_list[$eval_PoA1_ind]}
    eval_PoA2=${PoA_list[$eval_PoA2_ind]}
    if [  -s $output_dir/result_${eval_PoA1}_${eval_PoA2}/ABX_scores.json ]; then
      echo "$eval_PoA1 - $eval_PoA2 pairwise ABX error rate already done"
      continue
    fi
    echo "processing $eval_PoA1 - $eval_PoA2 pairwise ABX error rate"
    #mkdir -p $output_dir 
    mkdir -p $output_dir/result_${eval_PoA1}_${eval_PoA2}
    #python ../eval/eval_ABX.py data_by_utt${cmvn_suffix}/${eval_set}_npy/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/traverse/${eval_set}_${eval_PoA1}_${eval_PoA2}.item --file_extension .npy --out $output_dir/result_${eval_PoA1}_${eval_PoA2} --cuda --max_size_group 250 --max_x_across 5 || echo "-1" > $output_dir/result_${eval_PoA1}_${eval_PoA2}/ABX_scores.json  #mkdir -p $output_dir/result_${eval_PoA1}_${eval_PoA2};
    python ../eval/eval_ABX.py $apc_exp_dir/${eval_set}_-1/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/traverse_PoA/${eval_set}_${eval_PoA1}_${eval_PoA2}.item --file_extension .pt --out $output_dir/result_${eval_PoA1}_${eval_PoA2} --cuda --max_size_group 50 --max_x_across 5 || echo "-1" > $output_dir/result_${eval_PoA1}_${eval_PoA2}/ABX_scores.json
  done
done
