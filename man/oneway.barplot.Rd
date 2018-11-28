\name{oneway.barplot}
\alias{oneway.barplot}
\title{Plot a one-way barplot associated with lowercase representing statically significant difference}
\usage{
oneway.barplot(data = data, response = response, x.factor = x.factor, method = 'HSD.test', alpha=0.05, ...)
}
\description{
The function could be used as plotting a one-way barplot. In addition, the figure will be added lowercase on bars automatically by means of HSD.test function in agricolae package.  
}
\arguments{
	\item{data} {a dataframe file.}
	\item{response} {a continous variable.}
	\item{x.factor} {a category variable on x axis.}
	\item{method} {one of multiple contrast approach in \code{\link{HSD.test}}, \code{\link{duncan.test}}, \code{\link{LSD.test}} etc in agricolae package. The default is Tukey HSD.test.} }
        \item{alpha} {the Bonferroni correction using alpha/No. of comparisons, default is no bonferroni correction.}
	\item{...} {futher arguments pass to the \code{\link{bargraph.CI}} function.}

}

\examples{

data(leaflife, package='smatr')

par(xpd=TRUE)
oneway.barplot(data=leaflife,response=lma,x.factor=site)

}
