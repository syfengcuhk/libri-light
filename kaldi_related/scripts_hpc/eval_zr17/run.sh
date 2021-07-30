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
#SBATCH --cpus-per-task=20
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=9G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once

##SBATCH --gres=gpu
##SBATCH --nodelist=grs2

#SBATCH --mail-type=END

#srun bash crs_ling_labeling/eval_zr17/run.sh --stage 3 --stop-stage 4 --nj 1 --num-epochs 4 --lang-appoint mandarin --dur-appoint 1s
#srun bash crs_ling_labeling/eval_zr17/run_aidatatang_label.sh --stage 3 --stop-stage 4 --nj 1 --nj-ivector 12 --num-epochs 5 --lang-appoint mandarin --dur-appoint 120s 


subset_name=_subset14400utt
#srun bash crs_ling_labeling/eval_zr17/run.sh --train-subset $subset_name --apc-notation-train-set unlab_600$subset_name --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --stage 3 --stop-stage 4 --nj 1 --num-epochs 3 --lang-appoint mandarin --dur-appoint 120s 
#srun bash crs_ling_labeling/eval_zr17/run_aidatatang_label.sh --train-subset $subset_name --apc-notation-train-set unlab_600$subset_name --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --stage 3 --stop-stage 4 --nj 1 --num-epochs 3 --lang-appoint mandarin --dur-appoint 120s 

subset_name=_subset7200utt
#srun bash crs_ling_labeling/eval_zr17/run.sh --train-subset $subset_name --apc-notation-train-set unlab_600$subset_name --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --stage 3 --stop-stage 4 --nj 1 --num-epochs 5 --lang-appoint mandarin --dur-appoint 1s
#srun bash crs_ling_labeling/eval_zr17/run_aidatatang_label.sh --train-subset $subset_name --apc-notation-train-set unlab_600$subset_name --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --stage 3 --stop-stage 4 --nj 1 --num-epochs 3 --lang-appoint mandarin --dur-appoint 120s

subset_name=_subset3600utt
#srun bash crs_ling_labeling/eval_zr17/run.sh --train-subset $subset_name --apc-notation-train-set unlab_600$subset_name --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --stage 3 --stop-stage 4 --nj 1 --num-epochs 4 --lang-appoint mandarin --dur-appoint 1s
#srun bash crs_ling_labeling/eval_zr17/run_aidatatang_label.sh --train-subset $subset_name --apc-notation-train-set unlab_600$subset_name --apc-notation-config apc_3L100_feat13_mfcc_cm_e100_tshift3_res --stage 3 --stop-stage 4 --nj 1 --num-epochs 3 --lang-appoint mandarin --dur-appoint 120s

# 6k
train_set_name=train_unlab_6k
#srun bash crs_ling_labeling/eval_zr17/run.sh --train-set $train_set_name --apc-notation-train-set unlab_6k_full --apc-notation-config apc_5L100_feat13_mfcc_cm_e100_tshift5_res --stage 3 --stop-stage 4 --nj 1 --num-epochs 2 --lang-appoint mandarin --dur-appoint 120s
srun bash crs_ling_labeling/eval_zr17/run_aidatatang_label.sh --train-set $train_set_name --apc-notation-train-set unlab_6k_full --apc-notation-config apc_5L100_feat13_mfcc_cm_e100_tshift5_res --stage 3 --stop-stage 4 --nj 1 --num-epochs 2 --lang-appoint mandarin --dur-appoint 1s

#train_set=train_unlab_600
#apc_notation_train_set=unlab_600_full # or unlab_600_subset3600utt
#num_epochs=5
#lang_appoint=english
#dur_appoint=120s
#tdnn_affix=1b
#apc_notation_config=apc_5L100_feat13_mfcc_cm_e100_tshift5_res
#lat_generator_acwt=10.0
#train_subset= # can be left blank, or _subset3600utt etc.
