#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=short
# The default run (wall-clock) time is 1 minute
#SBATCH --time=02:00:00
# The default number of parallel tasks per job is 1
#SBATCH --ntasks=1
# Request 1 CPU per active thread of your program (assume 1 unless you specifically set this)
# The default number of CPUs per task is 1 (note: CPUs are always allocated per 2)
#SBATCH --cpus-per-task=2
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=4G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once
#SBATCH --gres=gpu
#SBATCH --mail-type=END

cmvn_suffix=_no_cmvn
feat=_fbank

#set_name=dev-clean
#set_name=dev-other
#set_name=test-clean
set_name=test-other
srun mkdir -p data${feat}_by_utt${cmvn_suffix}/eval_by_ABX/${set_name}/ 
srun python ../eval/eval_ABX.py data${feat}_by_utt${cmvn_suffix}/${set_name}_npy/ ../eval/ABX_src/ABX_data/${set_name}.item --file_extension .npy --out data${feat}_by_utt${cmvn_suffix}/eval_by_ABX/${set_name}/ --cuda 



wait
echo "finished"

