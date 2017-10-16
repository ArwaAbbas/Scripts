#!/bin/bash

for f in `ls *_ORF1_nt.fasta`; do
#test for one file
#for f in `ls D12002_ORF1_nt.fasta`; do
    samplename=${f%%_ORF1_nt.fasta}
    echo $samplename

python /media/THING1/jcaprio/CTOTACR/HiSeq/Contigs/ORF1/NT/prefixFasta/prefix_fasta.py $f ${samplename}_ORF1_nt_labeled.fasta --separator "_" --prefix  $samplename

done


