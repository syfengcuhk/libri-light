#!/bin/bash

#conda activate libri-light
source /scratch/siyuanfeng/software/anaconda3/bin/activate libri-light  # enter env: (libri-light)
eval_set=dev-clean

PoA_list_csl="BI,LA,DA,AL,PO,PA,VE,GL" #"AE,EH,IH,IY,AA,AH,ER,AO,UH,UW,EY,OW,AW,OY,AY,CH,JH,Y,W,R,L,S,TH,SH,F,HH,Z,ZH,DH,V,M,N,NG,K,T,P,G,D,B"

PoA_list=($(echo $PoA_list_csl | tr ',:' ' '))
num_PoAs=${#PoA_list[@]}

echo "total number of PoAs: $num_PoAs"

output_dir=data_by_utt${cmvn_suffix}/eval_by_ABX/per_articulatory_place_category/traverse/${eval_set}
mkdir -p $output_dir
#eval_PoA1=AE
#eval_PoA2=EH
cmvn_suffix=   #_no_cmvn
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
    python ../eval/eval_ABX.py data_by_utt${cmvn_suffix}/${eval_set}_npy/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/traverse_PoA/${eval_set}_${eval_PoA1}_${eval_PoA2}.item --file_extension .npy --out $output_dir/result_${eval_PoA1}_${eval_PoA2} --cuda --max_size_group 250 --max_x_across 5 || echo "-1" > $output_dir/result_${eval_PoA1}_${eval_PoA2}/ABX_scores.json  #mkdir -p $output_dir/result_${eval_PoA1}_${eval_PoA2};
  done
done

#for  eval_PoA1_ind in $(seq 0 $[num_PoAs-2]); do
#  for eval_PoA2_ind in $(seq 0 $eval_PoA1_ind); do
#   eval_PoA1=${PoA_list[$eval_PoA1_ind]}
#   eval_PoA2=${PoA_list[$eval_PoA2_ind]}
#   if [ -d $output_dir/result_${eval_PoA1}_${eval_PoA2}/  ] ; then
#      echo "remove dir: $output_dir/result_${eval_PoA1}_${eval_PoA2}/"
#      rm -rf $output_dir/result_${eval_PoA1}_${eval_PoA2}/
#
#   fi
#   
#  done
#done
