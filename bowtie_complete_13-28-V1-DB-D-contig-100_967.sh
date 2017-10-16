#!/bin/bash

#list_references=(ContigSequence/complete_13-28-V1-DB-D-contig-100_967_V1)

#Using a circularized and cut at a different position sequence
list_references=(ContigSequence/complete_13-28-V1-DB-D-contig-100_967_V2)

#All CTOT ACR HiSeq BAL Samples
#for sample in `ls /media/THING1/jcaprio/CTOTACR/HiSeq/R1_R2_FASTAs/AllMatchedFasta/*_combined_matched_R1.fasta`; do
#Sample from which it was built
for sample in `ls /media/THING1/jcaprio/CTOTACR/HiSeq/R1_R2_FASTAs/AllMatchedFasta/*13-28-V*_combined_matched_R1.fasta`; do
        sample_name=${sample%%_combined_matched_R1.fasta}
        sample_name_R1=${sample_name}_combined_matched_R1.fasta
        sample_name_R2=${sample_name}_combined_matched_R2.fasta
        sampleid=${sample_name##/media/THING1/jcaprio/CTOTACR/HiSeq/R1_R2_FASTAs/AllMatchedFasta/PCMP_}
        for reference in ${list_references[@]}; do
                reference_name=${reference##ContigSequence/}
                ref_sample=${reference_name}_${sampleid}
                echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                bowtie2 -f --end-to-end -t --sensitive --no-mixed --no-discordant\
                -x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                samtools index ${ref_sample}.bam
                samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                mv ${ref_sample}.bam Alignments/CTOT_ACR_HiSeq_BAL
                mv ${ref_sample}.sam Alignments/CTOT_ACR_HiSeq_BAL
                mv ${ref_sample}.idxstats.tsv Alignments/CTOT_ACR_HiSeq_BAL
                mv ${ref_sample}.bam.bai Alignments/CTOT_ACR_HiSeq_BAL
        done

done

