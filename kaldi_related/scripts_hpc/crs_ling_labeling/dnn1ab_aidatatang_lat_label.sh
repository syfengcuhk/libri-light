#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=short
# The default run (wall-clock) time is 1 minute
#SBATCH --time=1:20:00
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
##SBATCH --exclude=ewi3
#SBATCH --mail-type=END
##SBATCH --dependency=afterok:

#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 10 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset900utt --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset900utt --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 2 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint test-clean
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset900utt --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 4 --train-stage -10 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset900utt --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 5 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset3600utt" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 2 --train-stage -10 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset3600utt" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage -10 --train-exit-stage 10000 --abx_eval-set-appoint test-clean
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset3600utt" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 4 --train-stage -10 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset7200utt" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset7200utt" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 4 --train-stage -10 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset7200utt" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 2 --train-stage -10 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset14400utt" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset14400utt" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage -10 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset14400utt" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 4 --train-stage -10 --train-exit-stage 10000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 30  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 125 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 30  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage 38 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 4 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 5 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1a_by_aidatatang_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint test-clean
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 60  --stage 18 --stop-stage 19 --train-set train_unlab_6k --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage 313 --train-exit-stage 600  --abx_eval-set-appoint test-clean --egs-stage 5 --egs-nj 30  --align-fmllr-lats-stage 2
srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label.sh --nj 60  --stage 23 --stop-stage 24 --train-set train_unlab_6k --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage 2370 --train-exit-stage 2670  --abx_eval-set-appoint test-clean --egs-stage 5 --egs-nj 30  --align-fmllr-lats-stage 2 --model-name 1500 #1800 #2100
#post_decode_acwt=10.0
#train_name=train_unlab_600
#suffix_decode_dir=
#nj=1
#num_threads_decode=1
#decode_nj=1
#stage=0
#stop_stage=1
#abx_eval_set_appoint=dev-clean
