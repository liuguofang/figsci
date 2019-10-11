intercross.point <- function(x1, y1, x2, y2, x3, y3, x4, y4) {
	k1 <- (y2 - y1)/(x2 - x1)
	k2 <- (y4 - y3)/(x4 - x3)
	a <- matrix(c(k1, -1, k2, -1), nrow=2, byrow = T)
	b <- c(k1 * x1 - y1, k2 * x3 - y3)
	solve(a, b)
}
