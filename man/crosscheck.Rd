\name{crosscheck}
\alias{crosscheck}
\title{Check whether elements of x don't belong to y and whether elments of y don't belong to x}
\usage{
crosscheck(x, y)
}
\description{
This function can be used to check interactively whether elements from array x don't belong to array y.
}

\arguments{
	\item{x} {an array.}
	\item{y} {an array.}
}

\examples{
x <- 1:10
y <- 6:15
crosscheck(x, y)
}
