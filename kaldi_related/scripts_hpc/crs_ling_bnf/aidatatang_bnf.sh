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
##SBATCH --nodelist=ewi3
#SBATCH --mail-type=END


#chain_dnn_model=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/aidatatang_200zh/s5/exp/chain/bnf_layer/tdnn_1a_input_no_ivec_sp
chain_dnn_model=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/software/kaldi/egs/aidatatang_200zh/s5/exp/chain/bnf_layer/tdnn_1a_input_w_ivec_sp
#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 5 --stage 0 --model $chain_dnn_model --abx-eval-set-appoint test-other 

#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --model $chain_dnn_model --abx-eval-set-appoint dev-other 
#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --model $chain_dnn_model --abx-eval-set-appoint dev-clean 
#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --model $chain_dnn_model --abx-eval-set-appoint test-other 
srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --model $chain_dnn_model --abx-eval-set-appoint test-clean 


#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --model $chain_dnn_model --abx-eval-set-appoint dev-other 
#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --model $chain_dnn_model --abx-eval-set-appoint test-other 
#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --model $chain_dnn_model --abx-eval-set-appoint dev-clean 
#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --model $chain_dnn_model --abx-eval-set-appoint test-clean 

#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --abx-eval-set-appoint dev-clean 
#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --abx-eval-set-appoint dev-other
#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --abx-eval-set-appoint test-clean 
#srun bash crs_ling_bnf/aidatatang_bnf.sh --nj 10 --stop-stage 6 --stage 5 --abx-eval-set-appoint test-other 

