args <- commandArgs(trailingOnly = TRUE)
nomarchivo = args[1]
A = args[2]
B = args[3]
salida = args[4]
pdffile = args[5]

library(affy)
library(limma)
library(gplots)

arch=read.table(nomarchivo,header=FALSE,row.names=1)

A=as.numeric(A)
B=as.numeric(B)
N=A+B
#N es el numero total de muestras
M=N*2
design=matrix(rep(0,M),ncol=2)
colnames(design)=c("Dx1","Dx2")
for(i in 1:A){
  design[i,1]=1
  }
for(i in 1:B){
  design[i+A,2]=1
  }  
print("Tu matriz de diseno tiene la siguiente estructura:")  
print(design)
cont.matrix=makeContrasts("Dx1-Dx2",levels=design)
print("Tu matriz de contrastes tiene la siguiente estructura:")
print(cont.matrix)

fit=lmFit(arch,design) 
fit2=contrasts.fit(fit,cont.matrix)
fit3=eBayes(fit2)
contrastes=("Dx1 vs Dx2")

pdf(pdffile)
# La gráfica de volcán, coloreando los top 100 genes
volcanoplot(fit3,coef=1, highlight=100, main=contrastes) 
dev.off()
    
# guarda un archivo .csv con los genes diferencialmente expresados ordenados de acuerdo al estad'isitco
write.csv(toptable(fit3, coef=1, adjust="fdr", n=nrow(arch)), file=salida)
