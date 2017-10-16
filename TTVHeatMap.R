TTVCaseConHeatMap <- read.csv("~/2_CTOT_PGD_Data/CTOT_PGD/CTOT_PGD_TTV/TTVCaseConHits.csv", stringsAsFactors=FALSE)
CaseTTVReads <- TTVCaseConHeatMap[,2:38]
rownames(CaseTTVReads) <- TTVCaseConHeatMap[,1]
pheatmap((CaseTTVReads), main="TTV Hits in PGD Cases",
         cluster_rows = F, cluster_cols = F,
         cellwidth = 12, cellheight = 12, fontsize = 12,
         color = colorRampPalette(c("white", "navy", "firebrick3"))(150))
ControlTTVReads <- TTVCaseConHeatMap[,39:74]
rownames(ControlTTVReads) <- TTVCaseConHeatMap[,1]
pheatmap((ControlTTVReads), main="TTV Hits in PGD Controls",
         cluster_rows = F, cluster_cols = F,
         cellwidth = 12, cellheight = 12, fontsize = 12,
         color = colorRampPalette(c("white", "navy", "firebrick3"))(150))
TTVReads <- TTVCaseConHeatMap[,2:74]
rownames(TTVReads) <- TTVCaseConHeatMap[,1]
pheatmap((TTVReads), main="TTV Hits from NCBI Viral Database",
         cluster_rows = F, cluster_cols = F,
         cellwidth = 15, cellheight = 15, fontsize = 15,
         color = colorRampPalette(c("white", "navy", "firebrick3"))(150))
