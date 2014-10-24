#!/usr/bin/R

# Enable read arguments from command-line

args <- commandArgs(trailingOnly = TRUE)

# Activate in order to download packages
# source("http://bioconductor.org/biocLite.R")
# biocLite("simpleaffy")
# biocLite("affyPLM")
# biocLite("limma")
# biocLite("hgu133plus2.db")
# biocLite("hgu133.db")
# biocLite("annotate")
# install.packages("RColorBrewer")

library(simpleaffy)
library(affyPLM)
library(RColorBrewer)
library(limma)
library(hgu133plus2.db)
#library(hgu133.db)
library(annotate)

# A file containing the list of CEL files to read. 

phenodata = args[1]
method = "gcrma"
platform = args[2]

if(method == "gcrma"){
	
	### GCRMA method
	
	### Read data
	celfiles = read.affy(covdesc=phenodata, path=".")
	celfiles.gcrma = gcrma(celfiles)
	
	
	### Plotting density distrinbution in both normalized and unnormalized data 
	pdf("plots_pdcb.pdf")
	
	cols <- brewer.pal(8, "Set1")
	boxplot(celfiles, col=cols)
	boxplot(celfiles.gcrma, col=cols)
	hist(celfiles, col=cols)
	hist(celfiles.gcrma, col=cols)
	
	### Quality
	celfiles.qc <- fitPLM(celfiles)
	image(celfiles.qc, which=1, add.legend=TRUE)
	image(celfiles.qc, which=4, add.legend=TRUE)
	RLE(celfiles.qc, main="RLE")
	NUSE(celfiles.qc, main="NUSE")
	
	### Clusters 
	eset <- exprs(celfiles.gcrma)
	distance <- dist(t(eset),method="maximum")
	clusters <- hclust(distance)
	plot(clusters)
	
	dev.off()
	
	celfiles.filtered <- nsFilter(celfiles.gcrma, require.entrez=FALSE, remove.dupEntrez=FALSE)
	### celfiles.filtered$filter.log
	
	
	### Finding foldchange expressions 
	samples <- celfiles.gcrma$Target
	samples <- as.factor(samples)
	design <- model.matrix(~0 + samples)
	colnames(design) <- levels(samples)
	
	fit <- lmFit(exprs(celfiles.filtered$eset), design)
	contrast.matrix <- makeContrasts(contrasts=samples, levels=design)
	result_fits <- contrasts.fit(fit, contrast.matrix)
	result_ebFit <- eBayes(result_fits)
	probeset.list <- topTable(result_ebFit, number=1000000)
	
	if(platform == "hgu133plus2"){
		#gene.symbols <- getSYMBOL(rownames(probeset.list), "hgu133plus2")
		#results <- cbind(probeset.list, gene.symbols)
		#probeset.list = cbind(rownames(probeset.list), probeset.list)
		write.table(probeset.list, "hgu133plus2_results.txt", sep="\t", quote=FALSE)
	} 
	
	
	if(platform == "hgu133"){
		gene.symbols <- getSYMBOL(probeset.list$ID, "hgu133")
		results <- cbind(probeset.list, gene.symbols)
		write.table(results, "hgu133_results.txt", sep="\t", quote=FALSE)
	} 
	
	
} 