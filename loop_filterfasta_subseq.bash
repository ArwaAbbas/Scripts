#!/bin/bash

for f in `ls *_R_out`; do
#test one file
#for f in `ls D12002_R_out`; do
    filename=${f%%_R_out}
    echo $filename

./filter_fasta_subseq.py -f ${filename}_Minimo_contig.fa -s $f -o "$filename"_ORF1_nt.fasta

done
