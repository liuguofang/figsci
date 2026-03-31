\name{month_cal_agenda}
\alias{month_cal_agenda}
\title{Add events or tasks on monthly calendar figure automatically}
\usage{
month_cal_agenda(month = NULL, year = NULL, dayth, work, bg.col = "gray", ...) 
}
\description{
The function could be used to add events or tasks on the calendar figure (output by the cal function in the TeachingDemos package) automatically.
}
\arguments{
  \item{month}{Which month do you want to draw?}
  \item{year}{Which year do you want to draw?}
  \item{dayth}{The order of events in one month.}
  \item{work}{Task array in which tasks are matched with the dayth.}
  \item{bg.col}{The background color of tasks that occupy a monthly calendar.}
  \item{...}{Further arguments such as text color and size, etc., passed to the \code{\link{text}} function.}
}
\seealso{
  \code{\link{cal}}
}

\examples{

library(TeachingDemos)
year <- 2026
month <- 3
cal(year,month)
title(main=paste(year,month,sep='-'),adj=0)
month_cal_agenda(month=month,year=year,dayth=c(1,3,5),work=c('play','work','outside'))
｝
