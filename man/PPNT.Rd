% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PPNT.R
\name{PPNT}
\alias{PPNT}
\title{Title}
\usage{
PPNT(data1, data2, n1, formula)
}
\arguments{
\item{data1}{is the relationship among nodes:if one node links another, the relationship between them is 1, otherwise is 0}

\item{data2}{includes all variables needed in formula}

\item{n1}{is the number of nodes}

\item{formula}{is outcome regression on nodes,edges and covariate with 'clm'}
}
\value{
a dataframe
}
\description{
Title
}
\examples{
library(data.table)
library(PoLoNet)
library(KernSmooth)
library(akima)
data1 <- read.csv('depression_network.csv',header = FALSE)
data2 <- fread('depression_dpr.txt',header=T)
data2 <- as.data.frame(data2)
n1 <- dim(data1)[1]
formula=factor(Bipolar_Depression)~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16+X17+X18+X19+X20+V2_3+V3_4+V1_5+V4_6+V5_6+V4_7+V6_7+V7_9+V8_9+V10_11+V4_12+V8_12+V9_12+V11_12+V12_13+V13_14+V12_15+V14_15+V12_16+V15_16+V8_17+V8_19+V18_19+V11_20+V12_20+sex+PC1+PC2+PC3+PC4+PC5+PC6+PC7+PC8+PC9+PC10
outcome_PM <- PPNT(data1,data2,n1,formula)

}
