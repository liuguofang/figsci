\name{temp.plot.ibutton}
\alias{temp.plot.ibutton}
\title{Plot humidity and temperature curve}
\usage{
temp.plot.ibutton(temp=temperature,humidity=NULL,plot.filename = plot.filename,width =7,height = 6,res=300)
}
\description{
This function can be used to plot temperature or humidity curve graph. Gray color is shown for regions between max and min values. If humidity data is unavailable. It can plot and save temperature curve seperately in local disk.  
}
\arguments{
	\item{temp} {the name of temperature file.}
	\item{humidity} {the name of humidity file. Default is drawing temperature curve across time.}
  \item{plot.filename} { the name of output plot.}
  \item{width} {the width of plot size. Default is 7 unit.}
  \item{height}{ the height of plot size. Default is 6 unit.}
  \item{res}{ the resolution of the plot. Default is 300 DPI.}
}
