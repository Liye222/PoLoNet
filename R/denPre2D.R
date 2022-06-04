#--------denPre2D-----------#
library(KernSmooth)
library(akima)
denPre2D <- function(edge, DataPre, method = c("integers", "bandwidth")[2]) {
    x <- DataPre[, edge[1]]
    y <- DataPre[, edge[2]]
    N <- max(c(x, y))

    Width <- c(bw.nrd0(x), bw.nrd0(y))

    gridSize <- switch(method, integers = c(N, N), bandwidth = ceiling(N/c(min(Width[1]), min(Width[2]))))
    gridSize <- pmax(gridSize, 10)  # make sure there are at least 100 points in total

    # Compute a 2D Binned Kernel Density Estimate

    BSmooth <- bkde2D(x = cbind(x, y), bandwidth = Width, gridsize = gridSize)

    # Compute a Binned Kernel Density Estimate
    USmoothx <- bkde(x)
    USmoothy <- bkde(y)

    BPre <- bicubic(x = BSmooth$x1, y = BSmooth$x2, z = BSmooth$fhat, x0 = x, y0 = y)
    UPrex <- aspline(USmoothx$x, USmoothx$y, x)
    UPrey <- aspline(USmoothy$x, USmoothy$y, y)
    # make sure there are no zeros in the smooth function (since we will take a log of that)
    BPre$z <- pmax(BPre$z, 1e-10)
    UPrex$y <- pmax(UPrex$y, 1e-10)
    UPrey$y <- pmax(UPrey$y, 1e-10)

    denpre <- log(BPre$z/(UPrex$y * UPrey$y))
    denpre
}
