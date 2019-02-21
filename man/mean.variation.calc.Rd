\name{mean.variation.calc}
\alias{mean.variation.calc}
\title{Calculate and incorporate Mean and SD or SE and significances among groups}
\usage{
mean.variation.calc(dat,id.vars = id.vars,SD=FALSE,multicom.group='multicom.group', method = 'HSD.test')
}
\description{
The function could be used calculating and incorporating mean, SD/SE and significances (Tukey HSD test) among groups. The output can be a table in research. 
}
\arguments{
	\item{dat} {a data.frame.}
	\item{id.vars} {Categories array.}
	\item{SD} {Default is calculating SE, if SD = TRUE, it only calculates SD.}
	\item{multicom.group} {Provide a group variable used for mulitple comparisons.}
	\item{method} {one of multiple comparison approach, such as HSD.test, LSD.test, SNK.test. The default is HSD.test.} 
}
\examples{

data(leaflife,package='smatr')
mean.variation.calc(dat = leaflife,id.vars=c('site','soilp','rain'),multicom.group = 'site')

mean.variation.calc(dat = leaflife,id.vars=c('site','soilp','rain'),SD = TRUE,multicom.group = 'site')

mean.variation.calc(dat = leaflife,id.vars=c('site','soilp','rain'),SD = TRUE,multicom.group = 'site', method='LSD.test')

}
