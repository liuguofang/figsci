\name{blank.fill.transform}
\alias{blank.fill.transform}
\title{Fill or clear catogies content in a data.frame}
\usage{
blank.fill.transform(dat,add.blank=FALSE)
}
\description{
Fill or clear catogies content in a data.frame. 
}
\arguments{
	\item{dat} {a data.frame}
	\item{add.blank} {the default is filling catogies content. If the arugment is TRUE, it will clear catogies content.}
}


\examples{
data(leaflife,package='smatr')

library(plyr)
d <- cbind(catcolwise(as.character)(leaflife),numcolwise(as.numeric)(leaflife))
d2 <- blank.fill.transform(d,T)
blank.fill.transform(d2)
}
