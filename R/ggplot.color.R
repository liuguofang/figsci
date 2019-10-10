ggplot.color <- function(n){
	library(ggplot2)
	sample.dat <- function(n) data.frame(x=rnorm(10*n),y=rnorm(n*10),group=factor(rep(1:n,each=10)))
	p <- ggplot(sample.dat(n),aes(x=x,y=y,color=group))+geom_point(aes(colour=group))
	
	color <-  unique(ggplot_build(p)$data[[1]]$colour)
	color
}
