#!/bin/bash

for file in  `ls *R1_matched.fasta`; do
#test for one file
#for file in `ls D12002_R1_matched.fasta`; do
	echo $file
	R2=${file%%_R1_matched.fasta}_R2_matched.fasta
	sample_id=${file%%_R1_matched.fasta}
	echo $R2 $sample_id
		if [ ! -e "$file" ]; then
                echo "File does not exist"
                else
		bowtie2 -f --local -t -p 4  --very-sensitive-local\
		-x /media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/TTV_ORF1_Nucleotide/BowtieNucleotide/all_CTOT_ORF1_nt.fasta -1 $file\
		-2 $R2 -S  ${sample_id}_ORF1.sam
		samtools view -bS ${sample_id}_ORF1.sam > ${sample_id}_ORF1.bam
		samtools sort ${sample_id}_ORF1.bam ${sample_id}_ORF1.sorted
		mv ${sample_id}_ORF1.sorted.bam ${sample_id}_ORF1.bam
		samtools index ${sample_id}_ORF1.bam
		samtools idxstats ${sample_id}_ORF1.bam > ${sample_id}_ORF1.idxstats.tsv
	fi
	mv ${sample_id}_ORF1.sam /media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/TTV_ORF1_Nucleotide/BowtieNucleotide
	mv ${sample_id}_ORF1.bam /media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/TTV_ORF1_Nucleotide/BowtieNucleotide
	mv ${sample_id}_ORF1.idxstats.tsv /media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/TTV_ORF1_Nucleotide/BowtieNucleotide
	mv ${sample_id}_ORF1.bam.bai /media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/TTV_ORF1_Nucleotide/BowtieNucleotide



done

