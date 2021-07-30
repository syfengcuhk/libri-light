#!/bin/bash
. ./cmd.sh
. ./path.sh
stage=3
. utils/parse_options.sh
model_dir=/lan/dspIceberg/siyuan/kaldi/multilingual/egs/cusent/s5/exp/nnet3/tdnn1a_bn_noivec_sp
gmm_dir=/lan/dspIceberg/siyuan/kaldi/multilingual/egs/cusent/s5/exp/tri3b
conf_dir=/lan/dspIceberg/siyuan/kaldi/multilingual/egs/cusent/s5/conf
word_dir=/lan/dspIceberg/siyuan/kaldi/multilingual/egs/cusent/s5/data/lang/
# bnf_extractor=/lan/dspIceberg/siyuan/kaldi/multilingual/egs/cusent/s5/steps/nnet3/make_bottleneck_features.sh
# post_extractor=/lan/dspIceberg/siyuan/kaldi/multilingual/egs/cusent/s5/steps/nnet3/make_posterior_features.sh
if [ $stage -le 0 ]; then
	# Extract mfcc_hires features
	for lang in english french mandarin; do
	  for dur in 1s 10s 120s; do
		utils/copy_data_dir.sh data/test/$lang/$dur data_hires/test/$lang/$dur || exit 1;
		steps/make_mfcc.sh --nj 40 --mfcc-config $conf_dir/mfcc_hires.conf \
		  --cmd "$train_cmd" data_hires/test/$lang/$dur || exit 1;
	  # we do not perform cmvn, as $model_dir is with no cmvn transform

	  done
	done
fi

#############
# Extract Phoneme Posterior Features with Model in $model_dir
# mkdir -p exp/posterior
# expdir=exp/posterior
nj=8
cmd=run.pl
# post_dim=`gmm-info $gmm_dir/final.mdl | grep 'number of phones' | awk '{print $4}'` 
if [ $stage -le 3 ]; then
	for lang in english ; do
		if [ ! -f $model_dir/decode_zerospeech_train_${lang}/lat.1.gz ]; then
			# $post_extractor --use-gpu true --nj 10 data_hires/test/$lang/$dur $post_dir $model_dir || exit 1;
			graph_dir=$gmm_dir/graph
			steps/nnet3/decode.sh --nj 8 --num-threads 3 --cmd "$decode_cmd" --skip-scoring true --num-threads 4  \
				${graph_dir} data_hires/train/$lang $model_dir/decode_zerospeech_train_${lang}/ || exit 1
			echo "--"
		fi
		echo ">> lattice to posterior"
		echo $word_dir
		echo $model_dir
		lattice-best-path --lm-scale=0.001 "ark:gunzip -c $model_dir/decode_zerospeech_train_${lang}/lat.*.gz |" "ark,t:|int2sym.pl -f 2- $word_dir/words.txt > $model_dir/decode_zerospeech_train_${lang}/text" ark,t:$model_dir/decode_zerospeech_train_${lang}/best_path.ali  || exit 1;
	done

fi
# if [ $stage -le 4 ]; then
  # for lang in english; do
    # for dur in 1s 10s 120s; do
      # mkdir -p $expdir/data/test/$lang/$dur/data_by_utt;
      # # remember to prepare for file foo.scp
      # copy-feats --binary=false scp:$expdir/data/test/$lang/$dur/feats.scp scp,t:$expdir/data/test/$lang/$dur/foo.scp || exit 1;
    # done
  # done
# fi


echo "succeeded.."
exit 0;

