#!/usr/bin/Rscript
# Usage: Rscript myscript.R networkfile(in 2 columns) outputname
#
# The network file should be separated by tab

library(ballgown)
library(RSkittleBrewer)
library(genefilter)
library(dplyr)
library(ggplot2)
library(gplots)
library(devtools)
library(RFLPtools)

setwd("")
list.files()
list.files("ballgown/")
[1] "athaliana_EE_Rep1" "athaliana_EE_Rep2" "athaliana_EE_Rep3"
[4] "athaliana_wt_Rep1"     "athaliana_wt_Rep2"     "athaliana_wt_Rep3" 

sample<-c("athaliana_EE_Rep1","athaliana_EE_Rep2", "athaliana_EE_Rep3", "athaliana_wt_Rep1", "athaliana_wt_Rep2", "athaliana_wt_Rep3" )
type<-c(rep("EE",3),rep("wt",3))
pheno_df<-data.frame("sample"=sample,"type"=type)
rownames(pheno_df)<-pheno_df[,1]
pheno_df


bg <- ballgown(dataDir = ".", pData=pheno_df, samplePattern = "athaliana")

gene_expression = gexpr(bg) #extract fpkm values of genes
head(gene_expression)
boxplot(log10(gene_expression+1),names=c("EE1","EE2","EE3","WT1","WT2","WT3"),col=c("red", "red","red","blue", "blue","blue")


samples<-c("EE1","EE2","EE3","WT1","WT2","WT3")
colnames(gene_expression)<-samples

library("genefilter")
library("ggplot2")
library("grDevices")

# identify the variance in the genes
rv <- rowVars(gene_expression)
select <- order(rv, decreasing=T)[seq_len(min(500,length(rv)))]
pc<-prcomp(t(gene_expression[select,]),scale=TRUE)
pc$x
scores <- data.frame(pc$x, samples)
scores 
pcpcnt<-round(100*pc$sdev^2/sum(pc$sdev^2),1)
names(pcpcnt)<-c("PC1","PC2","PC3","PC4","PC5","PC6")
# Lets see how much variance is associate with each p[rincipal component.
pcpcnt

point_colors = c("red", "red","red","blue", "blue", "blue")
plot(pc$x[,1],pc$x[,2], xlab="", ylab="", main="PCA plot for all libraries",xlim=c(min(pc$x[,1])-2,max(pc$x[,1])+2),ylim=c(min(pc$x[,2])-2,max(pc$x[,2])+2),col=point_colors)
text(pc$x[,1],pc$x[,2],pos=2,rownames(pc$x), col=c("red", "red","red","blue", "blue", "blue"))
plot(pc$x[,1],pc$x[,2], xlab="PC1", ylab="PC2", main="PCA plot for all libraries",col=point_colors)

results_transcripts = stattest(bg, feature="transcript" , covariate = "type" , 
getFC = TRUE, meas = "FPKM")

results_genes = stattest(bg, feature="gene" , covariate = "type" , getFC = TRUE, meas = "FPKM")