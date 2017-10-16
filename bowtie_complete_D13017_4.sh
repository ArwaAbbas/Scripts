
#!/bin/bash

#list_references=(ContigSequence/complete_D13017_4_V1)

#Using a circularized and cut at a different location sequence
list_references=(ContigSequence/complete_D13017_4_V2)

#All CTOT PGD Control HiSeq BAL Samples
#for sample in `ls /media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/FilteredFasta/*_R1_matched.fasta`; do
#Sample from which it was built
for sample in `ls /media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/FilteredFasta/*13017_R1_matched.fasta`; do
        sample_name=${sample%%_R1_matched.fasta}
        sample_name_R1=${sample_name}_R1_matched.fasta
        sample_name_R2=${sample_name}_R2_matched.fasta
        sampleid=${sample_name##/media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/FilteredFasta/}
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
                mv ${ref_sample}.bam Alignments/CTOT_PGD_HiSeq_BAL
                mv ${ref_sample}.sam Alignments/CTOT_PGD_HiSeq_BAL
                mv ${ref_sample}.idxstats.tsv Alignments/CTOT_PGD_HiSeq_BAL
                mv ${ref_sample}.bam.bai Alignments/CTOT_PGD_HiSeq_BAL
        done

done

