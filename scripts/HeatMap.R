## Use this script to analyze both the codon and protein alignments for BDNF.
## Reference: http://rstudio-pubs-static.s3.amazonaws.com/267810_a987a37141024db6a24078fdd6be18e8.html

## First set working directory, manually.
#setwd("~/Documents/EvolutionOfNeurotrophins/September_2020")
setwd("~/Documents/BDNF/2021/EvolutionOfNeurotrophins")

## Installers, this library is important for functionality of this script.
#install.packages("seqinr")
#install.packages("gplots")

## Load the libraries.
library(seqinr)
library("RColorBrewer")
library("gplots")

## Declares
#seqs <- read.alignment("~/Downloads/alignment_real.fa", format = "fasta")
#seqs <- read.alignment("MACSE2_Out_NT.fas", format = "fasta", whole.header = TRUE)
# Load the Alignments
seqs <- read.alignment("analysis/MACSE2_Out_AA.fas", format = "fasta", whole.header = TRUE)

## Process the sequence names
for (i in 1:length(seqs$nam)) {
  val = seqs$nam[i]
  print(val)
  first = strsplit(val, " ")[[1]][2]
  second = strsplit(val, " ")[[1]][3]
  
  if (first == "PREDICTED:") 
  {
    first = strsplit(val, " ")[[1]][3]
    second = strsplit(val, " ")[[1]][4]
  }
  #print(c(strsplit(val, " ")[[1]][2], strsplit(val, " ")[[1]][3]) )
  #print(paste(first, second))
  seqs$nam[i] = paste(first, second)
}

## Do matrix calculations
aa <- dist.alignment(seqs, matrix = "similarity")

## Convert to R matrix type, will be used for plotting
aa1 <- as.matrix(aa)

## Plotting
# Default for now
# https://www.rdocumentation.org/packages/gplots/versions/3.1.1/topics/heatmap.2
# https://biocorecrg.github.io/CRG_RIntroduction/heatmap-2-function-from-gplots-package.html
#density info can be histogram or density or none

heatmap.2(x=aa1, 
          Colv=FALSE, 
          density.info="histogram",
          dendrogram="row",
          col="bluered",
          trace="none",
          labCol=FALSE,
          cexRow=1,cexCol=1,margins=c(12,8))

## END OF FILE

exit <- function() {
  .Internal(.invokeRestart(list(NULL, NULL), NULL))
}
exit()

 
