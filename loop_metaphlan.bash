#!/bin/bash

for file in $(ls /media/THING2/christel/jacque_lung_virome_miseq/*_filtered.fasta); do
    echo $file
    samplename=`echo $file | cut -d '/' -f6 | cut -d '_' -f1-3`
    echo $samplename
    python /home/eric/3_PLEASE/7_MetaPhlAn/MetaPhlAn_1_6_7/metaphlan.py "$file" --bowtie2db /home/eric/3_PLEASE/7_MetaPhlAn/MetaPhlAn_1_6_7/bowtie2db/mpa --nproc 10 -t rel_ab -o "$samplename"_metaphlan.txt --bowtie2out "$samplename".bt2out.txt
done
