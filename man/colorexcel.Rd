\name{colorexcel}
\alias{colorexcel}
\title{Color outliers of excel data}
\usage{
colorexcel(filename, threhold, variable, more = TRUE, sheetTh = 1, color=2)
}
\description{
This function can be used to color outliers of excel data.
}

\arguments{
	\item{shp.pos } {the place of shape files.}
	\item{shp.name} {the name of shape file with bou2_4p.shp as a default.}
	\item{province } {the name of province in Chinese.}
	\item{...}{ futher arguments to pass \code{\link{lines}} and \code{\link{plot}} functions.}
}

\examples{

data(leaflife,package='smatr')

data2excel(dat = leaflife, filename = 'leaflife.xlsx', sheetname = 'Sheet1', create = TRUE)

colorexcel(filename = 'leaflife.xlsx', threhold=3, variable = 'longev', more = TRUE, sheetTh = 1,col = 3)
	
}
