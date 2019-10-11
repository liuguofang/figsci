desktop_jpg <- function(saying='') {
   # from online code.
	par(bg = "white")
	par(mar = c(0, 0, 0, 0))
	plot(c(0, 1), c(0, 1), col = "white", pch = ".", xlim = c(0, 1), ylim = c(0, 
					1))
	iters <- 500
	for (i in 1:iters) {
		center <- runif(2)
		size <- 1/rbeta(2, 1, 3)  # Let's create random HTML-style colors
		color <- sample(c(0:9, "A", "B", "C", "D", "E", "F"), 12, replace = T)
		fill <- paste("#", paste(color[1:6], collapse = ""), sep = "")
		brdr <- paste("#", paste(color[7:12], collapse = ""), sep = "")
		points(center[1], center[2], col = fill, pch = 20, cex = size)
		points(center[1], center[2], col = fill, pch = 21, cex = size, 
				lwd = runif(1, 1, 4))
	}
	library(plotrix)
	par(col = "white")
	corner.label(saying, 1, 1, cex = 2)
}
