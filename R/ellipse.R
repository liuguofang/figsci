ellipse <- function(n = 10, a = 3, b = 4, ...) 
{
	alpha <- seq(0, 2 * pi, len = 60)
  thetre <- seq(0, pi, len = n)
	d <- cbind(cos(alpha)/a, sin(alpha)/b)
	plot(-1:1, -1:1, type = "n", xlab = "", ylab = "", axes = F)
	for (i in 1:(n - 1)) {
		dt <- cbind(d[, 1] * cos(thetre[i]) - d[, 2] * sin(thetre[i]), 
				d[, 1] * sin(thetre[i]) + d[, 2] * cos(thetre[i]))
		polygon(dt,...)
	}
}
