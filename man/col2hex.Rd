\name{col2hex}
\alias{col2hex}
\title{Transform a color into a color with different intensities}
\usage{
col2hex(color = "red", ...) 
}
\description{
Create a legend with north direction.
}
\arguments{
	\item{color} {one color}
	\item{...} {further arguments passed to the function \code{\link{rgb}}.}
}


\examples{

x <- rnorm(1000,10,2)
y <- x +rnorm(1000)
plot(x,y,col=col2hex('red',0.2))
}
