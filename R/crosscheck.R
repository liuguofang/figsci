crosscheck <- function(x, y) {
	library(Hmisc)
	result <- list(x.not.y = x[x %nin% y], y.not.x = y[y %nin% x])
	names(result) <- c(sprintf("%s.not.%s", deparse(substitute(x)),  deparse(substitute(y))),
			sprintf("%s.not.%s",  deparse(substitute(y)), deparse(substitute(x))))
	result
}
