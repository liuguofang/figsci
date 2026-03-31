\name{color_alpha}
\alias{color_alpha}
\title{Create a color corresponding to the given intensities}
\usage{
color_alpha(color = "red", ...)
}
\description{
This function could be used as creating a color based on the given intensities of points. 
}
\arguments{
	\item{color} {a string describing a colour. }
	\item{...} {further arguments pass to \code{\link{rbg}} function. }
}


\examples{
color <- color_alpha("blue",alpha=0.25)

N <- 2000
x <- rnorm(N,50,5)
y <- x +rnorm(N)
plot(x, y,col=color, pch=19)

}
