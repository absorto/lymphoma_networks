library(affy)
library(limma,gplots)
library(GO.db)
library(annotate)


args <- commandArgs(trailingOnly = TRUE)
platform = args[1]

if (platform == "hgu133plus2") {
    library(hgu133plus2.db)
    annDB = "hgu133plus2.db"
}

if (platform == "hgu133") {
    library(hgu133a.db)
    annDB = "hgu133a.db"
}

if (platform == "hugene-1_0-st") {
    library(hgu133a.db)
    annDB = "hugene-1_0-st"
}

# read 'em
datos = ReadAffy()
# normalize 'em
eset <- expresso(datos, bgcorrect.method="none", normalize.method="quantiles", pmcorrect.method="pmonly", summary.method="medianpolish")
# add gene ids
misDatos = exprs(eset)
misIDs = rownames(misDatos)
probenames <- as.character(misIDs)
entID <- getEG(probenames,annDB)
sym <- getSYMBOL(probenames,annDB)
geneExpData <- data.frame(sym, misDatos[, -1])
indx.NA = !is.na(geneExpData$sym)
geneExpData = geneExpData[indx.NA,]
# write 'em!
write.csv(geneExpData, file="niveles_genids.csv")
