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
#seqs$nam <- n1[,1]
#names = seqs$nam
seqs$nam
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


#for (val in seqs$nam) {
#for (i in 1:length(seqs$nam)) {
#  first = strsplit(val, " ")[[1]][2]
#  second = strsplit(val, " ")[[1]][3]
  
#  if (first == "PREDICTED:") 
#  {
#    first = strsplit(val, " ")[[1]][3]
#    second = strsplit(val, " ")[[1]][4]
#  }
  #print(c(strsplit(val, " ")[[1]][2], strsplit(val, " ")[[1]][3]) )
  #print(paste(first, second))
#  seqs$nam[i] = paste(first, second)
#}

#seqs$nam <- 

#x = strsplit(names, " ")
#seqs$nam <- n1[,1]
#x[1:2]

aa <- dist.alignment(seqs, matrix = "similarity")
aa1 <- as.matrix(aa)

#aa1
#range(aa1) 


#heatmap(aa1, cexRow = 0.5, cexCol = 0.5)
# Use 'scale' to normalize
#heatmap(data, scale="column")
#heatmap(aa1, scale="column")

#heatmap(aa1, cexRow = 0.5, cexCol = 0.5, Rowv = NA, Colv = NA)

#aa2 <- aa1[1:7, 8:12]
#heatmap(aa2, cexRow = 0.5, cexCol = 0.5)

#https://www.datanovia.com/en/lessons/heatmap-in-r-static-and-interactive-visualization/

# Use RColorBrewer color palette names
#library("RColorBrewer")
#col <- colorRampPalette(brewer.pal(10, "RdYlBu"))(350)
#heatmap(aa1, scale = "none", col =  col, 
#        RowSideColors = rep(c("blue", "pink"), each = 16),
#        ColSideColors = c(rep("purple", 5), rep("orange", 6)))

#install.packages("gplots")
#library("gplots")

#heatmap.2(aa1, scale = "none", col = bluered(400), 
#          trace = "none", density.info = "none")


## Plotting

#heatmap.2(aa1, scale = "none", col = bluered(400), cexRow = 0.5, cexCol = 0.5,
#          trace = "none", density.info = "none", reorderfun=function(d, w) reorder(d, w, agglo.FUN = mean) )

#heatmap.2(x=aa1, 
#          dendrogram="row",
#          scale="none",
#          col="bluered",
#          trace="none",
#          labCol=FALSE)

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

# END OF FILE




exit <- function() {
  .Internal(.invokeRestart(list(NULL, NULL), NULL))
}
exit()

# #########################################################################################
# Codon Alignment
# #########################################################################################
# https://www.rdocumentation.org/packages/gplots/versions/3.0.4/topics/heatmap.2
library(seqinr)
seqs <- read.alignment("MACSE2_Out_NT.fas", format = "fasta")

aa <- dist.alignment(seqs, matrix = "similarity")
aa1 <- as.matrix(aa)
library("gplots")
#heatmap.2(aa1, scale = "none", col = bluered(100), 
#          trace = "none", density.info = "none")
heatmap.2(aa1, scale = "none", col = bluered(100), cexRow = 0.5, cexCol = 0.5,
          trace = "none", density.info = "none")

heatmap.2(aa1, scale = "none", col = bluered(100), cexRow = 0.5, cexCol = 0.5,
          trace = "none", density.info = "none", reorderfun=function(d, w) reorder(d, w, agglo.FUN = mean) )
# #########################################################################################



# #########################################################################################
# Protein MSA
# #########################################################################################
protein_seqs <- read.alignment("MACSE2_Out_AA.msa", format = "fasta")

protein_aa <- dist.alignment(protein_seqs, matrix = "similarity")
protein_aa1 <- as.matrix(protein_aa)
library("gplots")

heatmap.2(protein_aa1, scale = "none", col = bluered(100), 
          trace = "none", density.info = "none")
heatmap.2(protein_aa1, scale = "none", col = bluered(100), cexRow = 0.5, cexCol = 0.5,
          trace = "none", density.info = "none")

heatmap.2(protein_aa1, scale = "none", col = bluered(100), cexRow = 0.5, cexCol = 0.5,
          trace = "none", density.info = "none", reorderfun=function(d, w) reorder(d, w, agglo.FUN = mean) )

heatmap.2(aa1, scale = "none", col = bluered(400), cexRow = 0.5, cexCol = 0.5,
          trace = "none", density.info = "none", reorderfun=function(d, w) reorder(d, w, agglo.FUN = mean) )


# #########################################################################################


library("d3heatmap")
d3heatmap(scale(aa1), colors = "RdYlBu",
          k_row = 4, # Number of groups in rows
          k_col = 2 # Number of groups in columns
)

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("ComplexHeatmap")


library("RColorBrewer")
heatmap.2(data_matrix,col=brewer.pal(11,"RdBu"),scale="row", trace="none")


# https://davetang.org/muse/2010/12/06/making-a-heatmap-with-r/
