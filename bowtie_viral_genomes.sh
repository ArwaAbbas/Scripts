#!/bin/bash



#list_references=(ViralGenomes/AcinetobacterphageZZ1 ViralGenomes/Aggregatibacterphage\ 
#ViralGenomes/crAssphage ViralGenomes/Cyprinidherpesvirus1 ViralGenomes/HHV7\ 
#ViralGenomes/HP1 ViralGenomes/HP2 ViralGenomes/Humanherpesvirus6B\ 
#ViralGenomes/Humanpapillomavirus49 ViralGenomes/Humanpapillomavirus9\ 
#ViralGenomes/Molluscumcontagiosum)

list_references=(ViralGenomes/HERVK113)

for sample in `ls FilteredFasta/*R1_matched.fasta`; do
#test for one sample
#for sample in `ls FilteredFasta/V13039_R1_matched.fasta`; do
	sample_name=${sample%%_R1_matched.fasta}
	sample_name_R1=${sample_name}_R1_matched.fasta
	sample_name_R2=${sample_name}_R2_matched.fasta
	sampleid=${sample_name##FilteredFasta/}
	for reference in ${list_references[@]}; do
        	echo $reference $sample_name_R1 $sample_name_R2 $sampleid
		reference_name=${reference##ViralGenomes/}
		ref_sample=${reference_name}_${sampleid}
		echo $reference_name $ref_sample
		bowtie2 -f --local -t --very-sensitive-local\
		-x $reference -1 $sample_name_R1\
		-2 $sample_name_R2 -S  ${ref_sample}.sam
		samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
		samtools sort ${ref_sample}.bam ${ref_sample}.sorted
		mv ${ref_sample}.sorted.bam ${ref_sample}.bam
		samtools index ${ref_sample}.bam
		samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
		mv ${ref_sample}.bam BowtieAlignments/
		mv ${ref_sample}.sam BowtieAlignments/
		mv ${ref_sample}.idxstats.tsv BowtieAlignments/
		mv ${ref_sample}.bam.bai BowtieAlignments/
	done

done

