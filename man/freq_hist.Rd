\name{freq_hist}
\alias{freq_hist}
\title{Plot a Histogram with Frequency Curve}
\usage{
freq_hist(dat = NULL, bins = 10)
}
\description{
Plots a histogram of a numeric vector with an overlaid frequency (density) curve.
}
\arguments{
  \item{dat}{A numeric vector of continuous values.}
  \item{bins}{The number of bins (intervals) to use for the histogram.}
}
\examples{
data(leaflife, package = "smatr")
freq_hist(log10(leaflife$longev))
}

