library(ChIPseeker)
library(GenomicFeatures)
library(ggplot2)

gtf <- makeTxDbFromGFF('/mnt/may1nov1/u5009/01.genome/pal_hap2_final/Palv.hap2.chr.longest.gtf')

data_all = read.csv('BEDTitle.csv')

J = data_all$BED

for (j in J) {
  file = paste(j, "bed", sep = ".")  # 生成文件名
  peakAnno <- annotatePeak(file, tssRegion = c(-3000, 0), TxDb = gtf)
  write.csv(peakAnno, file = paste(j, ".csv", sep = ""))
  BAR = plotAnnoBar(peakAnno, title = j)
  ggsave(BAR, file = paste(j, ".pdf", sep = ""), width = 6, height = 4)
 
  pdf(file = paste(j, "pie.pdf", sep = ""), width = 6, height = 4)
  plotAnnoPie(peakAnno)
  dev.off()
}
