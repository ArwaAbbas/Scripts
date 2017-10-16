#!/bin/bash
for sample in `ls *.sam`; do
	f=${sample%%.sam}
	echo $f
	samtools view -bS "$f".sam > "$f".bam
	samtools sort "$f".bam "$f".sorted
	mv "$f".sorted.bam "$f".bam
	samtools index "$f".bam
	samtools idxstats "$f".bam > "$f".idxstats.tsv
done

