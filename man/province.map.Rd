\name{province.map}
\alias{province.map}
\title{Draw a polygon map based on province name}
\usage{
provincemap(province='北京',...)
}
\description{
Draw a polygon map based on province name. The function is written in 2013 by Guofang Liu.
}
\arguments{
	\item{province} {a name of a province or city.}
	\item{...} {further arguments passed to the function \code{\link{lines}}.}
}

\examples{

setwd("E:/3R/2data/china's polygon")
province.map(province='河南')
province.map(province='内蒙')

}
