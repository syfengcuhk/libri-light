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
#SBATCH --mem=20G
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once

##SBATCH --gres=gpu
##SBATCH --nodelist=ewi3

#SBATCH --mail-type=END

#srun bash baseline/make_feats.sh --nj 60 --stop-stage 3 --stage 2
#srun bash baseline/make_feats_no_cmvn.sh --nj 60 --stop-stage 4 --stage 3
#srun bash baseline/make_feats_fbank.sh --nj 60 --stop-stage 4 --stage 3 
#srun bash crs_ling_labeling/cgn_labeling.sh --nj 20 --decode-nj 20 --num-threads-decode 2 --stage 0 --stop-stage 1
#srun bash crs_ling_labeling/cgn_labeling.sh --nj 20 --decode-nj 30 --stage 0 --stop-stage 1 --post-decode-acwt 1 --suffix-decode-dir "_post_dec_acwt1" 
#srun bash crs_ling_labeling/cgn_labeling.sh --nj 20 --decode-nj 10 --num-threads-decode 6 --stage 1 --stop-stage 2 
#srun bash crs_ling_labeling/cgn_labeling.sh --nj 20 --decode-nj 10 --train-name train_unlab_600_subset3600utt --num-threads-decode 4 --stage 1 --stop-stage 2 --decode-fmllr-stage 2 #main lattice generation #4 doing a final pass of acoustic rescoring
#srun bash crs_ling_labeling/cgn_labeling.sh --nj 20 --decode-nj 30 --stage 0 --stop-stage 1 


#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600_subset3600utt --nj 20 --decode-nj 10 --num-threads-decode 4 --stage 0 --stop-stage 1 --acwt 20.0
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600 --nj 20 --decode-nj 10 --num-threads-decode 4 --stage 0 --stop-stage 1 --acwt 10.0
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600_subset7200utt --nj 20 --decode-nj 10 --num-threads-decode 4 --stage 0 --stop-stage 1 --acwt 10.0
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600_subset7200utt --nj 20 --decode-nj 10 --num-threads-decode 6 --stage 0 --stop-stage 1 
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600_subset14400utt --nj 20 --decode-nj 10 --num-threads-decode 6 --stage -1 --stop-stage 0 
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600_subset14400utt --nj 20 --decode-nj 10 --num-threads-decode 4 --stage 0 --stop-stage 1 --acwt 10.0
#srun bash crs_ling_labeling/cgn_labeling.sh --nj 20 --decode-nj 1 --num-threads-decode 3 --stage 2 --stop-stage 3 --beam 30 --lattice-beam 16 # dev-clean decoding 
#srun bash crs_ling_labeling/cgn_labeling.sh --stage 4 --stop-stage 5 --make-fbank-nj 40 --decode-nj 10 --num-threads-decode 3 --train-name train_unlab_600_subset3600utt --acwt 1.0
#srun bash crs_ling_labeling/cgn_labeling.sh --stage 4 --stop-stage 5 --make-fbank-nj 40 --decode-nj 10 --num-threads-decode 3 --train-name train_unlab_600_subset3600utt --acwt 0.3 


#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600_subset900utt --nj 20 --decode-nj 10 --num-threads-decode 4 --stage 7 --stop-stage 8 --acwt 10.0
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600_subset3600utt --nj 20 --decode-nj 10 --num-threads-decode 4 --stage 5 --stop-stage 6 --acwt 10.0
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600_subset3600utt --nj 20 --decode-nj 10 --num-threads-decode 4 --stage 7 --stop-stage 8 --acwt 10.0
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600_subset7200utt --nj 40 --decode-nj 10 --num-threads-decode 4 --stage 7 --stop-stage 8 --acwt 10.0
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600_subset14400utt --nj 40 --decode-nj 10 --num-threads-decode 4 --stage 7 --stop-stage 8 --acwt 10.0
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_600 --nj 40 --decode-nj 10 --num-threads-decode 4 --stage 7 --stop-stage 8 --acwt 10.0
#srun bash crs_ling_labeling/cgn_labeling.sh --train-name train_unlab_6k --nj 80 --decode-nj 20 --num-threads-decode 4 --stage 7 --stop-stage 8 --acwt 10.0 --align-fmllr-stage 2

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
