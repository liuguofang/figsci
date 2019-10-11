\name{intercross.point}
\alias{intercross.point}
\title{Find a intercross point between two lines}
\usage{

intercross.point(x1, y1, x2, y2, x3, y3, x4, y4) 
}
\description{
Find a intercross points between two lines (AB, CD).
}
\arguments{
	\item{x1} {the x value of point A.}
	\item{y1} {the y value of point A.}
	\item{x2} {the x value of point B.}
	\item{y2} {the y value of point B.}
	\item{x3} {the x value of point C.}
	\item{y3} {the y value of point C.}
	\item{x4} {the x value of point D.}
	\item{y4} {the y value of point D.}
  
}

\examples{
d <- data.frame(x = c(2, 5, 3, 8), y = c(8, 3, 2, 7))
with(d, plot(x, y, ylim = c(0, 8)))
segments(d$x[1], d$y[1], d$x[2], d$y[2])
segments(d$x[3], d$y[3], d$x[4], d$y[4])
#p is the point of intersection
p <- intercross.point(2, 8, 5, 3, 3, 2, 8, 7)
points(p[1], p[2], col = 2)
polygon(c(d$x[1], d$x[3], p[1]), c(d$y[1], d$y[3], p[2]), col = 2)
polygon(c(d$x[2], d$x[4], p[1]), c(d$y[2], d$y[4], p[2]), col = 3)

}
