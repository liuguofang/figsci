    
\name{scatterplot.CI}
\alias{scatterplot.CI}
\title{Draw a scatterplot with fitted line and/or confidence line. }
\usage{

scatterplot.CI(mydata, x, y, line.col = "black", confidence.line.col = "red", confidence.line = FALSE, ...)
}

\description{
Draw a scatterplot with fitted line and/or confidence line. 
}
\arguments{
	\item{mydata} {a data.frame.}
	\item{x} {a string on x variable.}
  \item{y} {a string on y variable.}
  \item{line.col} {a color denotes the fitted line. The default is black color.}
  \item{confidence.line.col} {a color denotes the confidence line. The default is red color. It is invalid if confidence is FALSE.}
  \item{...} {further arguments to pass the function \code{\link{plot}}.}
    
}

\examples{
data(leaflife, package = "smatr")

scatterplot.CI(mydata = leaflife, x = "lma", y = "longev")
scatterplot.CI(mydata = subset(leaflife, soilp == "high"), x = "lma", y = "longev")
scatterplot.CI(mydata = subset(leaflife, soilp == "high"), x = "lma", y = "longev", confidence.line = T)

}
