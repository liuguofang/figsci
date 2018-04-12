#' A polygon.region function
#' 
#' This function can be used to draw polygon based on x variable and its range i.e. max and min or confidence interal.
#' @dat the data comprises three columns.
#' @x.type tranform the x variable based function provided. 
#' @polygon.draw whether draw a polygon on the plot. Default denotes without drawing polygons. 
#' @...    further arguments pass to \code{polygon} function.

polygon.region <- function(dat,x=x, x.type='as.numeric', polygon.draw=FALSE,...){
	library(reshape)
	N <- nrow(dat)
	dat <- melt(dat,id.var = x)
	dat[1:N+N,x] <- dat[,x][N:1]
	dat[1:N+N,'value'] <- dat[,'value'][N+N:1]
	get(x.type)(dat[,x])->dat[,x]
	if(polygon.draw)
		polygon(dat[,x],dat[,'value'],...)
	invisible(dat)
}
