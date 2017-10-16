#!/usr/bin/Rscript

#Import libraries
library(argparse)
library("stringr", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.1")
parser <- ArgumentParser()

parser$add_argument("-i", type="character", required=TRUE)
parser$add_argument("-f", type="character", required=TRUE)
#parser$add_argument("-o", type="character", required=TRUE)

args <- parser$parse_args()
write(args$i, stderr())
write(args$f, stderr())
#write(args$o, stderr())

contig_an_file <- args$i
human_list <- args$f


sample_con_an_file <- read.delim(contig_an_file, dec=",", stringsAsFactors=FALSE)
sample_hum_con_list <- read.table(human_list, quote="\"", stringsAsFactors=FALSE)


human_contigs <-(sample_hum_con_list[,1])
#nonhuman_contigs <-sample_con_an_file$contig_name %in% human_contigs
sample_human_contigs <- sample_con_an_file$contig_name %in% human_contigs
human_annotation <- sample_con_an_file[sample_human_contigs,]
#nonhuman_annotation <-sample_con_an_file [ ! nonhuman_contigs,]


sample_no_suf <- str_replace(contig_an_file, "_Minimo_contig_annotation.txt", "")
new_suf <- c("human_contig_annotation.txt")
sample_output_file <- paste(sample_no_suf, new_suf, sep="_")
print (sample_output_file)
output <- file(sample_output_file)
write.table(human_annotation, file = output, sep = "\t", quote = FALSE)
