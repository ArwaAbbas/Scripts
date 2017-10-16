#!/bin/bash

for file in $(ls FilteredFasta/*_interleaved.fasta); do
#test for one file
#for file in $(ls FilteredFasta/D11002_interleaved.fasta); do
	echo $file
	#samplename=`echo $file | cut -d '/' -f6 | cut -d '_' -f1-3`
	no_suf=${file%_interleaved.fasta}
	samplename=${no_suf#FilteredFasta/}
	echo $samplename
	#Original file path was changed
	python /media/THING2/eric/3_PLEASE/7_MetaPhlAn/MetaPhlAn_1_6_7/metaphlan.py "$file" --bowtie2db /media/THING2/eric/3_PLEASE/7_MetaPhlAn/MetaPhlAn_1_6_7/bowtie2db/mpa --nproc 10 -t rel_ab -o "$samplename"_metaphlan.txt --bowtie2out "$samplename".bt2out.txt
	#python /home/eric/3_PLEASE/7_MetaPhlAn/MetaPhlAn_1_6_7/metaphlan.py "$file" --bowtie2db /home/eric/3_PLEASE/7_MetaPhlAn/MetaPhlAn_1_6_7/bowtie2db/mpa --nproc 10 -t rel_ab -o "$samplename"_metaphlan.txt --bowtie2out "$samplename".bt2out.txt
	mv "$samplename"_metaphlan.txt Metaphlan
	mv "$samplename".bt2out.txt Metaphlan

done
