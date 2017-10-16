#!/bin/bash
for file in `ls FilteredFasta/*interleaved.fasta`;
#test one file first
#for file in `ls FilteredFasta/D11002_interleaved.fasta`;
	do no_suf=${file%_interleaved.fasta};
	f=${no_suf#FilteredFasta/};
	idba_ud -r $file -o Contigs/$f --mink 20 --maxk 95 --num_threads 4 --pre_correction
	echo $file;
	echo $f;
done
