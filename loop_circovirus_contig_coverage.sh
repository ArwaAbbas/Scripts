#!/bin/bash

#for file in $(ls *.bam); do
#test for one file
#for file in $(ls AcinetobacterphageZZ1_D11002*.bam); do
        #filename=${file%%.bam}
        #echo $filename
	#samtools view -b "$filename".bam|genomeCoverageBed -ibam stdin|grep -v 'genome'|/home/cchehoud/scripts/SAMformat2Coverage/coverage_counter.pl > "$filename"_genomecoverage.txt
	#mv "$filename"_genomecoverage.txt Coverage/
#done

#Getting genome coverage of bowtie2 alignments of HCRV_[C/D]

for file in $(ls /media/THING2/louis/02_VirusHunting/CircoAlignments/*.bam);do
	filename=${file%%.bam}
	samplename=${filename##/media/THING2/louis/02_VirusHunting/CircoAlignments/}
	echo $filename $samplename
	samtools view -b "$filename".bam|genomeCoverageBed -ibam stdin|grep -v 'genome'|perl /home/cchehoud/scripts/SAMformat2Coverage/coverage_counter.pl > "$samplename"_genomecoverage.txt
	mv "$samplename"_genomecoverage.txt Coverage/
done
