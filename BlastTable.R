f <- list.files(".", full.names=T)
S <- sub("./", "", f)
S <- sub("_L001_fullcoverage.txt", "", S)
library(plyr)
tables <- llply(f, read.delim)
tables <- llply(1:length(tables), function (x) {
  tb <- tables[[x]]
  if (nrow(tb) > 0) {
    tb$Sample <- S[x]
  }
  tb
})
fulltable <- do.call(rbind, tables)


# load functions from reshape 2 package
library(reshape2)
readtable <- dcast(fulltable, Description ~ Sample, value.var="NumberOfReads", fill=0)
write.csv(readtable, "PGDRNAVirome.csv")

readtable <- dcast(fulltable, Description ~ Sample, value.var="FractionofGenomeCovered", fill=0)
write.csv(readtable, "PGDRNAVirome_percentcvg.csv")
