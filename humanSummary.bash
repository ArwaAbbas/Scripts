#!/bin/bash

echo -e "Sample\tTotal\tTotal Paired\tFiltered (NonHuman)\tFiltered (NonHuman) Paired\tFraction Non-Human"

for f in `ls *_filtered.fasta`; do
    filename=${f%%_filtered.fasta}
    # R1 reads
    r1=`grep -c '>' "$filename"_R1.fasta`

    # R2 reads
    r2=`grep -c '>' "$filename"_R2.fasta`
    total=$(($r1+$r2))

    # Human reads from BMTagger
    non_human=`wc -l "$filename"_non_human.tag | cut -f1 -d ' '`
   
    # Non-human (filtered) paired reads 
    filtered=`grep -c '>' "$filename"_filtered.fasta`

    fraction=$(echo "$filtered $total" | awk '{printf "%.2f \n", $1/$2}')

    echo -e "$filename\t$total\t$r1\t$filtered\t$non_human\t$fraction"
    
done
