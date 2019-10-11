\name{add_trans}
\alias{add_trans}
\title{Create a color vector with different overlapping colors}
\usage{
add_trans(color,trans)
}
\description{
Create a color vector with different overlapping colors 
}
\arguments{
	\item{color} {a string describing a colour. }
	\item{trans} {adds transparancy to a colour.}
}


\examples{
cols <- sample(c("red","green","blue"),100,TRUE)

plot(rnorm(100),rnorm(100),col=add_trans(cols,10),pch=16,cex=2)

}
