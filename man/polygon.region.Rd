\name{polygon.region}
\alias{polygon.region}
\title{This function can be used to draw polygon based on x variable and its range i.e. max and min or confidence interval}
\usage{
polygon.region(dat,x=x, x.type='as.numeric', polygon.draw=FALSE,...)
}
\description{
 This function can be used to draw polygon based on x variable and its range i.e. max and min or confidence interval}
\arguments{
	\item{dat} { the data comprises three columns.}
	\item{x.type} { tranform the x variable based function provided. }
  \item{polygon.draw} {polygon.draw whether draw a polygon on the plot. Default denotes without drawing polygons. }
  \item{ ...} { further arguments pass to \code{\link{polygon}} function.}
}
\seealso{
\code{\link{polygon}}.
}
\examples{

dat <- data.frame(x = 1:10, y1 = rnorm(10,50,5), y2 =rnorm(10,30,3))
sapply(c('dplyr','plyr'),library,character.only = TRUE)
ylim <- dat[,2:3] %>% each(min,max)()

plot(dat[,'x'],type='n',ylim=ylim)
dat2 <- polygon.region(dat,x='x',polygon.draw = T,col='gray',border='gray')
dat2 %>% head

}
