\name{randomized.block.layout}
\alias{randomized.block.layout}
\title{Draw a randomized block experiment design}
\usage{
exp.design.fig(code.matrix=NULL, quadrat.side = c(2, 2), space = c(2, 2), block = 4, treatment = 9,outside=5,...)
}
\description{
The function could be used as drawing a randomized block experiment design visually. You can change parameters including quadrate size, the distance between adjacent qudarates, the number of blocks and the number of treatments etc.  
}
\arguments{
        \item{code.matrix} {if code is available, a code matrix can be feed. Note:  block (row) by treatment (column) structure }
	\item{quadrat.side} {the side of typical quadrates.}
	\item{space} {the distance between adjacent quadrates.}
	\item{block} {the number of blocks.}
	\item{treatment} {the number of treatments or treatment combinations.}
	\item{outside} {the outer distance space for experiment setup.}
    \item{...} {further arguments pass to the \code{\link{plot}} function.}

}
\examples{
# 6 blocks, 6 fertilizer levels，5 x 5 quadrate size，2 m distance between two adjacent quadrates
randomized.block.layout(cex = 1.2,quadrat.side = c(5, 5), space=c(2, 2), treatment = 6,block = 6,xlab='',ylab='',outside = 3)

# 4 blocks, 9 fertilizer levels，2 x 2 quadrate size，1 m distance between two adjacent quadrates
randomized.block.layout(cex = 1.2,quadrat.side = c(2, 2), space = c(2, 2),treatment = 9, block = 4, space=1,xlab='',ylab='')


randomized.block.layout(matrix(1:36, ncol=9,byrow=TRUE),cex = 1.2,quadrat.side = c(2, 2), space = c(2, 2), treatment = 9, block = 4, space=1,xlab='',ylab='')

}
