#!/bin/bash

for file in $(ls D*); do
	donor=${file%%_Minimo_nonhum_contig.fa}
	samplename=${donor#D}
	visit=V${samplename}
	seq1=${donor}_Minimo_nonhum_contig.fa
	seq2=${visit}_Minimo_nonhum_contig.fa
	echo $seq1 $seq2
	file=$seq2
		if [ ! -e "$file" ]; then
    		echo "File does not exist"
		else 
		python seq_uniq.py $seq1 $seq2
		fi
		for summary in $(ls summary.tsv); do
		sumfile=${samplename}_summary.tsv
		mv  ${summary} ${sumfile}
		done
done

