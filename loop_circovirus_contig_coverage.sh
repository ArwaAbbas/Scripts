#!/bin/bash

#for file in $(ls all_viruses*.bam); do

#test for one file
for file in $(ls all_viruses_D13017.bam); do
        filename=${file%%.bam}
        echo $filename
	samtools view -b "$filename".bam|genomeCoverageBed -ibam stdin|grep -v 'genome'| perl /media/THING2/arwa/1_Scripts/coverage_counter.pl > "$filename"_genomecoverage.txt
	mv "$filename"_genomecoverage.txt Coverage/
done
