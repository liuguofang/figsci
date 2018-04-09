\name{author.packages}
\alias{author.packages}
\title{ Search the extended R packages based on an author}
\usage{
author.packages(author,...)
}
\description{
 This function can be used to find author's package(s) by means of findFn function of sos package.}

\arguments{
	\item{author} {the one name of R developer.}
	\item{...} {further argument pass to  \code{\link{findFn}} function.}
}
\seealso{
\code{\link{findFn}}.
}

\examples{

pack <- author.packages("Hadley Wickham")
pack

}
