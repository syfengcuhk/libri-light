This repo is based on the Libri-Light (see information below), and extended to implement experiments in the following two papers:

@inproceedings{Feng2020,
  author={Siyuan Feng and Odette Scharenborg},
  title={{Unsupervised Subword Modeling Using Autoregressive Pretraining and Cross-Lingual Phone-Aware Modeling}},
  year=2020,
  booktitle={Proc. Interspeech 2020},
  pages={2732--2736},
  doi={10.21437/Interspeech.2020-1170},
  url={http://dx.doi.org/10.21437/Interspeech.2020-1170}
}

@article{feng2021effectiveness,
  title={The effectiveness of unsupervised subword modeling with autoregressive and cross-lingual phone-aware networks},
  author={Feng, Siyuan and Scharenborg, Odette},
  journal={IEEE Open Journal of Signal Processing},
  year={2021},
  publisher={IEEE}
}

Please refer to kaldi_related/ folder for unsupervised DNN-BNF training and ABX evaluation on Libri-light dataset.
# Libri-Light: A Benchmark for ASR with Limited or No Supervision

This repository contains code and models associated with the Libri-Light dataset, which can be [downloaded and prepared here](./data_preparation/README.md). More information about dataset creation and baselines can be found in this [arXiv Paper](https://arxiv.org/abs/1912.07875). Contained here is code for data preparation, pretrained models, and evaluation resources:


    data_preparation/         # code to download the data; VAD and SNR code; json generation; stats; audio segmentation
    eval/                     # ABX, PER, WER (evaluation metrics on LibriSpeech dev-clean, dev-other, test-clean, test-other)
    baselines/                   # code, pretrained wav2letter models, baselines, and examples

To get started, first clone the repository:

    git clone https://github.com/facebookresearch/libri-light

The environment is easiest to set up with Anaconda. Requirements can be installed by running:

    conda env create -f environment.yml && conda activate libri-light

If you don't have `conda` you can get it [here](https://docs.anaconda.com/anaconda/install/).

## Goals and structure

Libri-Light offers 60+ k hours of unlabelled speech, a small training set for limited supervision (10h, 1h or 10 minutes of labelled speech), and a common set of metrics to evaluated three settings:

  1. the unsupervised/zero-resource setting. Here, models are trained only on unlabelleds speech and attempt to construct 'good' speech representations. They are evaluated with the ABX metric.
  2. the semi-supervised setting. Here, models are trained with the limited supervision dataset and exploit the unlabelled in various ways (as pretraining, to get pseudo-labels, etc). The models are evaluated using either PER or WER.
  3. the distant supervision setting. Here, models can use additional unaligned text to build a decoder. These models are evaluated using WER.


## Documentation

Documentation for downloading Libri-Light or preparing the source files from scratch can be found in [`data_preparation`](./data_preparation/README.md).

The [`eval`](./eval/README.md) directory contains ABX, PER and WER evaluations on pretrained CPC models.

The [`baselines`](./baselines/README.md) directory contains pretrained [wav2letter](https://github.com/facebookresearch/wav2letter/) baseline models and information about reproduction.


## Citing

    @misc{librilight,
        author = {Kahn, J. and Rivière, M. and Zheng, W. and Kharitonov, E. and Xu, Q. and
         Mazaré, P.E. and Karadayi, J. and Liptchinsky, V. and Collobert, R. and Fuegen, C. and
         Likhomanenko, T. and Synnaeve, G. and Joulin, A. and Mohamed, A. and Dupoux, E.},
        title={Libri-Light: A Benchmark for ASR with Limited or No Supervision},
        year = {2019},
        publisher = {GitHub},
        journal = {arXiv preprint arXiv:1912.07875},
        howpublished = {\url{https://arxiv.org/abs/1912.07875}},
        note = {\url{https://github.com/facebookresearch/libri-light}},
    }

## License

The Libri-light code is released under the [MIT license](https://opensource.org/licenses/MIT). See LICENSE for additional details.
