#' A color.alpha function
#'
#' This function creates colors corresponding to the given intensities based on colors rather than combination of red, green and blue in rgb function. 
#' @color Feed a color
#' @export
#' @examples
color.alpha <- function(color = "red", ...) {
	
	vector <- as.vector(col2rgb(color))/255
	rgb(vector[1], vector[2], vector[3], ...)
}
