\name{dayscale.ibutton}
\alias{dayscale.ibutton}
\title{Calculate the dayscale (24 hour) temperature or humidity based data}
\usage{
dayscale.ibutton(filename = filename,humidity.correct = FALSE, start.time = '07:00')
}
\description{
This function can be used to calculate the dayscale (24 hour) temperature or humidity based data from ibutton equipment.
}
\arguments{
	\item{filename} { the file name from ibutton equipment.}
  \item{humidity.correct} {relative humidity correction when the strange value is over 100.}
	\item{start.time} {order day-scale data based on start.time. Default is "07:00"}
}
