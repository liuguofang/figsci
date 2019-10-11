\name{freq.hist}
\alias{freq.hist}
\title{Plot a histogram with frequence curve}
\usage{
freq.hist(dat = NULL, ...)
}
\description{
This function can be used to plot a histogram with frequence curve.

\arguments{
	\item{dat} {a vector with continuous values.}
}

\examples{

data(leaflife, package='smatr')
fre.hist(log10(leaflife$longev))
}

