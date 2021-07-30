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
#SBATCH --nodes=2
#SBATCH --ntasks=2
# Request 1 CPU per active thread of your program (assume 1 unless you specifically set this)
# The default number of CPUs per task is 1 (note: CPUs are always allocated per 2)
#SBATCH --cpus-per-task=4
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=4G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once
#SBATCH --gres=gpu:2
#SBATCH --mail-type=END

#for eval_set in dev-clean dev-other ; do
cmvn_suffix=_no_cmvn
srun mkdir -p data_by_utt${cmvn_suffix}/eval_by_ABX_try_4jobs/dev-clean/ 
srun mkdir -p data_by_utt${cmvn_suffix}/eval_by_ABX_try_4jobs/dev-other/ 
srun mkdir -p data_by_utt${cmvn_suffix}/eval_by_ABX_try_4jobs/test-clean/ 
srun mkdir -p data_by_utt${cmvn_suffix}/eval_by_ABX_try_4jobs/test-other/ 
  


srun python ../eval/eval_ABX.py data_by_utt${cmvn_suffix}/dev-clean_npy/ ../eval/ABX_src/ABX_data/dev-clean.item --file_extension .npy --out data_by_utt${cmvn_suffix}/eval_by_ABX_try_4jobs/dev-clean/ --cuda &
srun python ../eval/eval_ABX.py data_by_utt${cmvn_suffix}/dev-other_npy/ ../eval/ABX_src/ABX_data/dev-other.item --file_extension .npy --out data_by_utt${cmvn_suffix}/eval_by_ABX_try_4jobs/dev-other/ --cuda &

#srun python ../eval/eval_ABX.py data_by_utt${cmvn_suffix}/test-clean_npy/ ../eval/ABX_src/ABX_data/test-clean.item --file_extension .npy --out data_by_utt${cmvn_suffix}/eval_by_ABX_try_4jobs/test-clean/ --cuda
#srun python ../eval/eval_ABX.py data_by_utt${cmvn_suffix}/test-other_npy/ ../eval/ABX_src/ABX_data/test-other.item --file_extension .npy --out data_by_utt${cmvn_suffix}/eval_by_ABX_try_4jobs/test-other/ --cuda
#done


wait
echo "finished"

