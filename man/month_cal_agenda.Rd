\name{month_cal_agenda}
\alias{month_cal_agenda}
\title{Add events or tasks on monthly calendar figure automatically
}
\usage{
month_cal_agenda(month =NULL, year = NULL, dayth, work, bg.col = "gray", ...) 
}
\description{
The function could be used as adding events or tasks on the calendar figure (output by cal function in TeachingDemos pacakge) automatically. 
}
\arguments{
	\item{month} {which month do you want to draw?}
	\item{year} {which year do you want to draw?}
	\item{dayth} {the order of events in one month.}
	\item{work} {task array in which taskments are match with the dayth. }
	\item{bg.col} {the background color of tasks which occupy in a monthly calendar.}
	\item{...} {further arguments such as text color and size etc. passed to the \code{\link{text}} function.}
}
\seealso{ 
\code{\link{cal}}
}
\examples{
library(TeachingDemos)
year=2026; month=3
cal(year=year,month=month)
title(main = sprintf("%d-%02d", year, month),out=T,adj=0,cex=2)
month_cal_agenda(dayth = c(1, 3, 5), work = c("Work","Playing games\n outside.",
	"Go to field"), cex = 1.2, xpd = TRUE) 
}
