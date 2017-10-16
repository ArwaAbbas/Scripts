PGDViromeCaseConHeatMap <- read.csv("~/CTOT_PGD/PGDViromeCaseConHits.csv", stringsAsFactors=FALSE)
CaseSeqReads <- PGDViromeCaseConHeatMap[,2:38]
rownames(CaseSeqReads) <- PGDViromeCaseConHeatMap[,1]
pheatmap((CaseSeqReads), main="NCBI Viral Database Hits of PGD Cases",
         cluster_rows = F, cluster_cols = F,
         cellwidth = 3, cellheight = 3, fontsize = 3,
         color = colorRampPalette(c("white", "navy", "firebrick3"))(100))
ControlSeqReads <- PGDViromeCaseConHeatMap[,39:74]
rownames(ControlSeqReads) <- PGDViromeCaseConHeatMap[,1]
pheatmap((ControlSeqReads), main="NCBI Viral Database Hits of Controls",
         cluster_rows = F, cluster_cols = F,
         cellwidth = 12, cellheight = 12, fontsize = 12,
         color = colorRampPalette(c("white", "navy", "firebrick3"))(100))