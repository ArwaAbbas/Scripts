#!/bin/bash

for f in `ls *_ORF1_Blast.txt`; do
#for f in `ls *13-31-V4-B-D_S45_ORF1_Blast.txt`; do
    filename=${f%%_ORF1_Blast.txt}
    echo $filename

Rscript /media/THING1/jcaprio/CTOTACR/Mergedruns/ORFs.R /media/THING2/arwa/2_CTOT_PGD_Data/TTV_ORF1Nucleotide/$f "$filename"_R_out

done

