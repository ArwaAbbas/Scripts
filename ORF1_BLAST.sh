#!/bin/bash

for f in `ls *_Minimo_contig.fa`; do
#test one file
#for f in `ls D12002_Minimo_contig.fa`; do
	filename=${f%%_Minimo_contig.fa}
	echo $filename

blastx -db TTV_ORF1_database.fasta  -query $f -out ${filename}_ORF1_Blast.txt -evalue 10e-5 -max_target_seqs 1 -outfmt 5
more ${filename}_ORF1_Blast.txt | grep -B30 '<\Hsp_qseq>' | grep '<Iteration_query-def>\|<Hsp_align-len>\|<Hsp_qseq>' | tr '\n' '\t' | perl -pi -e 's/\<\/Hsp_qseq\>/\n/g;' | perl -ne 'chomp; my @x=split(/\>|\</); print "$x[2]\t$x[6]\t$x[10]\n";' | perl -ne 'chomp; my @x=split(/\n/); my @y=split(/\t/,$x[0]); my @z= split(/\ /,$y[0]); if ($y[1] > 500) {print ">'$filename'_$z[0]\n$y[2]\n";}' > ${filename}_ORF1_min500.fasta

done
