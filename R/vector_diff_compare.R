vector_diff_compare <- function(x, y) {
	if (!is.vector(x) || !is.vector(y)) stop("Both x and y must be vectors.")
	    
	    x_not_y <- x[!x %in% y]
	    y_not_x <- y[!y %in% x]
	    
	    result <- list(x_not_y, y_not_x)
	    names(result) <- c(
	      sprintf("%s_not_%s", deparse(substitute(x)), deparse(substitute(y))),
	      sprintf("%s_not_%s", deparse(substitute(y)), deparse(substitute(x)))
	    )
	    return(result)
}
