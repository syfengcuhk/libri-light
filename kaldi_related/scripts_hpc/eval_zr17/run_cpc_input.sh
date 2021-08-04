#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=short
# The default run (wall-clock) time is 1 minute
#SBATCH --time=01:30:00
# The default number of parallel tasks per job is 1
#SBATCH --ntasks=1
# Request 1 CPU per active thread of your program (assume 1 unless you specifically set this)
# The default number of CPUs per task is 1 (note: CPUs are always allocated per 2)
#SBATCH --cpus-per-task=20
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=30G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once
##SBATCH --gres=gpu
#SBATCH --mail-type=END

# Stage1: extract BNF. 
# Stage2: prepare data ready for ABX error computation
language=english
#duration=1s #10s 120s
#duration=10s #10s 120s
duration=120s #10s 120s
#srun bash crs_ling_labeling/eval_zr17/run_cgn_label_cpc_input.sh --stage 2 --stop-stage 3 --lang-appoint $language --dur-appoint $duration


# Stage3: ABX error computation
nj=8
srun bash crs_ling_labeling/eval_zr17/run_cgn_label_cpc_input.sh --stage 3 --stop-stage 4 --lang-appoint $language --dur-appoint $duration --nj $nj
