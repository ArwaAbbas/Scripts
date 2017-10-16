#!/bin/bash

for sample in $(ls CTOT_*_Donor_Alignments/*.bam); do
	subjectid=${sample%%_Donor_Alignments*}
	mkdir "$subjectid"_Donor_Coverage
        samplename=${sample%%.bam}
	samplename=${samplename##CTOT_*_Donor_Alignments/CTOT_*_Donor_Anello_}
	echo $sample
	echo $subjectid
	echo $samplename
	samtools idxstats $sample > "$subjectid"_"$samplename".idxstats.tsv
	samtools view -b $sample|genomeCoverageBed -ibam stdin|grep -v 'genome'|perl /home/cchehoud/scripts/SAMformat2Coverage/coverage_counter.pl > "$subjectid"_"$samplename"_genomecoverage.txt
	mv "$subjectid"_"$samplename".idxstats.tsv "$subjectid"_Donor_Coverage/
	mv "$subjectid"_"$samplename"_genomecoverage.txt "$subjectid"_Donor_Coverage/
done
