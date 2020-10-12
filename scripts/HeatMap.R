#http://rstudio-pubs-static.s3.amazonaws.com/267810_a987a37141024db6a24078fdd6be18e8.html

setwd("~/Documents/EvolutionOfNeurotrophins/September_2020")
install.packages("seqinr")

library(seqinr)

#seqs <- read.alignment("~/Downloads/alignment_real.fa", format = "fasta")
seqs <- read.alignment("MACSE2_Out_NT.fas", format = "fasta", whole.header = TRUE)

#seqs$nam <- n1[,1]
names = seqs$nam
x = strsplit(names, " ")
#seqs$nam <- n1[,1]
x[1:2]

aa <- dist.alignment(seqs, matrix = "similarity")
aa1 <- as.matrix(aa)
aa1

range(aa1) 


heatmap(aa1, cexRow = 0.5, cexCol = 0.5)
# Use 'scale' to normalize
#heatmap(data, scale="column")
heatmap(aa1, scale="column")
heatmap(aa1, cexRow = 0.5, cexCol = 0.5, Rowv = NA, Colv = NA)
aa2 <- aa1[1:7, 8:12]
heatmap(aa2, cexRow = 0.5, cexCol = 0.5)

#https://www.datanovia.com/en/lessons/heatmap-in-r-static-and-interactive-visualization/

# Use RColorBrewer color palette names
library("RColorBrewer")
col <- colorRampPalette(brewer.pal(10, "RdYlBu"))(350)
heatmap(aa1, scale = "none", col =  col, 
        RowSideColors = rep(c("blue", "pink"), each = 16),
        ColSideColors = c(rep("purple", 5), rep("orange", 6)))

install.packages("gplots")
library("gplots")
heatmap.2(aa1, scale = "none", col = bluered(100), 
          trace = "none", density.info = "none")

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
