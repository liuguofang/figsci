#' A month.cal.agenda  Function
#'
#' This function allows you to add event or tasks on calendar figure (cal function in TeachingDemos package).
#' @month Which month you want to draw
#' @year Which year you want to draw
#' @dayth which days you want to add on
#' @work  Events or tasks array. It should be same orders with dayth argument.
#' @bg.col  Background colors for events or tasks items.
#' @export
#' @examples
month.cal.agenda <- function(month =NULL, year = NULL, dayth, work, bg.col = "gray", ...) {
	if(is.null(month)){
		month <- as.numeric(strsplit(as.character(Sys.Date()),split='-')[[1]][2])
	} 
	if(is.null(year)){
		 year<- as.numeric(strsplit(as.character(Sys.Date()),split='-')[[1]][1])
	} 
	note.pos <- expand.grid(col = 1:7, row = 1:6)[, 2:1]
	weekday <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
	note.pos$day <- rep(weekday, times = 6)[1:42]
	string <- substr(as.Date(sprintf("%s-%s-01", year, month)), 1, 7)
	days31 <- as.Date(sprintf("%s-01", string)) + 0:30
	days <- days31[grep(string, days31)]
	start <- grep(weekday[as.POSIXlt(days[1])$wday + 1], note.pos$day)[1]
	note.pos <- note.pos[start + 0:length(days), ]
	month <- cbind(note.pos, work = c(days, ifelse(nrow(note.pos) - length(days), rep(NA, nrow(note.pos) - length(days)), NULL)))
	month <- month[grep(string, month$work), ]
	task.pos <- month[dayth, ]
	
	for (i in 1:nrow(task.pos)) {
		par(mfg = c(task.pos[i, 1], task.pos[i, 2]))
		polygon(c(-0.04, -0.04, 0.1, 0.1, 1.04, 1.04, -0.04), c(-0.04, 0.9, 0.9, 1.04, 1.04, -0.04, -0.04), col = bg.col)
		text(0.5, 0.5, work[i], ...)
	}
}
