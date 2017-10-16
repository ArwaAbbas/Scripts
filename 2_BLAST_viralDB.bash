#!/bin/bash

for f in `ls *_filtered.fasta`; do
    filename=${f%%_filtered.fasta}   

    ##running BLAST for all reads against NCBI Viral DB
    blastn -db /home/rohinis/viral_blastdb/viral.1.1.genomic.fna -query "$filename"_filtered.fasta -out "$filename"_result.out -evalue 10e-5 -max_target_seqs 1 -outfmt 7

    ##From BLAST output to tab delimited file containing coverage information
    # perl /media/THING2/christel/0_BLAST_Analysis_Tools/BlastOutput2Coverage.pl /media/THING2/christel/0_BLAST_Analysis_Tools/viral_db.list "$filename"_result.out > "$filename"_coverage.txt

     ##From BLAST output to tab delimited file containing coverage information and paired ends information
     perl /media/THING2/christel/0_BLAST_Analysis_Tools/BlastOutput2FullCoverage.pl /media/THING2/christel/0_BLAST_Analysis_Tools/viral_db.list "$filename"_result.out | sort -nk 5 -t $'\t' > "$filename"_fullcoverage.txt

done