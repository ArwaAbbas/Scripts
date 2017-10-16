#!/bin/bash
for ARG in $*
do
f=${ARG%%.sam}
samtools view -bS "$f".sam > "$f".bam
samtools sort "$f".bam "$f".sorted
mv "$f".sorted.bam "$f".bam
samtools index "$f".bam
samtools idxstats "$f".bam > "$f".idxstats.tsv
done

