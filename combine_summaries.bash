#!/bin/bash

for file in $(ls *summary.tsv); do
	touch all_summaries.tsv
	cat $file >> all_summaries.tsv
done

