\name{author_packages}
\alias{author_packages}
\title{Search the extended R packages based on an author}
\usage{
author_packages(author, ignore.case = TRUE, ...)
}
\description{
 This function can be used to find author's package(s) by means of findFn function of sos package.}

\arguments{
	\item{author} {the one name of R developer.}
	\item{ignore.case} {the default ignores the uppercase}
	\item{...} {further argument passes to  \code{\link{findFn}} function.}
}
\seealso{
\code{\link{findFn}}.
}

\examples{

pack <- author_packages("Hadley Wickham")
pack

}
