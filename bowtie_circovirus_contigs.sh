#!/bin/bash

#Originally used metagenomic contigs
#list_references=(ContigSequence/D13017_contig_4 ContigSequence/13-28-V1-DB-D_contig-100_967)

#Use Sanger sequenced contig sequence of D13017_4
list_references=(ContigSequence/complete_D13017_4_V1 ContigSequence/13-28-V1-DB-D_contig-100_967)

list_references_2=(CircovirusSequence/humancircovirus CircovirusSequence/humancyclovirus7078A CircovirusSequence/humancyclovirusVS57 CircovirusSequence/humangyrovirustype1 CircovirusSequence/porcine)


#CTOT PGD Control HiSeq BAL Samples
#for sample in `ls /media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/FilteredFasta/*_R1_matched.fasta`; do
	#sample_name=${sample%%_R1_matched.fasta}
	#sample_name_R1=${sample_name}_R1_matched.fasta
	#sample_name_R2=${sample_name}_R2_matched.fasta
	#sampleid=${sample_name##/media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/FilteredFasta/}
	#for reference in ${list_references[@]}; do
		#reference_name=${reference##ContigSequence/}
		#ref_sample=${reference_name}_${sampleid}
		#echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
		#bowtie2 -f --local -t --very-sensitive-local --no-mixed --no-discordant\
		#-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
		#samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
		#samtools sort ${ref_sample}.bam ${ref_sample}.sorted
		#mv ${ref_sample}.sorted.bam ${ref_sample}.bam
		#samtools index ${ref_sample}.bam
		#samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
		#mv ${ref_sample}.bam Alignments/CTOT_PGD_HiSeq_BAL
		#mv ${ref_sample}.sam Alignments/CTOT_PGD_HiSeq_BAL
		#mv ${ref_sample}.idxstats.tsv Alignments/CTOT_PGD_HiSeq_BAL
		#mv ${ref_sample}.bam.bai Alignments/CTOT_PGD_HiSeq_BAL
	#done

#done

#CTOT PGD Control HiSeq BAL RNA Samples
#for sample in `ls /media/THING2/arwa/13_New_CTOT_PGD_RNA_HiSeq/FilteredFasta/*_R1_matched.fasta`; do
        #sample_name=${sample%%_R1_matched.fasta}
        #sample_name_R1=${sample_name}_R1_matched.fasta
        #sample_name_R2=${sample_name}_R2_matched.fasta
        #sampleid=${sample_name##/media/THING2/arwa/13_New_CTOT_PGD_RNA_HiSeq/FilteredFasta/}
        #for reference in ${list_references[@]}; do
                #reference_name=${reference##ContigSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -f --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/CTOT_PGD_HiSeq_BAL_RNA
                #mv ${ref_sample}.sam Alignments/CTOT_PGD_HiSeq_BAL_RNA
                #mv ${ref_sample}.idxstats.tsv Alignments/CTOT_PGD_HiSeq_BAL_RNA
                #mv ${ref_sample}.bam.bai Alignments/CTOT_PGD_HiSeq_BAL_RNA
        #done
        #for reference in ${list_references_2[@]}; do
                #reference_name=${reference##CircovirusSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -f --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
		#mv ${ref_sample}.bam Alignments/CTOT_PGD_HiSeq_BAL_RNA
                #mv ${ref_sample}.sam Alignments/CTOT_PGD_HiSeq_BAL_RNA
                #mv ${ref_sample}.idxstats.tsv Alignments/CTOT_PGD_HiSeq_BAL_RNA
                #mv ${ref_sample}.bam.bai Alignments/CTOT_PGD_HiSeq_BAL_RNA

	#done

#done

#CTOT PGD Control MiSeq Serum Samples
#for sample in `ls /media/THING2/arwa/9_CTOT_PGD_Serum_Virome/FilteredFasta/*_R1_matched.fasta`; do
        #sample_name=${sample%%_R1_matched.fasta}
        #sample_name_R1=${sample_name}_R1_matched.fasta
        #sample_name_R2=${sample_name}_R2_matched.fasta
        #sampleid=${sample_name##/media/THING2/arwa/9_CTOT_PGD_Serum_Virome/FilteredFasta/}
        #for reference in ${list_references[@]}; do
                #reference_name=${reference##ContigSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -f --local -t --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/CTOT_PGD_MiSeq_Serum
                #mv ${ref_sample}.sam Alignments/CTOT_PGD_MiSeq_Serum
                #mv ${ref_sample}.idxstats.tsv Alignments/CTOT_PGD_MiSeq_Serum
                #mv ${ref_sample}.bam.bai Alignments/CTOT_PGD_MiSeq_Serum
        #done

#done


