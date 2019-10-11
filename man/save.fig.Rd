\name{save.fig}
\alias{save.fig}
\title{Save a tiff, eps and pdf files concurrently after running R code that producs a figure}
\usage{
save.fig(fn, width = 6, height = 5, pointsize = 12, res=300)
}
\description{
This function can be used to save a tiff file after running R code that producs figure.
}
\arguments{
	\item{fn} {a file name.}
	\item{width} {width of figure.}
	\item{height} {height of figure.}
	\item{pointsize} {the size of point/text.}
	\item{res} {resolution of the tiff file.}
}
\examples{
# 例子
plot(rnorm(100))
save.fig("同时保存tiff、eps、pdf格式的图",width=6,height=7,pointsize=12)
	
}
