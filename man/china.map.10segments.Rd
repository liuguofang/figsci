\name{china.map.10segments}
\alias{china.map.10segments}
\title{Draw a China map with 10 segments on islands of Southern Sea.}
\usage{
china.map.10segments(pt.dat =NULL,pt.text =NULL, ...)
}
\description{
Draw a China map with 10 segments on islands of Southern Sea. The sample points can be added accordingly. 
}
\arguments{
	\item{pt.dat} {sample points can be feeded using pt.dat argument. The default is NULL.}
	\item{pt.text} {add a text for each sample points. The default is NULL.}
}


\examples{
d <- data.frame(Num = 1:16, lat = c(44.77098, 40.34072, 37.2527,  40.78697, 43.73143, 46.30733, 40.424, 37.6111, 35.0553, 31.7174, 
29.5079, 33.0862, 33.0611, 33.9185, 24.9229, 26.6119), lon = c(83.32768, 93.76375, 96.8524, 108.71257, 116.68443, 123.02628, 115.8346, 
115.5831, 116.6581, 117.3761, 112.8241, 111.0667, 107.1358, 102.8114, 102.7242, 118.8864))

china.map.10segments(pt.dat=d[,2:3])
china.map.10segments(pt.dat=d[,3:2],pch=21,bg='gray')
china.map.10segments(pt.dat=d[,3:2],pt.text=1:16,pch=21,bg='gray',pos=3)
}
