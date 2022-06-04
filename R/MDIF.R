#---------MDIF-----------#
MDIF <- function(data, EDGE) {
    X <- (data[, EDGE[1]] - mean(data[, EDGE[1]])) * (data[, EDGE[2]] - mean(data[, EDGE[2]]))
    X
}
