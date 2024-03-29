
#' Title
#'
#' @param data1 is the relationship among nodes:if one node links another, the relationship between them is 1, otherwise is 0
#' @param data2 includes all variables needed in formula
#' @param n1 is the number of nodes
#' @param formula is outcome regression on nodes,edges and covariate with 'clm'
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' library(data.table)
#' library(PoLoNet)
#' library(KernSmooth)
#' library(akima)
#' data1 <- read.csv('depression_network.csv',header = FALSE)
#' data2 <- fread('depression_dpr.txt',header=T)
#' data2 <- as.data.frame(data2)
#' n1 <- dim(data1)[1]
#' formula=factor(Bipolar_Depression)~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16+X17+X18+X19+X20+V2_3+V3_4+V1_5+V4_6+V5_6+V4_7+V6_7+V7_9+V8_9+V10_11+V4_12+V8_12+V9_12+V11_12+V12_13+V13_14+V12_15+V14_15+V12_16+V15_16+V8_17+V8_19+V18_19+V11_20+V12_20+sex+PC1+PC2+PC3+PC4+PC5+PC6+PC7+PC8+PC9+PC10
#' outcome_PM <- PPNT(data1,data2,n1,formula)
#'
PPNT <- function(data1, data2, n1, formula) {
    library(data.table)
    library(ordinal)
    #-------------EDGE-------------#
    b <- unlist(data1)  #data1 is the relationship among nodes:if one node links another, the relationship between them is 1, otherwise is 0
    sigma <- matrix(b, nrow = n1)  #n1 is the number of nodes
    sigma0 <- sigma
    sigma0[lower.tri(sigma0, diag = T)] <- 0
    EDGE <- which(sigma0 != 0, arr.ind = T)
    #-------------PM----------------#
    MDIPreData <- apply(EDGE, 1, MDIF, data = data2)
    colname <- apply(EDGE, 1, RENAME, varname = "V")
    colnames(MDIPreData) <- colname
    MDIFitData <- cbind(data2, MDIPreData)
    MDIFitData <- data.frame(MDIFitData)
    #----------Regression------------#
    MDIfit <- clm(formula, data = MDIFitData)
    MDItemp <- summary(MDIfit)
    MDItem <- MDItemp$coefficients
    MDItem <- data.frame(round(MDItem, 5))

    return(MDItem)
}
