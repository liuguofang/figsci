\name{freq.hist}
\alias{freq.hist}
\title{Plot a histogram with frequence curve}
\usage{
freq.hist(dat = NULL, bins = 10)
}
\description{
This function can be used to plot a histogram with frequence curve.

\arguments{
	\item{dat} {a vector with continuous values.}
    \item{bins} {the number of bins (intervals) used to divide the data in the histogram}
}

\examples{

data(leaflife, package='smatr')
fre_hist(log10(leaflife$longev))
}

