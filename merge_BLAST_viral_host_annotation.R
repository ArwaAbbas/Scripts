#!/usr/bin/env Rscript

##This will merge the host annotation result file and 
#the BROCC filtered BLAST output file for each sample

args = commandArgs(trailingOnly=TRUE)
#args = c("D11002_BROCC_filtered_BLAST_output.txt", "D11002_host_annotation.txt", 
         #"D11002_viral_tax.txt", "D11002_test_host_annotation_table_4.txt")

#test if all arguments present: if not, return an error
if (length(args)!=4) {
stop("At least four arguments must be supplied: BLAST output, host annotation, BROCC viral annotation, output", call.=FALSE)
}

blast <- read.delim(args[1], header = FALSE, stringsAsFactors = FALSE)
host <- read.delim(args[2], header = FALSE, stringsAsFactors = FALSE)
viral <- read.delim(args[3], header = FALSE, stringsAsFactors = FALSE)
output <- args[4]

merged_blast_host <- cbind(blast,host)
colnames(merged_blast_host) <- c("qseqid", "sseqid", "pident", "length", 
                                 "mismatch", "gapopen", "qstart", "qend", 
                                 "sstart", "send", "evalue", "bitscore", 
                                 "accession", "host")
colnames(viral) <- c("read", "tax")

merged_blast_host_viral <- merge(merged_blast_host, viral,
                                 by.x = "qseqid", 
                                 by.y = "read")

write.table(merged_blast_host_viral, file = output, sep = "\t", 
            quote = FALSE, col.names = TRUE, row.names = FALSE)
