#!/bin/bash

for file in `ls *.fasta`; do
#test for one file
#for file in `ls AcinetobacterphageZZ1.fasta`; do
	echo $file
	name=${file%.fasta}
	bowtie2-build -f $file $name
done

