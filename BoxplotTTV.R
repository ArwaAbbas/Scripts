##The values in these tables have not had SM buffer BG noise subtracted

boxplot (MeanTTV ~ Group, data=CaseConDonorV1TTV, 
         main="TTV BAL Titers in PGD Cases and Control",
         ylab="TTV Copies/mL BAL")
         
t.test(MeanTTV ~ Group, data=CaseConDonorTTV)
wilcox.test (MeanTTV ~ Group, data=CaseConDonorTTV)
t.test(MeanTTV ~ Group, data=CaseConV1TTV)
wilcox.test(MeanTTV ~ Group, data=CaseConV1TTV)


CaseDonorTTV <- PairedTTVComparison[,3]
ConDonorTTV <- PairedTTVComparison[,4]
t.test(CaseDonorTTV,ConDonorTTV, paired=TRUE)

CaseV1TTV <- PairedTTVComparison[,5]
ConV1TTV <- PairedTTVComparison[,6]
t.test(CaseV1TTV,ConV1TTV, paired=TRUE)

CaseDiff <- PairedTTVComparison[,7]
ConDiff <- PairedTTVComparison[,8]
t.test(CaseDiff,ConDiff, paired=TRUE)

#log transformed data set
boxplot (LogMeanTTV ~ Group, data=LogCaseConDonorV1TTV, 
         main="TTV BAL Titers in PGD Cases and Control",
         ylab="Log10 TTV Copies/mL BAL")

boxplot (LogMeanTTV ~ Group, data=LogCaseConDonorTTV, 
         main="TTV Donor BAL Titers in PGD Cases and Controls",
         ylab="Log10 TTV Copies/mL BAL")
t.test(LogMeanTTV ~ Group, data=LogCaseConDonorTTV)
wilcox.test (LogMeanTTV ~ Group, data=LogCaseConDonorTTV)

boxplot (LogMeanTTV ~ Group, data=LogCaseConV1TTV, 
         main="TTV Post Reperfusion BAL Titers in PGD Cases and Controls",
         ylab="Log10 TTV Copies/mL BAL")
t.test(LogMeanTTV ~ Group, data=LogCaseConV1TTV)
wilcox.test (LogMeanTTV ~ Group, data=LogCaseConV1TTV)

LogCaseDonorTTV <- LogPairedTTVComparison[,3]
LogConDonorTTV <- LogPairedTTVComparison[,4]
t.test(CaseDonorTTV,ConDonorTTV, paired=TRUE)

LogCaseV1TTV <- LogPairedTTVComparison[,5]
LogConV1TTV <- LogPairedTTVComparison[,6]
t.test(CaseV1TTV,ConV1TTV, paired=TRUE)

LogCaseDiff <- LogPairedTTVComparison[,7]
LogConDiff <- LogPairedTTVComparison[,8]
t.test(CaseDiff,ConDiff, paired=TRUE)
