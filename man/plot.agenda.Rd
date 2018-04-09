\name{plot.agenda}
\alias{plot.agenda}
\title{Visualize a agenda according to an agenda dataset}
\usage{
plot.agenda(task, period = 'period', item = 'item',year.cex = 2, month.cex = 1, text.left = TRUE, 
		text.cex = 1.2, ...)
}
\description{
This function could be used as creating agenda figure. There are two types of visualization. First items can be appeared on the left. The second is that items can be appeared adjacent gray rectangles.
}
\arguments{
	\item{task} {a agenda file including only time and task variables. }
	\item{period} {period column when the task items occur.}
	\item{item} {the task items column.}
	\item{year.cex} { the fond size for year.}
	\item{month.cex} { the fond size for months.}
	\item{text.left} { whether tasks are shown on the left panel or on adjacent gray rectangles.}
	\item{text.cex} { the fond size for task texts.}
	\item{...} {further arguments pass to the \code{\link{text}} function.}
	
}
\seealso{ 
\code{\link{cal}}
}
\examples{

d <- data.frame(period = c("2011-4 ~ 2011-4", "2011-5~2011-6", "2011-6~2011-7", 
				"2011-7~2011-9", "2011-9~2012-1", "2012-01~2012-2", "2012-2~2012-10", "2012-9~2012-12"), 
		item = c("This is the first task", "This is the second task", "This is the third task", 
				"This is the fourth task", "This is the five task", "This is the sixth task", 
				"This is the seventh task", "This is the eighth task"))

plot.agenda(task=d, period = 'period',item='item',text.cex = 1.5, month.cex = 1.5)

plot.agenda(task=d,  period = 'period',item='item',text.cex = 1.5, month.cex = 1.5, text.left = FALSE) 

}
