library(affy)
library(limma)
library(gplots)
#datos=ReadAffy()
print("Hola este es un script para contrastar 2 tipos de diagnósticos los cuales estan agrupados en bloque (esto es que las primeras columnas aluden a un diagnóstico y las ultimas columnas a otro) todo esto en un archivo .csv ")
print("Por favor escriba el nombre de su archivo exacto, incluyendo la terminacion .csv")
nomarchivo=readline()
arch=read.table(nomarchivo,header=FALSE,row.names=1)
#archivom=as.ma(archivo)
print("Estos son las primeras lineas del archivo que has cargado")
print(head(arch))
print("Recuerda que en tu archivo las columnas deben estar agrupadas en bloques por diagnóstico: ¿Cuántos pacientes tiene con el primer diagnóstico?")
A=readline()
A=as.numeric(A)
print("¿Cuántas columnas tienes con el segundo diagnóstico?")
B=readline()
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
#Hugo=exprs(datos)
#write.table(Hugo, file="alimento.csv")
fit=lmFit(arch,design) 
fit2=contrasts.fit(fit,cont.matrix)
fit3=eBayes(fit2)
contrastes=("Dx1 vs Dx2")
print("Este es el top 10 de los genes diferencialmente expresados deacuerdo al mejor estad'istico B")
print(toptable(fit3, coef=1, adjust="fdr"))
print("La gráfica de volcán, coloreando los top 100 genes")
volcanoplot(fit3,coef=1, highlight=100, main=contrastes) 
print("A continuaci'on se guarda un archivo .csv con los 100 genes diferencialmente expresados ordenados de acuerdo al estad'isitco, llamado 100diffexp.csv ")
write.csv(toptable(fit3, coef=1, adjust="fdr",n=100),file="100diffexp.csv")
