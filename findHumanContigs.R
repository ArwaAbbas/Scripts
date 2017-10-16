#!/usr/bin/Rscript

library("stringr", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.1")
library(argparse)
parser <- ArgumentParser()

parser$add_argument("-i", type="character", required=TRUE)

args <- parser$parse_args()
write(args$i, stderr())
 
contig_an_file <- args$i

sample <- read.delim(contig_an_file)

name <- (sample$contig_name)
nt_an <- (sample$nt)
contig_name_nt_an <- data.frame(ContigName=name, Nt=nt_an)

human_contigs <- grepl("Homo", contig_name_nt_an$Nt) |
grepl("Human", contig_name_nt_an$Nt)
get_human_contigs <- contig_name_nt_an[human_contigs,]
name_human_contigs <- get_human_contigs$ContigName

sample_no_suf <- str_replace(contig_an_file, "_Minimo_contig_annotation.txt", "")
human_contigs <- c("human_contig.txt")
sample_hum_contigs <- paste(sample_no_suf, human_contigs, sep="_")
print (sample_hum_contigs)

sample_output <- file(sample_hum_contigs)
writeLines(as.character(name_human_contigs), sample_output)
close(sample_output)
