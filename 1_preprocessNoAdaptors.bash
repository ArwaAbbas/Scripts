#!/bin/bash

for file in $(ls *.gz);do
    gunzip $file
done

R1_reversecomp_adapter='CCGAGCCCACGAGAC'
R2_reversecomp_adapter='GACGCTGCCGACGA'

for file in $(ls *_R1_001.fastq);do
    filename=${file%%.fastq}
    cutadapt -a $R1_reversecomp_adapter -o ${filename}_noAdapter.fastq $file
done

for file in $(ls *_R2_001.fastq);do
    filename=${file%%.fastq}
    cutadapt -a $R2_reversecomp_adapter -o ${filename}_noAdapter.fastq $file
done

for file in $(ls *_noAdapter.fastq);do
    filename=${file%%_noAdapter.fastq}
    fastq_quality_trimmer -t 33 -i $file -o ${filename}.fastq_trimmed -Q 32
done

for f in `ls *_R1_001.fastq_trimmed`; do
    filename=${f%%_R1*}

    python /home/kyle/dev/IlluminaMetagenomicScripts/get_trimmed_pairs.py -f "$filename"_R1_001.fastq_trimmed -s "$filename"_R2_001.fastq_trimmed -o "$filename"_R1.fastq -t "$filename"_R2.fastq 

    echo "$filename"_R1.fastq
    cat "$filename"_R1.fastq | perl -e '$i=0;while(<>){if(/^\@M/&&$i==0){s/^\@/\>/;print;}elsif($i==1){print;$i=-3}$i++;}' > "$filename"_R1.fasta
    cat "$filename"_R2.fastq | perl -e '$i=0;while(<>){if(/^\@M/&&$i==0){s/^\@/\>/;print;}elsif($i==1){print;$i=-3}$i++;}' > "$filename"_R2.fasta
    
    ##bmttagger
    bmfilter -1 "$filename"_R1.fasta -2 "$filename"_R2.fasta -b /media/THING1/kyle/1205_PLEASE/bmtagger/hs37.bitmask -o "$filename"1_bmtool -TPR

    ##filtering human sequences
    grep -w "U" "$filename"1_bmtool.tag > "$filename"_unknown.tag
    grep -w "F" "$filename"1_bmtool.tag > "$filename"_foreign.tag
    cat "$filename"_unknown.tag "$filename"_foreign.tag > "$filename"_non_human.tag
    python /home/cchehoud/scripts/filter_human_seqs_from_con.py -i "$filename"_R1.fasta -b "$filename"_non_human.tag -o "$filename"_filtered_R1.fasta
    python /home/cchehoud/scripts/filter_human_seqs_from_con.py -i "$filename"_R2.fasta -b "$filename"_non_human.tag -o "$filename"_filtered_R2.fasta
    perl /home/cchehoud/scripts/mergeMiseqReads.pl "$filename"_filtered_R1.fasta "$filename"_filtered_R2.fasta "$filename"_filtered.fasta
done
