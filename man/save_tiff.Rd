\name{save_tiff}
\alias{save_tiff}
\title{Save a tiff file after running R code that producs figure}
\usage{
save_tiff(fn, width = 6, height = 5, pointsize = 14, res=300))
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
save_tiff("保存tiff例子",width=6,height=7,pointsize=12)
}
