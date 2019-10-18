\name{mean.se}
\alias{mean.se}
\title{Calculate mean and standard error (se) of continuous variables among different factors from a data.frame.}
\usage{
mean.se(data,...)
}
\description{
This function can be used to calculate mean and standard error (se) of continuous variables among different factors from a data.frame.
}
\arguments{
	\item{data} {a data.frame that should contains continuous variable(s) and factor variable(s). }
    \item{...} {further arguments passed to or from other methods.}
}

\examples{

data(leaflife,package='smatr') 
mean.se(leaflife)
}

