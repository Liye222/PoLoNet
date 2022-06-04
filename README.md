# PoLoNet
We develop a proportional odds logistic model for network regression in TWAS, PoLoNet, to detect the association between a network and binary or ordinal categorical phenotype. PoLoNet relies on the two-stage TWAS framework. It first adopts the distribution-robust nonparametric dirichlet process regression model in the eQTL study to obtain the SNP effect estimate on each gene within the network. Then, PoLoNet uses pointwise mutual information to represent and capture the general relationship among the network nodes of predicted gene expression in GWAS, followed by the association analysis with all the network nodes and edges involved in proportional odds logistic model. A key feature of PoLoNet is its ability to simultaneously identify the disease-related network nodes as well as the disease-related network edges. 

This approach is described in,

>Liye Zhang†, Tao Ju†, Xiuyuan Jin, Jiadong Ji, Jiayi Han, Xiang Zhou, Zhongshang Yuan*. Network regression analysis for binary and ordinal categorical outcomes in transcriptome-wide association studies.

# Installation
It is easy to install the development version of MRAID package using the 'devtools' package.

``` 
# install.packages("devtools")  
library(devtools)  
install_github("Liye222/PoLoNet")
```
# Usage
The main function in the package is PoLoNet, you can find the instructions by '?PoLoNet'.

```
library(PoLoNet)

?PoLoNet
```
# Example
One simple example to use the package can be found at   
https://github.com/Liye222/PoLoNet/tree/main/example

# Development
This R package is developed by Zhang Liye and Ju tao
