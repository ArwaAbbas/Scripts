#!/bin/bash

list_references=(/media/THING1/local/genomeIndexes/bowtie2/hg19)

for sample in `ls FilteredFasta/*R1_matched.fasta`; do
#test for one sample
#for sample in `ls FilteredFasta/S13039_R1_matched.fasta`; do
        sample_name=${sample%%_R1_matched.fasta}
        sample_name_R1=${sample_name}_R1_matched.fasta
        sample_name_R2=${sample_name}_R2_matched.fasta
        sampleid=${sample_name##FilteredFasta/}
        for reference in ${list_references[@]}; do
                echo $reference $sample_name_R1 $sample_name_R2 $sampleid
                reference_name=${reference##/media/THING1/local/genomeIndexes/bowtie2/}
                ref_sample=${reference_name}_${sampleid}
                echo $reference_name $ref_sample
                bowtie2 -f -t -p 4 --end-to-end -t --very-fast\
                -x $reference -1 $sample_name_R1\
                -2 $sample_name_R2 -S  ${ref_sample}.sam
                samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                samtools index ${ref_sample}.bam
                samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                mv ${ref_sample}.bam HumanGenomeAlignment
                mv ${ref_sample}.sam HumanGenomeAlignment/
                mv ${ref_sample}.idxstats.tsv HumanGenomeAlignment/
                mv ${ref_sample}.bam.bai HumanGenomeAlignment/
        done

done

