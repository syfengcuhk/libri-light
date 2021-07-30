#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=short
# The default run (wall-clock) time is 1 minute
#SBATCH --time=00:40:00
# The default number of parallel tasks per job is 1
#SBATCH --ntasks=1
# Request 1 CPU per active thread of your program (assume 1 unless you specifically set this)
# The default number of CPUs per task is 1 (note: CPUs are always allocated per 2)
#SBATCH --cpus-per-task=2
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=1800M
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once
#SBATCH --gres=gpu
#SBATCH --mail-type=END

#conda activate libri-light
source /scratch/siyuanfeng/software/anaconda3/bin/activate libri-light  # enter env: (libri-light)
eval_set=dev-clean
category=monophthongs_revised_OS_central #consts_CORONAL #diphthongs_ended_Y #monophthongs_close #consts_affricate_stop # monophthongs or diphthongs or vowels or consts_unvoic or consts_voiced or consts or (manner of articulation) _{affricate,approximant,stop,nasal,fricative,affricate_fricative,affricate_stop,} or _monophthongs_{back,front_central,close,open}
#eval_phone1=AE
#eval_phone2=EH
cmvn_suffix=   #_no_cmvn
output_dir=data_by_utt${cmvn_suffix}/eval_by_ABX/per_phone/${eval_set}
srun echo "$category"
srun mkdir -p $output_dir 
srun python ../eval/eval_ABX.py data_by_utt${cmvn_suffix}/${eval_set}_npy/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/${eval_set}_${category}.item --file_extension .npy --out $output_dir/result_${category} --cuda --max_size_group 50 --max_x_across 5
#conda deactivate
#bash local/rnnlm/tuning/run_lstm_tdnn_1b.sh  --epochs 10 --num-jobs-initial 3 --num-jobs-final 3 --stage 4 --train-stage 8 --use-gpu true --use-gpu-diagnos true 
