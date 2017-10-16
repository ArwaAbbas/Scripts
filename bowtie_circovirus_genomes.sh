#!/bin/bash

list_references=(ViralGenomes/humancyclovirusVS57 ViralGenomes/humangyrovirustype1\ 
ViralGenomes/humancyclovirus7078A ViralGenomes/humancircovirus)


#CTOT PGD Control Donor Sample
#for sample in `ls FilteredFasta/D13017_R1_matched.fasta`; do
	#sample_name=${sample%%_R1_matched.fasta}
	#sample_name_R1=${sample_name}_R1_matched.fasta
	#sample_name_R2=${sample_name}_R2_matched.fasta
	#sampleid=${sample_name##FilteredFasta/}
	#for reference in ${list_references[@]}; do
        	#echo $reference $sample_name_R1 $sample_name_R2 $sampleid
		#reference_name=${reference##ViralGenomes/}
		#ref_sample=${reference_name}_${sampleid}
		#echo $reference_name $ref_sample
		#bowtie2 -f --local -t --very-sensitive-local\
		#-x $reference -1 $sample_name_R1\
		#-2 $sample_name_R2 -S  ${ref_sample}.sam
		#samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
		#samtools sort ${ref_sample}.bam ${ref_sample}.sorted
		#mv ${ref_sample}.sorted.bam ${ref_sample}.bam
		#samtools index ${ref_sample}.bam
		#samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
		#mv ${ref_sample}.bam CircoAlignments/
		#mv ${ref_sample}.sam CircoAlignments/
		#mv ${ref_sample}.idxstats.tsv CircoAlignments/
		#mv ${ref_sample}.bam.bai CircoAlignments/
	#done

#done

#CTOT ACR Donor Sample. Uses single interleaved file
for sample in `ls /media/THING1/jcaprio/CTOTACR/HiSeq/R1_R2_FASTAs/AllInterleavedFasta/PCMP_13-28-V1-DB-D_combined_interleaved.fasta`; do
        sample_name=${sample%%_combined_interleaved.fasta}
        sampleid=${sample_name##/media/THING1/jcaprio/CTOTACR/HiSeq/R1_R2_FASTAs/AllInterleavedFasta/PCMP_}
        for reference in ${list_references[@]}; do
                echo $reference $sample_name $sampleid
                reference_name=${reference##ViralGenomes/}
                ref_sample=${reference_name}_${sampleid}
                echo $reference_name $ref_sample
                bowtie2 -f --local -t --very-sensitive-local -x $reference -U $sample -S  ${ref_sample}.sam
                samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                samtools index ${ref_sample}.bam
                samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                mv ${ref_sample}.bam CircoAlignments/
                mv ${ref_sample}.sam CircoAlignments/
                mv ${ref_sample}.idxstats.tsv CircoAlignments/
                mv ${ref_sample}.bam.bai CircoAlignments/
        done

done
