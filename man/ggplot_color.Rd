\name{ggplot_color}
\alias{ggplot_color}
\title{A color vector from ggplot color style}
\usage{
ggplot_color(n)
}
\description{
This function can be used to produce color vector from ggplot2.
}
\arguments{
	\item{n} {the number of colors.}
}
\examples{
x <- 1:10
barplot(x,col=ggplot_color(length(x)))
}
