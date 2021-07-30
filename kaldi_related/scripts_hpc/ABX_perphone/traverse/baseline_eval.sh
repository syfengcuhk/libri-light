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

phoneme_list_csl="AE,EH,IH,IY,AA,AH,ER,AO,UH,UW,EY,OW,AW,OY,AY,CH,JH,Y,W,R,L,S,TH,SH,F,HH,Z,ZH,DH,V,M,N,NG,K,T,P,G,D,B"

phoneme_list=($(echo $phoneme_list_csl | tr ',:' ' '))
num_phonemes=${#phoneme_list[@]}

echo "total number of phonemes: $num_phonemes"

output_dir=data_by_utt${cmvn_suffix}/eval_by_ABX/per_phone/traverse/${eval_set}
mkdir -p $output_dir
#eval_phone1=AE
#eval_phone2=EH
cmvn_suffix=   #_no_cmvn
for  eval_phone1 in $(seq 0 $[num_phonemes-2]); do
  for eval_phone2 in $(seq $[eval_phone1_ind+1] $[num_phonemes-1]); do
    #srun mkdir -p $output_dir 
    srun python ../eval/eval_ABX.py data_by_utt${cmvn_suffix}/${eval_set}_npy/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/traverse/${eval_set}_${eval_phone1}_${eval_phone2}.item --file_extension .npy --out $output_dir/result_${eval_phone1}_${eval_phone2} --cuda --max_size_group 250 --max_x_across 5 || exit 1;
  done
done
