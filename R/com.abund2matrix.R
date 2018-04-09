#' A com.abund2matrix function
#'
#' This function can transform community investigation data into species x quadrate matrix.
#' @dat a community abundance data with different quadrates input. 
#' @species Feed species array
#' @quadrate Feed quadrate code array
#' @abundance Feed species abundance array
#' @export
#' @examples
com.abund2matrix <- function(dat, species = "species", quadrate = "plot",
	abundance='abundance') {
	
	sp.column <- unique(dat[[species]])
	plot.row <- unique(dat[[quadrate]])
	out <- expand.grid(species = sp.column, plot = plot.row)
	names(out) <- c(species,quadrate)
	
	out <- plyr::join(out, dat)
	out[[abundance]][is.na(out[[abundance]])] <- 0	
	
	matrix(out[[abundance]], ncol = length(sp.column), 
		nrow=length(plot.row), byrow = TRUE, 
		dimnames = list(plot.row, sp.column) )
}
