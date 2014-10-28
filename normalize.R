library(affy)
library(limma,gplots)

datos = ReadAffy()

eset <- expresso(datos, bgcorrect.method="none", normalize.method="quantiles", pmcorrect.method="pmonly", summary.method="medianpolish")

niveles = data.frame(exprs(eset))
write.csv(niveles, file="niveles.csv")