#CTOT ACR HiSeq BAL Samples.
#for sample in `ls /media/THING1/jcaprio/CTOTACR/HiSeq/R1_R2_FASTAs/AllMatchedFasta/*_combined_matched_R1.fasta`; do
        #sample_name=${sample%%_combined_matched_R1.fasta}
	#sample_name_R1=${sample_name}_combined_matched_R1.fasta
        #sample_name_R2=${sample_name}_combined_matched_R2.fasta
	#sampleid=${sample_name##/media/THING1/jcaprio/CTOTACR/HiSeq/R1_R2_FASTAs/AllMatchedFasta/PCMP_}
        #for reference in ${list_references[@]}; do
                #reference_name=${reference##ContigSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -f --local -t --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/CTOT_ACR_HiSeq_BAL
                #mv ${ref_sample}.sam Alignments/CTOT_ACR_HiSeq_BAL
                #mv ${ref_sample}.idxstats.tsv Alignments/CTOT_ACR_HiSeq_BAL
                #mv ${ref_sample}.bam.bai Alignments/CTOT_ACR_HiSeq_BAL
        #done

#done


#CTOT ACR Serum Samples
#for sample in `ls /media/THING1/jcaprio/CTOTACR/Serum/R1_R2_FASTAs/*_R1.fasta_matched`; do
#test for one sample
#for sample in `ls /media/THING1/jcaprio/CTOTACR/Serum/R1_R2_FASTAs/13-31-V4-S-D_CCTAAGAC-CGTCTAAT_L001_R1.fasta_matched`; do
	#sample_name=${sample%%_R1.fasta_matched}
        #sample_name_R1=${sample_name}_R1.fasta_matched
        #sample_name_R2=${sample_name}_R2.fasta_matched
        #sampleid=${sample_name##/media/THING1/jcaprio/CTOTACR/Serum/R1_R2_FASTAs/}
        #position=`expr index $sampleid "_"`
	#sampleid=${sampleid:0:position-1}
	#for reference in ${list_references[@]}; do
                #reference_name=${reference##ContigSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -f --local -t --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/CTOT_ACR_MiSeq_Serum
                #mv ${ref_sample}.sam Alignments/CTOT_ACR_MiSeq_Serum
                #mv ${ref_sample}.idxstats.tsv Alignments/CTOT_ACR_MiSeq_Serum
                #mv ${ref_sample}.bam.bai Alignments/CTOT_ACR_MiSeq_Serum
       #done
#done

#Lung Virome 1

#for sample in `ls /media/THING2/jcaprio/LungVirome1/Analysis_adaptorstrimmed/*_filtered_R1.fasta`; do
#test for one sample
#for sample in `ls /media/THING2/jcaprio/LungVirome1/Analysis_adaptorstrimmed/HUP1A03-c_S20_L001_filtered_R1.fasta`; do
        #sample_name=${sample%%_filtered_R1.fasta}
        #sample_name_R1=${sample_name}_filtered_R1.fasta
        #sample_name_R2=${sample_name}_filtered_R2.fasta
        #sampleid=${sample_name##/media/THING2/jcaprio/LungVirome1/Analysis_adaptorstrimmed/}
        #position=`expr index $sampleid "_"`
        #sampleid=${sampleid:0:position-1}
        #for reference in ${list_references_2[@]}; do
                #reference_name=${reference##ContigSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -f --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/Lung_Virome_1_Circoviruses
                #mv ${ref_sample}.sam Alignments/Lung_Virome_1_Circoviruses
                #mv ${ref_sample}.idxstats.tsv Alignments/Lung_Virome_1_Circoviruses
                #mv ${ref_sample}.bam.bai Alignments/Lung_Virome_1_Circoviruses
      #done
#done

#SCIDX Microbiome
#Uses Zipped FASTQ instead of FASTA
#for sample in `ls /media/THING2/erik/100_SCID/102_Microbiome/data/*_R1.fastq.gz`; do
#test for one sample
#for sample in `ls /media/THING2/erik/100_SCID/102_Microbiome/data/PCMP_YoungH2OCtrl.EC.4.1_R1.fastq.gz`; do
        #sample_name=${sample%%_R1.fastq.gz}
        #sample_name_R1=${sample_name}_R1.fastq.gz
        #sample_name_R2=${sample_name}_R2.fastq.gz
        #sampleid=${sample_name##/media/THING2/erik/100_SCID/102_Microbiome/data/PCMP_}
	#for reference in ${list_references[@]}; do
                #reference_name=${reference##ContigSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -q --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/SCID_Microbiome
                #mv ${ref_sample}.sam Alignments/SCID_Microbiome
                #mv ${ref_sample}.idxstats.tsv Alignments/SCID_Microbiome
                #mv ${ref_sample}.bam.bai Alignments/SCID_Microbiome
	#done
	#for reference in ${list_references_2[@]}; do
                #reference_name=${reference##CircovirusSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -q --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/SCID_Microbiome
                #mv ${ref_sample}.sam Alignments/SCID_Microbiome
                #mv ${ref_sample}.idxstats.tsv Alignments/SCID_Microbiome
                #mv ${ref_sample}.bam.bai Alignments/SCID_Microbiome
	#done

#done

