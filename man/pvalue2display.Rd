\name{pvalue2display}
\alias{pvalue2display}
\title{Transform the p values based on significance level }
\usage{
pvalue2display(p)
}
\description{
This function could be used as creating tranforming the p values into p < 0.001 or p values with three digits.
}
\arguments{
	\item{p} {a vector on p values. }
}


\examples{

pvalues <- c(0.0004, 0.03, 0.5678)
pvalue2display(pvalues)

}
