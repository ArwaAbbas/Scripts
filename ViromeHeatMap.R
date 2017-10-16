PGDViromeHeatMap <- read.csv("~/CTOT_PGD/PGDViromeHeatMap.csv", stringsAsFactors=FALSE)
SeqReads <- PGDViromeHeatMap[,2:90]
rownames(SeqReads) <- PGDViromeHeatMap[,1]
pheatmap((SeqReads),cluster_rows = F, cluster_cols = F)

