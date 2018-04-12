\name{temp.dayscale.plot.ibutton}
\alias{temp.dayscale.plot.ibutton}
\title{Plot dayscale temperature and humidity}
\usage{
temp.dayscale.plot.ibutton(temp=temperature,humidity=NULL,plot.filename = plot.filename,width =7,height = 6,res=300,start.time='07:00')
}
\description{
This function can be used to plot dayscale temperature and humidity data from ibutton equipment.  
}
\arguments{
	\item{temp} {the name of temperature file.}
	\item{humidity} {the name of humidity file. Default is drawing dayscale temperature curve. }
  \item{plot.filename} { the name of output plot. }
  \item{width} {the width of plot size. Default is 7 unit.}
  \item{height} { the height of plot size. Default is 6 unit.}
  \item{res } {the resolution of the plot. Default is 300 DPI.}
  \item{res}{start.time } {the start point of temperature or humidity graph}
        
}
