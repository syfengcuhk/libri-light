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
#SBATCH --cpus-per-task=4
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=8G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once

#SBATCH --gres=gpu
#SBATCH --exclude=ewi3
#SBATCH --mail-type=END

#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset900utt --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 5 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset900utt --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 2 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset900utt --lat-generator-acwt 10.0 --num-jobs-initial 1 --num-jobs-final 1 --num-epochs 3 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset900utt --lat-generator-acwt 10.0 --num-jobs-initial 1 --num-jobs-final 1 --num-epochs 4 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint test-clean
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset7200utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset7200utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset7200utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 4 --train-stage -10 --train-exit-stage 10000 --abx_eval-set-appoint test-clean
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset14400utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset14400utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset14400utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 4 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --nj 20  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset900utt --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint test-clean
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --nj 8  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset3600utt --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 5 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1a_by_cgn_lat_label.sh --nj 8  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset3600utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1a_by_cgn_lat_label.sh --nj 8  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset3600utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 4 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1a_by_cgn_lat_label.sh --nj 8  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset3600utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 5 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint dev-clean
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset3600utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint test-clean
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset3600utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 4 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint dev-clean
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset3600utt --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 5 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-clean
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage 0 --model-name 200 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 357 --train-exit-stage 1000 --abx_eval-set-appoint test-clean
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 4 --num-jobs-final 4 --num-epochs 4 --train-stage 339 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1a_by_cgn_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint test-clean
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --nj 3  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset3600utt --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 10 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --nj 3  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset7200utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 5 --train-stage 87 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --nj 1  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset7200utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --nj 8  --stage 19 --stop-stage 23 --train-set train_unlab_600 --train-subset _subset14400utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 8 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint test-other --model-name 200
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --nj 8  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset _subset14400utt --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --model-name 500 --nj 8  --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 5 --train-stage 5 --train-exit-stage 1000 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --model-name 400 --nj 4 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 5 --train-stage 5 --train-exit-stage 1000 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --model-name 300 --nj 4 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 5 --train-stage 5 --train-exit-stage 1000 --train-exit-stage 1000 --abx_eval-set-appoint dev-clean
#srun bash crs_ling_labeling/run_tdnn1a_by_cgn_lat_label.sh --model-name 200 --nj 4 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 5 --train-stage 5 --train-exit-stage 1000 --train-exit-stage 1000 --abx_eval-set-appoint test-other
srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh  --nj 80 --stage 23 --stop-stage 24 --train-set train_unlab_6k --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage 2410 --train-exit-stage 100000 --egs-stage 5  --abx_eval-set-appoint dev-other --align-fmllr-lats-stage 2
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh  --nj 80 --stage 23 --stop-stage 24 --train-set train_unlab_6k --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage 0 --train-exit-stage 100000 --egs-stage 5  --abx_eval-set-appoint test-clean --align-fmllr-lats-stage 2 --model-name 1500
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh  --nj 80 --stage 23 --stop-stage 24 --train-set train_unlab_6k --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage 0 --train-exit-stage 100000 --egs-stage 5  --abx_eval-set-appoint test-other --align-fmllr-lats-stage 2 --model-name 1800
#srun bash crs_ling_labeling/run_dnn1b_by_cgn_lat_label.sh  --nj 80 --stage 23 --stop-stage 24 --train-set train_unlab_6k --train-subset "" --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 2 --train-stage 0 --train-exit-stage 100000 --egs-stage 5  --abx_eval-set-appoint dev-other --align-fmllr-lats-stage 2 --model-name 2100
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
