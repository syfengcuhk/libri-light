#!/bin/sh
#you can control the resources and scheduling with '#SBATCH' settings
# (see 'man sbatch' for more information on setting these parameters)
# The default partition is the 'general' partition
#SBATCH --partition=general
# The default Quality of Service is the 'short' QoS (maximum run time: 4 hours)
#SBATCH --qos=short
# The default run (wall-clock) time is 1 minute
#SBATCH --time=00:40:00
# The default number of parallel tasks per job is 1
#SBATCH --ntasks=1
# Request 1 CPU per active thread of your program (assume 1 unless you specifically set this)
# The default number of CPUs per task is 1 (note: CPUs are always allocated per 2)
#SBATCH --cpus-per-task=2
# The default memory per node is 1024 megabytes (1GB) (for multiple tasks, specify --mem-per-cpu instead)
#SBATCH --mem=2500M
# Set mail type to 'END' to receive a mail when the job finishes
# Do not enable mails when submitting large numbers (>20) of jobs at once
#SBATCH --gres=gpu
#SBATCH --mail-type=END

#conda activate libri-light
source /scratch/siyuanfeng/software/anaconda3/bin/activate libri-light  # enter env: (libri-light)
eval_set=dev-clean
for category in monophthongs_revised_OS_front monophthongs_revised_OS_central monophthongs_revised_OS_back monophthongs_revised_OS_mid monophthongs_revised_OS_open; do #consts_DORSAL #diphthongs_ended_Y #monophthongs_close #consts_affricate_fricative # monophthongs or diphthongs or vowels or consts_unvoic or consts_voiced or consts or (manner of articulation) _{affricate,approximant,stop,nasal,fricative,affricate_fricative,affricate_stop}
  #category=vowels # monophthongs or diphthongs or vowels or consts_unvoic or consts_voiced or consts
  #eval_phone1=AO
  #eval_phone2=UW
  
  output_dir=exp/chain_cgn_lat_label/train_unlab_600/lat_gen_acwt10.0/apc_feats_unlab_600_full/apc_5L100_feat13_mfcc_cm_e100_tshift5_res/dnn1b_bi_epoch4/bnf_for_libri_light_by_utt/eval/per_phone/$eval_set/result_${category}
  srun mkdir -p $output_dir
  srun echo "$category"
  srun python ../eval/eval_ABX.py $output_dir/../../../../${eval_set}_npy/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/${eval_set}_${category}.item --file_extension .npy --out $output_dir --cuda --max_size_group 50 --max_x_across 5
  
#   output_dir=exp/chain_cgn_lat_label/train_unlab_600/lat_gen_acwt10.0/dnn1b_bi_epoch3_inputmfcc_hires_only/bnf_for_libri_light_by_utt/eval/per_phone/$eval_set/result_${category}
#   srun echo "$category"
#   srun mkdir -p $output_dir
#   srun python ../eval/eval_ABX.py $output_dir/../../../../${eval_set}_npy/ ../eval_ABX_personal/ABX_src/ABX_data/output_items/${eval_set}_${category}.item --file_extension .npy --out $output_dir --cuda --max_size_group 50 --max_x_across 5
done
