#' An randomized.block.layout function
#'
#' This function allows you draw a layout of randomized block experiment design. 
#' @quadrat.side The side of typical quadrates
#' @space The distance between adjacent quadrates
#' @block The number of blocks
#' @treatment The number of treatments or treatment combinations 
#' @outside The outer distance space for experiment setup
#' @examples
randomized.block.layout <- function(code.matrix=NULL, quadrat.side = c(2, 2), space = c(2, 2), block = 4, treatment = 9,outside=5,...) {
    l <- quadrat.side[1] * treatment + space[1] * (treatment - 1)
    w <- quadrat.side[2] * block + space[2] * (block - 1)
    plot(1, xlim = c(-5, l + 5), ylim = c(-5, w + 5), type = "n", 
        xpd = T, axes = F, ...)
    color = gray((2:(block + 1))/(block + 2))
    color <- rep(color, each = 2)
    for (i in 1:(block * 2 - 1)) {
        for (j in 1:(treatment * 2 - 1)) {
            if (j%%2 == 0) 
                mark = F
            if (j%%2) {
                if (i%%2) 
                  mark = T
                if (i%%2 == 0) 
                  mark = F
            }
            rect(0 + quadrat.side[1] * j%/%2 + space[1] * (j - 1)%/%2, 
                0 + quadrat.side[2] * i%/%2 + space[2] * (i - 1)%/%2, 
                0 + quadrat.side[1] * (j + 1)%/%2 + space[1] * j%/%2, 
                0 + quadrat.side[2] * (i + 1)%/%2 + space[2] * i%/%2, 
                col = ifelse(mark, color[i], "white"), border = "gray")
        }
    }
    row.i <- seq(0, l, by = quadrat.side[1] + space[1]) + quadrat.side[1]/2
    col.j <- seq(0, w, by = quadrat.side[2] + space[2]) + quadrat.side[2]/2
    for (i in 1:length(col.j)) if (is.null(code.matrix)) 
        text(row.i, col.j[i], sample(1:treatment), col = ifelse(i %in% 
            1:ceiling(block/2), "white", "black"), ...)
    else text(row.i, col.j[i], code.matrix[i, ], col = ifelse(i %in% 
        1:ceiling(block/2), "white", "black"), ...)
    axis(1, at = c(-outside, 0, quadrat.side[1], quadrat.side[1] + 
        space[1], l, l + outside), labels = c(outside, 0, quadrat.side[1], 
        quadrat.side[1] + space[1], l, l + outside))
    axis(2, at = c(-outside, 0, quadrat.side[2], quadrat.side[2] + 
        space[2], w, w + outside), labels = c(outside, 0, quadrat.side[2], 
        quadrat.side[2] + space[2], w, w + outside))
    rect(-outside, -outside, l + outside, w + outside, lwd = 2)
    abline(v = 0, h = 0, col = "gray")
    abline(v = l, h = w, col = "gray")
}
