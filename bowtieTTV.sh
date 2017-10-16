#!/bin/bash



list_references=(TTV/339832375.fa TTV1/29502191.fa. TTV10/295413928.fa.\ 
 TTV12/295413923.fa TTV14/295413944.fa TTV15/295413944.fa TTV16/295441884.fa\ 
 TTV19/295413947.fa TTV2/312192953.fa TTV27/295413918.fa TTV28/295413834.fa\ 
 TTV3/295413958.fa TTV4/295413933.fa TTV6/295413933.fa TTV7/295413954.fa\ 
 TTV8/295413972.fa TTVmd1/13413320.fa TTVmd2/295441891.fa TTVmn1/295441908.fa\
 TTVmn2/TTVmn2 TTVmn3/295441873.fa TTVmn4/TTVmn4 TTVmn5/295441877.fa\ 
 TTVmn7/295413965.fa TTVmn8/TTVmn8 TTVmn9/295413965.fa)

for sample in `ls *R1.fasta`; do
	sample_name=${sample%%_filtered_R1.fasta}
	sample_name_R1=${sample_name}_filtered_R1.fasta
	sample_name_R2=${sample_name}_filtered_R2.fasta	
	for reference in ${list_references[@]}; do
        	echo $reference $sample_name_R1 $sample_name_R2
		reference_name=${reference%/*}
		ref_sample=${reference_name}_${sample_name}
		bowtie2 -f --local -t --very-sensitive-local\
		-x $reference -1 $sample_name_R1\
		-2 $sample_name_R2 -S  ${ref_sample}.sam
		samtools view -bS ${ref_sample}.sam > ${ref_sample}.bam
		samtools sort ${ref_sample}.bam ${ref_sample}.sorted
		mv ${ref_sample}.sorted.bam ${ref_sample}.bam		
		samtools index ${ref_sample}.bam
		samtools idxstats ${ref_sample}.bam > ${ref_sample}.idxstats.tsv
	done
done

