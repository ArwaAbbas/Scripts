#!/bin/bash

transposase_seq='CTGTCTCTTATACACATCT' 

#for file in $(ls *_R1.fasta); do
	#filename=${file%%.fasta}
	#cutadapt -a $transposase_seq -o ${filename}_noTransSeq.fasta $file
#done

#for file in $(ls *_R2.fasta); do
	#filename=${file%%.fasta}
	#cutadapt -a $transposase_seq -o ${filename}_noTransSeq.fasta $file
#done

for file in $(ls *R1_noTransSeq.fasta); do
	filename=${file%%_R*}
	perl /home/cchehoud/scripts/mergeMiseqReads.pl "$filename"_R1_noTransSeq.fasta "$filename"_R2_noTransSeq.fasta "$filename"_complete.fasta
done

