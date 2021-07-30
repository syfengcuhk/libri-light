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
#SBATCH --cpus-per-task=4
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=8G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once

##SBATCH --gres=gpu
##SBATCH --nodelist=ewi3

#SBATCH --mail-type=END

srun bash crs_ling_labeling/cgn_labeling.sh --nj 20 --decode-nj 20 --num-threads-decode 4 --stage 11 --stop-stage 13 --acwt 10.0 --eval-set-appoint test-other  #--align-fmllr-stage 2

#post_decode_acwt=10.0
#train_name=train_unlab_600
#suffix_decode_dir=
#nj=1
#num_threads_decode=1
#decode_nj=1
#stage=0
#stop_stage=1
#model=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/cgn/s5/exp/chain/bn_layer/tdnn1a_sp_bi_epoch3_inputmfcc_hires_only

#abx_eval_set_appoint=dev-clean
