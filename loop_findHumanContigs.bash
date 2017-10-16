#!/bin/bash

for file in $(ls *contig_annotation.txt); do
	./findHumanContigs.R -i ${file}
done

 
