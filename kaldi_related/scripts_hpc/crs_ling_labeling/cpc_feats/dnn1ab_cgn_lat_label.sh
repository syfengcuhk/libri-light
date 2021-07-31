#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=short
# The default run (wall-clock) time is 1 minute
#SBATCH --time=01:00:00
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

#### Data prep phase
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_cgn_lat_label_cpc_feat.sh --stage 13 --stop-stage 14 --nj-split 30 # 20 for subset900utt, 30 for 3600,7200,14400, 40 for unlab_600(full)

#### Training phase
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_cgn_lat_label_cpc_feat.sh --nj 1 --stage 18 --stop-stage 19 --train-set train_unlab_600 --train-subset "_subset900utt" --cpc-notation-train-set "" --cpc-notation-config "" --lat-generator-acwt 10.0 --num-jobs-initial 2 --num-jobs-final 2 --num-epochs 3 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint dev-other



#### Evaluation phase:
#eval_set=dev-other
#eval_set=test-clean
eval_set=test-other
srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_cgn_lat_label_cpc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset900utt" --cpc-notation-train-set "" --cpc-notation-config "" --lat-generator-acwt 10.0 --num-jobs-initial 1 --num-jobs-final 1 --num-epochs 3 --train-stage 0 --train-exit-stage 1000 --abx_eval-set-appoint $eval_set

#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_cgn_lat_label_cpc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset900utt" --cpc-notation-train-set "" --cpc-notation-config --lat-generator-acwt 10.0 --num-jobs-initial 1 --num-jobs-final 1 --num-epochs 4 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint test-other
#srun bash crs_ling_labeling/cpc_feats/run_dnn1b_by_cgn_lat_label_cpc_feat.sh --nj 1 --stage 23 --stop-stage 24 --train-set train_unlab_600 --train-subset "_subset900utt" --cpc-notation-train-set "" --cpc-notation-config --lat-generator-acwt 10.0 --num-jobs-initial 1 --num-jobs-final 1 --num-epochs 5 --train-stage -10 --train-exit-stage 1000 --abx_eval-set-appoint test-other

