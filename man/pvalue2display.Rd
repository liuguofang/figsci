\name{pvalue2display}
\alias{pvalue2display}
\title{Correct the p values and r2 display due to too lower p values or r2}
\usage{
pvalue2display(p)
}
\description{
This function could be used as correctong the p values and r2 display due to too lower p values (<0.001) or r2 (<0.01).
}
\arguments{
	\item{p} {a vector on p or r2 values. }
	\item{p.r2.no} {a switch on p and r2 display correction}
	
}


\examples{

pvalues <- c(0.0004, 0.03, 0.5678)
pvalue2display(pvalues)
	
r2 <- c(0.003, 0.453, 0.087)
pvalue2display(pvalues, p.r2.no= TRUE)

}