#FMT
#for sample in `ls /media/THING2/christel/11_PhageDynamics/1_Filtered_FASTA/*_filtered_R1.fasta`; do
#test for one sample
#for sample in `ls /media/THING2/christel/11_PhageDynamics/1_Filtered_FASTA/X_Neg2_r2_filtered_R1.fasta `; do
        #sample_name=${sample%%_filtered_R1.fasta}
        #sample_name_R1=${sample_name}_filtered_R1.fasta
        #sample_name_R2=${sample_name}_filtered_R2.fasta
        #sampleid=${sample_name##/media/THING2/christel/11_PhageDynamics/1_Filtered_FASTA/}
        #for reference in ${list_references[@]}; do
                #reference_name=${reference##ContigSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -f --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/FMT
                #mv ${ref_sample}.sam Alignments/FMT
                #mv ${ref_sample}.idxstats.tsv Alignments/FMT
                #mv ${ref_sample}.bam.bai Alignments/FMT
        #done
	#for reference in ${list_references_2[@]}; do
		#reference_name=${reference##CircovirusSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -f --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/FMT
                #mv ${ref_sample}.sam Alignments/FMT
                #mv ${ref_sample}.idxstats.tsv Alignments/FMT
                #mv ${ref_sample}.bam.bai Alignments/FMT
        #done

#done


#Sarcoid Virome

#for sample in `ls /media/THING2/jkotzin/Sarcoid_noAdapter/FilteredFasta/DNA/*_filtered_R1.fasta.gz`; do
#test for one sample
#for sample in `ls /media/THING2/jkotzin/Sarcoid_noAdapter/FilteredFasta/DNA/HUP3B06BALd_S36_L001_filtered_R1.fasta.gz`; do
        #sample_name=${sample%%_L001_filtered_R1.fasta.gz}
        #sample_name_R1=${sample_name}_L001_filtered_R1.fasta.gz
        #sample_name_R2=${sample_name}_L001_filtered_R2.fasta.gz
        #sampleid=${sample_name##/media/THING2/jkotzin/Sarcoid_noAdapter/FilteredFasta/DNA/}
        #for reference in ${list_references[@]}; do
                #reference_name=${reference##ContigSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -f --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/Sarcoid_Virome
                #mv ${ref_sample}.sam Alignments/Sarcoid_Virome
                #mv ${ref_sample}.idxstats.tsv Alignments/Sarcoid_Virome
                #mv ${ref_sample}.bam.bai Alignments/Sarcoid_Virome
        #done
        #for reference in ${list_references_2[@]}; do
                #reference_name=${reference##CircovirusSequence/}
                #ref_sample=${reference_name}_${sampleid}
                #echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                #bowtie2 -f --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                #-x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                #samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                #samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                #mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                #samtools index ${ref_sample}.bam
                #samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                #mv ${ref_sample}.bam Alignments/Sarcoid_Virome
                #mv ${ref_sample}.sam Alignments/Sarcoid_Virome
                #mv ${ref_sample}.idxstats.tsv Alignments/Sarcoid_Virome
                #mv ${ref_sample}.bam.bai Alignments/Sarcoid_Virome
        #done

#done

#PLEASE
for sample in `ls /media/THING2/eric/1_COMBO_PLEASE/3_Remove_Human_DNA/Sample*/*_R1.fastq.gz`; do
#test for one sample
#for sample in `ls /media/THING2/eric/1_COMBO_PLEASE/3_Remove_Human_DNA/Sample_7015-04/*_R1.fastq.gz`; do
        sample_name=${sample%%_R1.fastq.gz}
        sample_name_R1=${sample_name}_R1.fastq.gz
        sample_name_R2=${sample_name}_R2.fastq.gz
        sampleid=${sample_name##/media/THING2/eric/1_COMBO_PLEASE/3_Remove_Human_DNA/Sample*/}
        for reference in ${list_references[@]}; do
                reference_name=${reference##ContigSequence/}
                ref_sample=${reference_name}_${sampleid}
                echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                bowtie2 -q --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                -x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                samtools index ${ref_sample}.bam
                samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
                mv ${ref_sample}.bam Alignments/PLEASE
                rm ${ref_sample}.sam
                mv ${ref_sample}.idxstats.tsv Alignments/PLEASE
                mv ${ref_sample}.bam.bai Alignments/PLEASE
        done
        for reference in ${list_references_2[@]}; do
                reference_name=${reference##CircovirusSequence/}
                ref_sample=${reference_name}_${sampleid}
                echo $sample_name_R1 $sample_name_R2 $sampleid $reference_name $ref_sample
                bowtie2 -q --local -t -p 6 --very-sensitive-local --no-mixed --no-discordant\
                -x $reference -1 $sample_name_R1 -2 $sample_name_R2 -S  ${ref_sample}.sam
                samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
                samtools sort ${ref_sample}.bam ${ref_sample}.sorted
                mv ${ref_sample}.sorted.bam ${ref_sample}.bam
                samtools index ${ref_sample}.bam
                samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
	        mv ${ref_sample}.bam Alignments/PLEASE
                rm ${ref_sample}.sam
                mv ${ref_sample}.idxstats.tsv Alignments/PLEASE
                mv ${ref_sample}.bam.bai Alignments/PLEASE

	done

done

