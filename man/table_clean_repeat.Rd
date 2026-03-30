\name{table_clean_repeat}
\alias{table_clean_repeat}
\title{Fill or clear catogies content in a data.frame}
\usage{
table_clean_repeat(dat, add.blank = FALSE)
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
d2 <- table_clean_repeat(d, add.blank = TRUE)
d2
table_clean_repeat(d2)
}
