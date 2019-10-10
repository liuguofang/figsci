\name{ggplot.color}
\alias{ggplot.color}
\title{A color vector from ggplot.color style}
\usage{
ggplot.color(n)
}
\description{
This function can be used to produce color vector from ggplot2.
}
\arguments{
	\item{n} {the number of colors.}
}
\examples{
x <- 1:10
barplot(x,col=ggplot.color(length(x)))
}
