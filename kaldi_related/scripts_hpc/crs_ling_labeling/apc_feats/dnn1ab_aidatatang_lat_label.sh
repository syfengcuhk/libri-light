#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=short
# The default run (wall-clock) time is 1 minute
#SBATCH --time=01:10:00
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
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset3600utt" --apc-notation-train-set unlab_600_subset3600utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset3600utt" --apc-notation-train-set unlab_600_subset3600utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 4 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset3600utt" --apc-notation-train-set unlab_600_subset3600utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 5 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint dev-other

#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset900utt" --apc-notation-train-set unlab_600_subset900utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift4_res --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 2 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset900utt" --apc-notation-train-set unlab_600_subset900utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift4_res --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset900utt" --apc-notation-train-set unlab_600_subset900utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift4_res --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 4 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint dev-other

#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset7200utt" --apc-notation-train-set unlab_600_subset7200utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 3 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset7200utt" --apc-notation-train-set unlab_600_subset7200utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 4 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset7200utt" --apc-notation-train-set unlab_600_subset7200utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 5 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint test-other

#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset14400utt" --apc-notation-train-set unlab_600_subset14400utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 0 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 14 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset14400utt" --apc-notation-train-set unlab_600_subset14400utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 2 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset14400utt" --apc-notation-train-set unlab_600_subset14400utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 4 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset14400utt" --apc-notation-train-set unlab_600_subset14400utt --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 5 --train-stage 177 --train-exit-stage 1000 --abx_eval-set-appoint test-other

srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat_6kdata.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_6k --train-subset "" --apc-notation-train-set unlab_6k_full --apc-notation-config apc_5L100_feat13_mfcc_cm_e100_tshift5_res --lat-generator-acwt 10.0 --num-jobs-initial 4 --num-jobs-final 4 --num-epochs 2 --train-stage 1890 --train-exit-stage 10000 --abx_eval-set-appoint test-other #--egs-stage 5
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat_6kdata.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_6k --train-subset "" --apc-notation-train-set unlab_6k_full --apc-notation-config apc_5L100_feat13_mfcc_cm_e100_tshift5_res --lat-generator-acwt 10.0 --num-jobs-initial 4 --num-jobs-final 4 --num-epochs 2 --train-stage 1890 --train-exit-stage 10000 --abx_eval-set-appoint test-other --model-name 1700 #--egs-stage 5


#--train-subset "" --apc-notation-train-set unlab_600_full --apc-notation-config apc_5L100_feat13_mfcc_cm_e100_tshift5_res --lat-generator-acwt 10.0

#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --apc-notation-train-set unlab_600_full --apc-notation-config apc_5L100_feat13_mfcc_cm_e100_tshift5_res --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 268 --train-exit-stage 10000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --apc-notation-train-set unlab_600_full --apc-notation-config apc_5L100_feat13_mfcc_cm_e100_tshift5_res --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 2 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --apc-notation-train-set unlab_600_full --apc-notation-config apc_5L100_feat13_mfcc_cm_e100_tshift5_res --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 4 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/run_dnn1b_by_aidatatang_lat_label_apc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "" --apc-notation-train-set unlab_600_full --apc-notation-config apc_5L100_feat13_mfcc_cm_e100_tshift5_res --lat-generator-acwt 10.0 --num-jobs-initial 3 --num-jobs-final 3 --num-epochs 5 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-other

#apc_notation_train_set=unlab_600_full # or unlab_600_subset3600utt
#apc_notation_config=apc_5L100_feat13_mfcc_cm_e100_tshift5_res
#aidatatang_root_dir=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/cgn/s5/
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
