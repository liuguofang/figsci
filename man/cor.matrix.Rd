\name{cor.matrix}
\alias{cor.matrix}
\title{Produce a correlation matrix.}
\usage{
cor.matrix(dat,method='pearson')
}
\description{
This function can be used to produce a correlation matrix which lower triangle is correlation coefficent and upper triangle is p values.
}

\arguments{
	\item{dat} {an dataset with continuous variables.}
	\item{method} {The method used to calcuate cor test. Also the \code{\link{cormat}} function of pigrmess package}
}

\examples{


(out <- cor.matrix(iris[,-5]))

data2excel(dat = out, filename = 'correlation res.xlsx', sheetname = 'Sheet1', create = TRUE)

}
