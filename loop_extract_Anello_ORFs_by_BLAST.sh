#!/bin/bash

#Search against a small curated database of human Anellovirus ORF1 and ORF2 amino acid sequences with no filtering of low-complexity sequences
#Extract ORF1 (minimum 250 aa) and ORF2 (minimum 50 aa) alignments
#Remove dashes from amino acid sequence
#Identify each ORF by sample it was found in
#Create database of ORF1 and ORF2 sequences

#Donor contigs

#Test one contig.Works
#for contigs in $(ls ../DonorAnelloContigs/CTOT_11-21-V1-DB-D_Anello_contigs.fa); do

#All donor contigs
for contigs in $(ls ../DonorAnelloContigs/*V1-DB-D_Anello_contigs.fa); do
	samplename=${contigs%%_Anello_contigs.fa}
	samplename2=${samplename##../DonorAnelloContigs/}
	echo $samplename2
	##ORF1
	blastx -db RefSeq_Alpha_Beta_Gamma_ORF1.fasta  -query $contigs -out ${samplename2}_ORF1_BLAST.txt -evalue 10e-5 -max_target_seqs 1 -outfmt 5 -seg no
	more ${samplename2}_ORF1_BLAST.txt | grep -B30 '<\Hsp_qseq>' | grep '<Iteration_query-def>\|<Hsp_align-len>\|<Hsp_qseq>' | tr '\n' '\t' | perl -pi -e 's/\<\/Hsp_qseq\>/\n/g;' | perl -ne 'chomp; my @x=split(/\>|\</); print "$x[2]\t$x[6]\t$x[10]\n";' | perl -ne 'chomp; my @x=split(/\n/); my @y=split(/\t/,$x[0]); my @z= split(/\ /,$y[0]); if ($y[1] > 250) {print ">'$filename'_$z[0]\n$y[2]\n";}' > ${samplename2}_ORF1.fasta
	##ORF2
	blastx -db RefSeq_Alpha_Beta_Gamma_ORF2.fasta  -query $contigs -out ${samplename2}_ORF2_BLAST.txt -evalue 10e-5 -max_target_seqs 1 -outfmt 5 -seg no
	more ${samplename2}_ORF2_BLAST.txt | grep -B30 '<\Hsp_qseq>' | grep '<Iteration_query-def>\|<Hsp_align-len>\|<Hsp_qseq>' | tr '\n' '\t' | perl -pi -e 's/\<\/Hsp_qseq\>/\n/g;' | perl -ne 'chomp; my @x=split(/\>|\</); print "$x[2]\t$x[6]\t$x[10]\n";' | perl -ne 'chomp; my @x=split(/\n/); my @y=split(/\t/,$x[0]); my @z= split(/\ /,$y[0]); if ($y[1] > 50) {print ">'$filename'_$z[0]\n$y[2]\n";}' > ${samplename2}_ORF2.fasta
done

#Recipient contigs

#Test one contig.Works
#for contigs in $(ls ../RecipientAnelloContigs/CTOT_11-03-V1-S-D_Anello_contigs.fa); do

#All Recipient contigs.
for contigs in $(ls ../RecipientAnelloContigs/*V1-S-D_Anello_contigs.fa); do
	samplename=${contigs%%_Anello_contigs.fa}
        samplename2=${samplename##../RecipientAnelloContigs/}
        echo $samplename2
        ##ORF1
        blastx -db RefSeq_Alpha_Beta_Gamma_ORF1.fasta  -query $contigs -out ${samplename2}_ORF1_BLAST.txt -evalue 10e-5 -max_target_seqs 1 -outfmt 5 -seg no
	more ${samplename2}_ORF1_BLAST.txt | grep -B30 '<\Hsp_qseq>' | grep '<Iteration_query-def>\|<Hsp_align-len>\|<Hsp_qseq>' | tr '\n' '\t' | perl -pi -e 's/\<\/Hsp_qseq\>/\n/g;' | perl -ne 'chomp; my @x=split(/\>|\</); print "$x[2]\t$x[6]\t$x[10]\n";' | perl -ne 'chomp; my @x=split(/\n/); my @y=split(/\t/,$x[0]); my @z= split(/\ /,$y[0]); if ($y[1] > 250) {print ">'$filename'_$z[0]\n$y[2]\n";}' > ${samplename2}_ORF1.fasta
	##ORF2
        blastx -db RefSeq_Alpha_Beta_Gamma_ORF2.fasta  -query $contigs -out ${samplename2}_ORF2_BLAST.txt -evalue 10e-5 -max_target_seqs 1 -outfmt 5 -seg no
	more ${samplename2}_ORF2_BLAST.txt | grep -B30 '<\Hsp_qseq>' | grep '<Iteration_query-def>\|<Hsp_align-len>\|<Hsp_qseq>' | tr '\n' '\t' | perl -pi -e 's/\<\/Hsp_qseq\>/\n/g;' | perl -ne 'chomp; my @x=split(/\>|\</); print "$x[2]\t$x[6]\t$x[10]\n";' | perl -ne 'chomp; my @x=split(/\n/); my @y=split(/\t/,$x[0]); my @z= split(/\ /,$y[0]); if ($y[1] > 50) {print ">'$filename'_$z[0]\n$y[2]\n";}' > ${samplename2}_ORF2.fasta
done

#Remove dashes from BLAST alignment.Works
for fasta in $(ls *D_ORF*.fasta); do
	samplename=${fasta%%.fasta}
	echo $samplename
	output=${samplename}_nogap.fasta
	python remove_dashes.py $fasta $output
done

#Add samplename to create a final, cleanly named file of aa seqs. Sample and contig name are separated by "__".Works
#ORF1s
for fasta in $(ls *ORF1_nogap.fasta); do
	samplename=${fasta%%_nogap.fasta}
	sampleid=${fasta%%_ORF*}
	sampleid2=${sampleid##CTOT_}
	echo $sampleid2
	echo $samplename
	python prefix_fasta.py $fasta ${sampleid2}_labeled_ORF1.fasta --separator "_" --prefix $sampleid2
done
#ORF2s
for fasta in $(ls *ORF2_nogap.fasta); do
        samplename=${fasta%%_nogap.fasta}
        sampleid=${fasta%%_ORF*}
        sampleid2=${sampleid##CTOT_}
        echo $sampleid2
        echo $samplename
        python prefix_fasta.py $fasta ${sampleid2}_labeled_ORF2.fasta --separator "_" --prefix $sampleid2
done

#Concatenate all labeled ORF1 and ORF2 seqs.Works
cat *_labeled_ORF1.fasta RefSeq_Alpha_Beta_Gamma_ORF1.fasta > RefSeq_and_CTOT_ORF1.fasta
mv RefSeq_and_CTOT_ORF1.fasta ORF1/
mv *_labeled_ORF1.fasta ORF1/

cat *labeled_ORF2.fasta RefSeq_Alpha_Beta_Gamma_ORF2.fasta > RefSeq_and_CTOT_ORF2.fasta
mv RefSeq_and_CTOT_ORF2.fasta ORF2/
mv *_labeled_ORF2.fasta ORF2/

#Cleanup intermediate files.Works
for blastoutput in $(ls *D_ORF*_BLAST.txt); do
	rm $blastoutput
done

#Remove gapped and unlabeled ungapped sequences.Works
for intermediates in $(ls CTOT*_ORF*.fasta); do
	rm $intermediates
done

