
library("reshape2")
library("plyr")
library("stringr")
library("dplyr")


#Custom function for reading in multiple files. 
read_tax_data <- function(filename){
  filedata <- read.delim(filename, header = FALSE)
  colnames(filedata) <- c("Read", "Assignment")
  filedata$Sample <- str_replace(filename, 
                                 "/media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/BROCC/Results/AllResults/", 
                                 "")
  filedata$Sample <- str_replace(filedata$Sample, "_viral_tax.txt", "")
  return(filedata)
}

#Read in sample files
tax_files <- list.files("/media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/BROCC/Results/AllResults", 
                        pattern = "viral_tax.txt", full.names = TRUE)
sample_names <- str_replace(tax_files, 
                            "/media/THING2/arwa/8_New_CTOT_PGD_DNA_HiSeq/BROCC/Results/AllResults/", 
                            "")
sample_names <- str_replace(sample_names, "_viral_tax.txt", "")

#create new file of list of reads for each sample
tax_dfs <- lapply(tax_files, read_tax_data)
read_dfs <- lapply(tax_dfs, function(x) {
  x["Assignment"] <- NULL; x })
names(read_dfs) <- sample_names

## If don't want additional variable about sample name in final file use the following:
read_dfs <- lapply(read_dfs, function(x) {
  x["Sample"] <- NULL; x })


lapply(1:length(read_dfs), function(i){ 
  write.table(read_dfs[[i]], 
            file = paste0(names(read_dfs[i]), 
                          "_BROCC_reads.txt"), 
            row.names = FALSE, quote = FALSE, 
            col.names = FALSE) 
  })




