draw.colors657 <- function(...) 
{
	myfun <- function(x) {
		if (756 - x > x)
			return("white")
		if (756 - x < x)
			return("black")
	}
	color <- colors()
	n <- length(color)
	par(mar = c(0, 0, 0, 0))
	plot(1, type = "n", xlab = "", ylab = "", xlim = c(0, 26),
			ylim = c(-1, 28), axes = F, ...)
	for (j in 1:26)
		for (i in 1:25) {
			rect(0 + i, 26 - j + 1, 1 + i, 27 - j + 1, col = color[i +
									25 * (j - 1)])
			text((0 + i + 1 + i)/2, (26 - j + 1 + 27 - j + 1)/2,
					i + 25 * (j - 1), col = myfun(sum(as.numeric(col2rgb(color[i +25 * (j - 1)])))),cex=0.7)
		}
	for (k in 1:7) {
		rect(0 + k, 0, 1 + k, 1, col = color[k + 650])
		text((0 + k + 1 + k)/2, 0.5, 650 + k, col =
						myfun(sum(as.numeric(col2rgb(color[k +650])))),cex=0.7)
	}
}
