\name{dnorm.curve}
\alias{dnorm.curve}
\title{Draw normal density curve based on mean and standard deviation}
\usage{
dnorm.curve(M, SD,xlab='',...) 
}
\description{
The function could be used as drawing normal density curve based on mean and standard deviation. It benefits to capture the variation in mean annual among past several decades.  
}
\arguments{
	\item{M} {a mean value.}
	\item{SD} {a standard deviation.}
	\item{xlab} {a expression denoting label on x axis.}
	\item{...} {the default arguments passed to \code{\link{curve}} function.}
}

\examples{
M <- 26.676471; SD <- 3.682231
dnorm.curve(M = M, SD = SD,xlab=Growth~season~rain~pulse~'No.')
}
