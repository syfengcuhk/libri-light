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
#SBATCH --cpus-per-task=2
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=5000M
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once
#SBATCH --gres=gpu
#SBATCH --mail-type=END

#conda activate libri-light
source /scratch/siyuanfeng/software/anaconda3/bin/activate libri-light  # enter env: (libri-light)
#eval_set=dev-clean
eval_set=dev-other
for category in consts; do  #ST_FR ST_AF FR_AF FR_AP FR_NA AF_AP AF_NA consts  ; do #monophthongs FR_CE FR_BA CE_BA ; do #DOR_LAR #consts_FR_AF_merged  #diphthongs_ended_Y #monophthongs_close #consts_approximant # monophthongs or diphthongs or vowels or consts_unvoic or consts_voiced or consts or (manner of articulation) _{affricate,approximant,stop,nasal,fricative,affricate_stop,affricate_fricative}
  #eval_phone1=AE
  #eval_phone2=EH
  cmvn_suffix=   #_no_cmvn
  articulatory_label_type=articulatory #backness #articulatory_broad_place #articulatory #voicing
  apc_exp_dir=/tudelft.net/staff-bulk/ewi/insy/SpeechLab/siyuanfeng/Autoregressive-Predictive-Coding/exp/unlab_600_full/apc_5L100_feat13_mfcc_cm_e100_tshift5_res.dir/extracted_feats_no_pad
  output_dir=$apc_exp_dir/eval_by_ABX/per_${articulatory_label_type}_category/${eval_set}
  srun mkdir -p $output_dir 
  srun echo "$category"
  srun python ../eval/eval_ABX.py $apc_exp_dir/${eval_set}_-1/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/${articulatory_label_type}_label/${eval_set}_${category}.item --file_extension .pt --out $output_dir/result_${category} --cuda --max_size_group 50 --max_x_across 5
done
  #conda deactivate
  #bash local/rnnlm/tuning/run_lstm_tdnn_1b.sh  --epochs 10 --num-jobs-initial 3 --num-jobs-final 3 --stage 4 --train-stage 8 --use-gpu true --use-gpu-diagnos true 
