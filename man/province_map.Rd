\name{province_map}
\alias{province_map}
\title{Draw a polygon map based on province name}
\usage{
 province_map(nation.edge = 'bou2_4p.shp', province = '北京',...)
}
\description{
Draw a polygon map based on province name. The function is written in 2013 by Guofang Liu.
}
\arguments{
	\item{province} {a name of a province or city.}
	\item{...} {further arguments passed to the function \code{\link{lines}}.}
}

\examples{

setwd("D:/Analysis and Graphics/data/china's polygon")
province_map(province='河南')
province_map(province='内蒙')

}
