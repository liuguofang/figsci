\name{twoway.barplot}
\alias{twoway.barplot}
\title{Draw a two-way barplot and add significant letters onto the bars automatically}
\usage{
twoway.barplot(dat, x.factor = "x.factor",  response = "response", group = "group", method = 'HSD.test',maximum=NULL, minmum=NULL, legend=TRUE, sig.letters=NULL, legend.pos='topright',group.name=group,italic.on=FALSE, ...)
}
\description{
The function could be used as drawing two-way barplot and adding letters representing significant difference automatically. Same uppercase and lowercase denote non-significant difference between factor levels (x axis) for each of group levels and between group levels (group) for each of factor levels (x axis). }

\arguments{
	\item{dat} {a dataframe. }
	\item{x.factor} {a category variable at the x axis.}
	\item{response} {a contineous response variable. }
	\item{group} { a group variable at the y axis.}
	\item{method} {one of multiple contrast approach in \code{\link{HSD.test}}, \code{\link{duncan.test}}, \code{\link{LSD.test}} etc in agricolae package. The default is Tukey HSD.test.}
	\item{maximum} { a parameter which modifies the positions of  letters denote significance among groups in figure. }
	\item{minmum} {a parameter which modifies the lowest y range.}
	\item{legend} {default is TRUE, legend can be canceled by argument legend=FALSE}
	\item{sig.letters} {a matrix on letters denoting different significance between level and treatment}
	\item{legend.pos} {a \code{\link{legend}} position.}
	\item{group.name} {a group name on legend text. }
	\item{italic.on} {a switch to control whether italic font for group.level in legend. }
	\item{...} {further arguments pass to \code{\link{bargraph.CI}} function. }	
}

\examples{
data(leaflife, package = 'smatr')
twoway.barplot(dat=leaflife,x.factor='rain',group='soilp',response='lma')

twoway.barplot(dat=leaflife,x.factor='rain',group='soilp',response='lma',xlab='Rainfall', ylab=~LMA~(kg~m^-2))

twoway.barplot(dat=leaflife,x.factor='rain',group='soilp',response='lma',xlab='Rainfall', ylab=~LMA~(kg~m^-2),italic.on=TRUE)

twoway.barplot(dat=leaflife,x.factor='rain',group='soilp',response='lma',group.name='Soil P',
	       xlab='Rainfall', ylab=~LMA~(kg~m^-2))

}
