#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=short
# The default run (wall-clock) time is 1 minute
#SBATCH --time=02:30:00
# The default number of parallel tasks per job is 1
#SBATCH --ntasks=1
# Request 1 CPU per active thread of your program (assume 1 unless you specifically set this)
# The default number of CPUs per task is 1 (note: CPUs are always allocated per 2)
#SBATCH --cpus-per-task=4
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=8G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once
#SBATCH --gres=gpu
#SBATCH --mail-type=END

#conda activate libri-light
eval_set=test-clean
#output_dir=data_by_utt/eval_by_ABX/${eval_set}/
cmvn_suffix=_no_cmvn
output_dir=data_by_utt${cmvn_suffix}/eval_by_ABX/${eval_set}/
srun mkdir -p $output_dir
srun python ../eval/eval_ABX.py data_by_utt${cmvn_suffix}/${eval_set}_npy/ ../eval/ABX_src/ABX_data/${eval_set}.item --file_extension .npy --out $output_dir/result --cuda 
#conda deactivate
#bash local/rnnlm/tuning/run_lstm_tdnn_1b.sh  --epochs 10 --num-jobs-initial 3 --num-jobs-final 3 --stage 4 --train-stage 8 --use-gpu true --use-gpu-diagnos true 
