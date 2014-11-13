
library(affy)

args <- commandArgs(trailingOnly = TRUE)

joined = read.csv(args[1], sep="\t", header=TRUE, stringsAsFactors=TRUE, row.names=1)

norm = normalize.loess(as.matrix(joined))

write.csv( norm, args[2] )
