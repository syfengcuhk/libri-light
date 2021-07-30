#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=short
# The default run (wall-clock) time is 1 minute
#SBATCH --time=03:00:00
# The default number of parallel tasks per job is 1
#SBATCH --ntasks=1
# Request 1 CPU per active thread of your program (assume 1 unless you specifically set this)
# The default number of CPUs per task is 1 (note: CPUs are always allocated per 2)
#SBATCH --cpus-per-task=4
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=4G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once
#SBATCH --gres=gpu
#SBATCH --mail-type=END
#conda activate libri-light
source /scratch/siyuanfeng/software/anaconda3/bin/activate libri-light  # enter env: (libri-light)
eval_set=dev-clean

PoA_list_csl="BI,LA,DA,AL,PO,PA,VE,GL" #"AE,EH,IH,IY,AA,AH,ER,AO,UH,UW,EY,OW,AW,OY,AY,CH,JH,Y,W,R,L,S,TH,SH,F,HH,Z,ZH,DH,V,M,N,NG,K,T,P,G,D,B"

PoA_list=($(echo $PoA_list_csl | tr ',:' ' '))
num_PoAs=${#PoA_list[@]}

echo "total number of PoAs: $num_PoAs"

#output_dir=exp/chain_aidatatang_lat_label/train_unlab_600/lat_gen_acwt10.0/apc_feats_unlab_600_full/apc_5L100_feat13_mfcc_cm_e100_tshift5_res/dnn1b_bi_epoch3/bnf_for_libri_light_by_utt/eval/per_articulatory_place_category/traverse/$eval_set/ #data_by_utt${cmvn_suffix}/eval_by_ABX/per_phone/traverse/${eval_set}
output_dir=exp/chain_aidatatang_lat_label/train_unlab_600/lat_gen_acwt10.0/dnn1b_bi_epoch5_inputmfcc_hires_pitch_only/bnf_for_libri_light_by_utt/eval/per_articulatory_place_category/traverse/$eval_set/

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
    python ../eval/eval_ABX.py $output_dir/../../../../${eval_set}_npy/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/traverse_PoA/${eval_set}_${eval_PoA1}_${eval_PoA2}.item --file_extension .npy --out $output_dir/result_${eval_PoA1}_${eval_PoA2} --cuda --max_size_group 250 --max_x_across 5 || echo "-1" > $output_dir/result_${eval_PoA1}_${eval_PoA2}/ABX_scores.json
  done
done
