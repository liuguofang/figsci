\name{highlight_excel_cells}
\alias{highlight_excel_cells}
\title{Color outliers of excel data}
\usage{
highlight_excel_cells(filename, threshold, variable, more = TRUE, sheet.name, color=2)
}
\description{
This function colors cells in an Excel sheet where a variable meets a specified threshold.
}

\arguments{
	\item{filename} {the excel name.}
	\item{threshold} {condition threshold for contiguous variable.}
	\item{variable} {a variable name.}
	\item{more} {satisfy condition with its values of variable over threhold or not.}
	\item{sheet.name} {the name of Excel sheet. }
	\item{color} { emphasized color and default is red. }

}

\examples{

data(leaflife,package='smatr')

data2excel(dat = leaflife, filename = 'leaflife.xlsx', sheetname = 'Sheet1', create = TRUE)

highlight_excel_cells(filename = 'leaflife.xlsx', threshold=3, variable = 'longev', more = TRUE, sheetTh = 1,col = 3)
	
}
