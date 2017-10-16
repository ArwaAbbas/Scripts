#!/bin/bash

#Counts annotated contigs

echo -e "Sample\tContigs_Min_500\tFiltered_(NonHuman)_Contigs"
for file in $(ls *Minimo_contig_annotation.txt); do
	filename=${file%%_Minimo_contig_annotation.txt}
	contigs=`wc -l "$filename"_Minimo_contig_annotation.txt | cut -f1 -d ' '`
	totalcontigs=$(($contigs-1))
	nonhum=${filename}_nonhuman_contig_annotation.txt
	filteredcontigs=`wc -l "$nonhum" | cut -f1 -d ' '`
	totalnonhum=$(($filteredcontigs-1))
	echo -e "$filename\t$totalcontigs\t$totalnonhum"
done

