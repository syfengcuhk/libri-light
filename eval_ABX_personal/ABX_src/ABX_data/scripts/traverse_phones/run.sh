#!/bin/bash

phoneme_list_csl="AE,EH,IH,IY,AA,AH,ER,AO,UH,UW,EY,OW,AW,OY,AY,CH,JH,Y,W,R,L,S,TH,SH,F,HH,Z,ZH,DH,V,M,N,NG,K,T,P,G,D,B"

phoneme_list=($(echo $phoneme_list_csl | tr ',:' ' '))
num_phonemes=${#phoneme_list[@]}

echo "total number of phonemes: $num_phonemes"

for phoneme1_id in $(seq 0 $[num_phonemes-2]); do
  for phoneme2_id in $(seq $[phoneme1_id+1] $[num_phonemes-1]); do
    #echo "phoneme1_id: $phoneme1_id; phoneme2_id: $phoneme2_id"
    echo "${phoneme_list[$phoneme1_id]} and ${phoneme_list[$phoneme2_id]}"
    python scripts/create_perphone_item_traverse.py ${phoneme_list[$phoneme1_id]} ${phoneme_list[$phoneme2_id]} || exit 1;
  done

done
