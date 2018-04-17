\name{package.basefuns}
\alias{package.basefuns}
\title{Dig base functions from a specific R package}
\usage{
package.basefuns(package.name)
}
\description{
This function can be used to dig base functions from a specific R package. It helps R users find the most frequently used functions in R. 
}

\arguments{
	\item{package.name} {the name of a R package.}


}

\examples{
package.basefuns("plyr")

library(plyr)
out<- llply(c("plyr","tidyr","tibble","agricolae","vegan","smatr"),package.basefuns)
out2 <- stack(unlist(out))
out2
}
