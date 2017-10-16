#!/bin/bash

for file in $(ls */contig.fa);do
	no_suf=${file%/contig.fa}
	output=${no_suf}_contig.fa
	echo $no_suf $output
	cp $file ../AllContigs/$output
done

