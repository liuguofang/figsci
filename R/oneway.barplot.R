#' An oneway.barplot function
#'
#' This function allows you draw a phylogenetic tree and associated barplot.
#' @data a dataframe file.
#' @response a continous variable.
#' @x.factor a category variable on x axis.
#' @method one of multiple contrast approach in HSD.test, duncan.test, LSD.test etc in agricolae package. The default is Tukey HSD.test. 
#' @alpha the Bonferroni correction using alpha/No. of comparisons, default is no bonferroni correction 
#' @... futher arguments pass to bargraph.CI
#' @export
#' @examples
oneway.barplot <- function(data = data, response = response, x.factor = x.factor,method = 'HSD.test',alpha = 0.05, ...){
	library(agricolae)
	x.factor <- eval(substitute(x.factor), envir = data)
	response <- eval(substitute(response), envir = data)
	para <- sciplot::bargraph.CI(x.factor = x.factor, data=data,response=response,...)
	model <- aov(response ~ x.factor, data = data)
	out<-get(method)(model, "x.factor",alpha=alpha)

	text(para$xvals[, 1], para$CI[2, 1, ],out$groups[levels(x.factor),'groups'],pos = 3)
}

