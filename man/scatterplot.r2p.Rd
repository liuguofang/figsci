\name{scatterplot.r2p}
\alias{scatterplot.r2p}
\title{Draw a scatterplot with or without category/group and add r2 and p-value automatically}
\usage{
scatterplot.r2p(dat,x = x,y = y,group = NULL, intercept=TRUE, color=NULL, whole.line=FALSE,pty=NULL, cex.size=1,cornerlabel=NULL,r2.p.pos=c(0.1,0.95),txt.space=10,subfig.nrow =1, level.off=FALSE,...) 
}
\description{
The function could be used as drawing a scatterplot with or without category/group variable. In addition, r2 and p for fitted regression lines can be shown automatically.
}
\arguments{
	\item{dat} {a data.frame.}
	\item{x} {a variable in x axis.}
	\item{y} {a variable in y axis.}
	\item{group} {a group variable; the group default is NULL. }
	\item{intercept} {if intercept is FALSE, the linear model becomes y~x-1.}
	\item{color} {a color array for different groups.}
	\item{whole.line} {a fitted linear regression across all data points. }
	\item{pty} {a array on point types, which the length should match the number of group levels. }
	\item{cex.size} {a cex size in figure options. }
	\item{cornerlabel} {add a marker at corner position. }
	\item{r2.p.pos} {the position of r2.p which ranges from (0,1) for x and y axises.}
	\item{txt.space} {mofidy the distance between level marker and r2.p text.}
	\item{subfig.nrow} {default is one subplot. If you want to show multiple subplots provide provide a number of subplots vertically.}
	\item{level.off} {whether level is shown or not. }
}
\examples{
data(leaflife,package='smatr')
scatterplot.r2p(dat=leaflife,x='longev',y='lma',whole.line = T,pty=c(1,19))
scatterplot.r2p(dat=leaflife,x='longev',y='lma',group='soilp',whole.line = T,pty=c(1,19))

}
