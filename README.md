# PoLoNet
We develop a proportional odds logistic model for network regression in TWAS, PoLoNet, to detect the association between a network and binary or ordinal categorical phenotype. PoLoNet relies on the two-stage TWAS framework. It first adopts the distribution-robust nonparametric dirichlet process regression model in the eQTL study to obtain the SNP effect estimate on each gene within the network. Then, PoLoNet uses pointwise mutual information to represent and capture the general relationship among the network nodes of predicted gene expression in GWAS, followed by the association analysis with all the network nodes and edges involved in proportional odds logistic model. A key feature of PoLoNet is its ability to simultaneously identify the disease-related network nodes as well as the disease-related network edges. 

# Installation
It is easy to install the development version of MRAID package using the 'devtools' package.
# install.packages("devtools")
library(devtools)
`install_github("yuanzhongshang/MRAID")`
