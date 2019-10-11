\name{radiate.pie}
\alias{radiate.pie}
\title{Pie plot with radiated labels}
\usage{
radiate.pie(x, labels = names(x), edges = 200, radius = 0.8, clockwise = FALSE, 
		init.angle = if (clockwise) 90 else 0, density = NULL, angle = 45, 
		col = NULL, border = NULL, lty = NULL, main = NULL, ...) 
}
\description{
Pie plot with radiated labels. The revised pie was written in 2009.
}
\arguments{
	\item{arguments} {arguments can be seen in the function \code{\link{pie}}}
}

\examples{
radiate.pie(rep(1,80),border=NA)

}
