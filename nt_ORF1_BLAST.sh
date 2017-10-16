#!/bin/bash

for f in `ls *_Minimo_contig.fa`; do
    filename=${f%%_Minimo_contig.fa}
    echo $filename

blastx -db TTV_ORF1_database.fasta  -query $f -out ${filename}_ORF1_Blast.txt -evalue 10e-5 -max_target_seqs 1 -outfmt 6

done
