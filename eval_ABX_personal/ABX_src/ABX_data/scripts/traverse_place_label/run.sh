#!/bin/bash

PoA_list_csl="BI,LA,DA,AL,PO,PA,VE,GL" #"AE,EH,IH,IY,AA,AH,ER,AO,UH,UW,EY,OW,AW,OY,AY,CH,JH,Y,W,R,L,S,TH,SH,F,HH,Z,ZH,DH,V,M,N,NG,K,T,P,G,D,B"

PoA_list=($(echo $PoA_list_csl | tr ',:' ' '))
num_PoAs=${#PoA_list[@]}

echo "total number of PoAs: $num_PoAs"

for PoA1_id in $(seq 0 $[num_PoAs-2]); do
  for PoA2_id in $(seq $[PoA1_id+1] $[num_PoAs-1]); do
    #echo "PoA1_id: $PoA1_id; PoA2_id: $PoA2_id"
    echo "${PoA_list[$PoA1_id]} and ${PoA_list[$PoA2_id]}"
    python scripts/create_articulatory_place_label_traverse.py  ${PoA_list[$PoA1_id]} ${PoA_list[$PoA2_id]} || exit 1;
  done

done
