#!/bin/bash

#Optional: Make a new directory for each sequence you aligned to
#virus=(PhysalisMottleVirus ParvovirusNIH-CQV Sapovirus)

#for virus in ${virus[@]}; do
	#if [ ! -d "GenomeCoverage/""$virus" ]; then
	#mkdir GenomeCoverage/"$virus"
	#fi
#done

for file in $(ls *.bam); do
#test for one file
#for file in $(ls *_JonSpi2.bam); do
        filename=${file%%.bam}
	viralname=${filename%%_*}
        echo $file
	echo $filename
	echo $viralname
	samtools view -b "$filename".bam|genomeCoverageBed -ibam stdin|grep -v 'genome'|/home/cchehoud/scripts/SAMformat2Coverage/coverage_counter.pl > "$filename"_genomecoverage.txt
	mv "$filename"_genomecoverage.txt GenomeCoverage/"$viralname"/
done
