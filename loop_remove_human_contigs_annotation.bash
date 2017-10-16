#!/bin/bash

for annotation in $(ls *_Minimo_contig_annotation.txt); do
#test for one file
#for annotation in $(ls D11002_Minimo_contig_annotation.txt); do
	echo  $annotation
	list=${annotation%%_Minimo_contig_annotation.txt}_human_contig.txt
	echo  $list
	./remove_human_contigs.R -i ${annotation} -f ${list}
	output=${annotation%%_Minimo_contig_annotation.txt}_nonhuman_contig_annotation.txt
	echo $output
	mv $output NonHumanAnnotation/"$output"
done

