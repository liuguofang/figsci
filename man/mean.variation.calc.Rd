\name{mean.variation.calc}
\alias{mean.variation.calc}
\title{Calculate and incorporate Mean and SD or SE and significances among groups}
\usage{
data2excel(data, filename, sheetname, create =TRUE)
}
\description{
The function could be used calculating and incorporating mean, SD/SE and significances (Tukey HSD test) among groups. The output can be a table in research. 
}
\arguments{
	\item{dat} {a data.frame.}
	\item{id.vars} {Categories array.}
	\item{SD} {Default is calculating SE, if SD = TRUE, it only calculates SD.}
	\item{multicom.group} {Provide a group variable used for mulitple comparisons.}
}
\examples{

data(leaflife,package='smatr')
mean.variation.calc(dat = leaflife,id.vars=c('site','soilp','rain'),multicom.group = 'site')

mean.variation.calc(dat = leaflife,id.vars=c('site','soilp','rain'),SD = TRUE,multicom.group = 'site')

}
