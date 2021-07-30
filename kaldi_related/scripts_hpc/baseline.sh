#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=short
# The default run (wall-clock) time is 1 minute
#SBATCH --time=04:00:00
# The default number of parallel tasks per job is 1
#SBATCH --ntasks=1
# Request 1 CPU per active thread of your program (assume 1 unless you specifically set this)
# The default number of CPUs per task is 1 (note: CPUs are always allocated per 2)
#SBATCH --cpus-per-task=60
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=55G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once
##SBATCH --gres=gpu:3
#SBATCH --mail-type=END

#srun bash baseline/make_feats.sh --nj 60 --stop-stage 3 --stage 2
#srun bash baseline/make_feats_no_cmvn.sh --nj 60 --stop-stage 4 --stage 3
#srun bash baseline/make_feats_fbank.sh --nj 60 --stop-stage 4 --stage 3 
#srun bash baseline/make_feats_fbank_no_cmvn.sh --nj 60 --stop-stage 4 --stage 3
#srun bash baseline/make_feats_hires.sh --nj 40 --stop-stage 5 --stage 4 
#srun bash baseline/make_feats_hires.sh --nj 20 --stop-stage 6 --stage 5 
#srun bash baseline/make_feats_hires.sh --nj 60 --stop-stage 3 --stage 2 

#srun bash baseline/make_feats_hires_conf_aidatatang.sh --nj 90 --stage 2 --stop-stage 3
srun bash baseline/make_feats_hires_pitch_conf_aidatatang.sh --nj 90 --stage 2 --stop-stage 3


 
