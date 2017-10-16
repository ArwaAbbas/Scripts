#!/bin/bash


for file in $(ls *Minimo_contig.fa); do
#test for one file
#for file in $(ls D11002_Minimo_contig.fa);do
	echo $file
	list=${file%%_Minimo_contig.fa}_human_contig.txt
	echo $list
	output=${file%%_Minimo_contig.fa}_Minimo_nonhum_contig.fa
	echo $output
	filter_fasta.py -f $file -o $output -s $list -n
	mv $output NonHuman/"$output"

done
