\name{data2excel}
\alias{data2excel}
\title{Save data with data.frame structure into Excel file}
\usage{
data2excel(data, filename, sheetname, create =TRUE, ...)
}
\description{
The function could be used as saving R data into  Excel. 
}
\arguments{
	\item{data} {a dataframe file.}
	\item{filename} {file name on an excel output.}
	\item{sheetname} {sheet name for an excel output.}
	\item{create} {whether create an excel or not.}
	\item{...} {default arguments suits to writeWorksheet function.}
}


\examples{
data(leaflife,package='smatr')
data2excel(dat=leaflife,filename='data on leaflife in smatr package.xlsx',
		sheetname='leaflife',create=TRUE)

browseURL("data on leaflife in smatr package.xlsx")

model <- aov(longev~site,data=leaflife)

data2excel(dat=anova(model),filename='Anova table on longevity among sites.xlsx',
		sheetname='ANOVA tale',create=TRUE)


}
