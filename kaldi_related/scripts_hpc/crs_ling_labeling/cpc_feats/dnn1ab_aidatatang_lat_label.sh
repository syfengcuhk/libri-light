#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=long
# The default run (wall-clock) time is 1 minute
#SBATCH --time=06:00:00
# The default number of parallel tasks per job is 1
#SBATCH --ntasks=1
# Request 1 CPU per active thread of your program (assume 1 unless you specifically set this)
# The default number of CPUs per task is 1 (note: CPUs are always allocated per 2)
#SBATCH --cpus-per-task=8
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=10G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once
#SBATCH --gres=gpu:2
#SBATCH --nodelist=ewi4
##SBATCH --exclude=ewi3
#SBATCH --mail-type=END
##SBATCH --dependency=afterok:6616160

#### Data prep phase
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --stage 13 --stop-stage 14 --nj-split 10 --train-subset "_subset900utt" # 10 for subset900utt, 20 for 3600,7200,14400, 30 for unlab_600(full)
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --stage 13 --stop-stage 14 --nj-split 20 --train-subset "_subset3600utt" # 10 for subset900utt, 20 for 3600,7200,14400, 30 for unlab_600(full)
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --stage 13 --stop-stage 14 --nj-split 20 --train-subset "_subset7200utt" # 10 for subset900utt, 20 for 3600,7200,14400, 30 for unlab_600(full)
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --stage 13 --stop-stage 14 --nj-split 20 --train-subset "_subset14400utt" # 10 for subset900utt, 20 for 3600,7200,14400, 30 for unlab_600(full)
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --stage 13 --stop-stage 14 --nj-split 30 --train-subset "" # 10 for subset900utt, 20 for 3600,7200,14400, 30 for unlab_600(full)

#### Training phase
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --nj 1 --stage 18 --stop-stage 19 --train-set train_unlab_600 --train-subset "_subset900utt" --cpc-notation-train-set "" --cpc-notation-config "" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --nj 1 --stage 18 --stop-stage 19 --train-set train_unlab_600 --train-subset "_subset3600utt" --cpc-notation-train-set "" --cpc-notation-config "" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --nj 1 --stage 18 --stop-stage 19 --train-set train_unlab_600 --train-subset "_subset7200utt" --cpc-notation-train-set "" --cpc-notation-config "" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --nj 1 --stage 18 --stop-stage 19 --train-set train_unlab_600 --train-subset "_subset14400utt" --cpc-notation-train-set "" --cpc-notation-config "" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-other
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --nj 1 --stage 18 --stop-stage 19 --train-set train_unlab_600 --train-subset "" --cpc-notation-train-set "" --cpc-notation-config "" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 350 --train-exit-stage 700 --abx_eval-set-appoint dev-other

#### Training phase with alternative epoch numbers
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --nj 1 --stage 18 --stop-stage 19 --train-set train_unlab_600 --train-subset "_subset900utt" --cpc-notation-train-set "" --cpc-notation-config "" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 4 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-other --common-egs-dir "exp/chain_aidatatang_lat_label/train_unlab_600_subset900utt/lat_gen_acwt10.0/cpc_feats/dnn1b_bi_epoch3/egs/"
srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_aidatatang_lat_label_cpc_feat.sh --nj 1 --stage 18 --stop-stage 19 --train-set train_unlab_600 --train-subset "" --cpc-notation-train-set "" --cpc-notation-config "" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 4 --train-stage 339 --train-exit-stage 770 --abx_eval-set-appoint dev-other --common-egs-dir  "exp/chain_aidatatang_lat_label/train_unlab_600/lat_gen_acwt10.0/cpc_feats/dnn1b_bi_epoch3/egs/"



#### Evaluation phase refer to ./eval_dnn1ab_aidatatang_lat_label.sh
