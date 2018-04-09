\name{colorexcel}
\alias{colorexcel}
\title{Color outliers of excel data}
\usage{
colorexcel(filename, threshold, variable, more = TRUE, sheetTh = 1, color=2)
}
\description{
This function can be used to color outliers of excel data.
}

\arguments{
	\item{filename} {the excel name.}
	\item{threshold} {condition threshold for contiguous variable.}
	\item{variable} {a variable name.}
	\item{more} {satisfy condition with its values of variable over threhold or not.}
	\item{sheetTh} {the order of excel sheet. }
	\item{color} { emphasized color and default is red. }

}

\examples{

data(leaflife,package='smatr')

data2excel(dat = leaflife, filename = 'leaflife.xlsx', sheetname = 'Sheet1', create = TRUE)

colorexcel(filename = 'leaflife.xlsx', threshold=3, variable = 'longev', more = TRUE, sheetTh = 1,col = 3)
	
}
