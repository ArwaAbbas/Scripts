#!/bin/bash

for file in `ls *_R1.fastq`; do
#test one file
#for file in `ls PCMP_D11005_R1.fastq`;do
	samplename=${file%%_R1.fastq}
	sampleid=${samplename##PCMP_}
	echo $samplename
	echo $sampleid

fastq_to_fasta -i "$samplename"_R1.fastq -Q33 -o "$sampleid"_R1.fasta
fastq_to_fasta -i "$samplename"_R2.fastq -Q33 -o "$sampleid"_R2.fasta

# match paired fasta
perl get_trimmed_pairs_fasta.pl "$sampleid"_R1.fasta "$sampleid"_R2.fasta "$sampleid"_R1_matched.fasta "$sampleid"_R2_matched.fasta


# interleave files
perl mergeMiseqReads.pl "$sampleid"_R1_matched.fasta "$sampleid"_R2_matched.fasta "$sampleid"_interleaved.fasta

# move files to new directory
mv "$sampleid"_R1.fasta ../FilteredFasta
mv "$sampleid"_R1_matched.fasta ../FilteredFasta
mv "$sampleid"_R2.fasta ../FilteredFasta
mv "$sampleid"_R2_matched.fasta ../FilteredFasta
mv "$sampleid"_interleaved.fasta ../FilteredFasta

done

