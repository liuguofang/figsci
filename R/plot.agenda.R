#' The plot.agenda function
#'
#' This function can visualize agenda.
#' @task Feed a agenda file including only time and task variables. 
#' @period Period column when the items occur.
#' @item The task items column
#' @year.cex  Fond size for years
#' @month.cex  Fond size for months.
#' @text.left  Whether tasks are shown on the left panel or on adjacent gray rectangles.
#' @export
#' @examples
plot.agenda <- function(task, period = 'period', item = 'item',year.cex = 2, month.cex = 1, text.left = TRUE, 
		text.cex = 1.2, ...) {

	segment.month <- function(begin, end) {
		year=sort(c(substr(begin,1,4),substr(end,1,4)))
		
		Time <- expand.grid(month = 1:12, year = year[1]:year[2])
		seg = with(Time, paste(year, month, sep = "-"))
		index = match(c(begin, end), seg)
		Time.month = seg[index[1]:index[2]]
		return(Time.month)
	}
	
	position <- function(x) diff(x)/2 + x[-length(x)] 

	library(diagram)
	task[, period] <- gsub(" ", "", task[, period])
	task[, period] <- gsub("-0", "-", task[, period])
	time.interval <- sort(as.Date(paste(unlist(strsplit(task[, 
													period], "~")), 1, sep = "-")))
	time.interval <- time.interval[c(1, length(time.interval))]
	time.interval <- gsub("-01$", "", time.interval)
	number <- as.numeric(unlist(strsplit(time.interval, "-")))
	time.interval <- c(paste(number[1:2], collapse = "-"), paste(number[3:4], 
					collapse = "-"))
	Time <- segment.month(time.interval[1], time.interval[2])
	xrange <- data.frame(Time, xrange = 0:(length(Time) - 1))
	task = cbind(task, reshape::colsplit(task[,period],split='~',name=c("xmin","xmax")))
	row.names(task) = NULL
	
	for(s in c('xmin','xmax')){
		task[, s] <- as.character(task[, s])
		task[, s] <- xrange[match(task[, s], xrange[, 1]), 2] + ifelse(s=='xmax',1,0)
		}
	
	par(mar = rep(0.1, 4), cex = 1.2)
	if (text.left) {
		layout(matrix(c(0, 0, 1, 0, 2, 3, 5, 4), 4, 2), height = c(1, 
						1, nrow(task),1), widths = c(1, 30/max(nchar(as.character(task[,item])))*2))
		# left plot
		openplotmat(ylim = c(-nrow(task), 0), xlim = c(0, length(Time)))
		box()
		for (i in 1:nrow(task)) {
			text(0, (1 - 2 * i)/2, task[i, item], adj = 0, cex = text.cex, ...)
		}
	} else {
		layout(matrix(c(1,2,4,3), 4, 1), height = c(1, 1, nrow(task),1))
	}
	# first plot
	openplotmat(ylim = c(0, 1), xlim = c(0, length(Time)))
	Table = table(substr(Time, 1, 4))
	abline(v = cumsum(Table))
	text(position(c(0, cumsum(table(substr(Time, 1, 4))))), 0.5, 
			row.names(Table), cex = year.cex, ...)
	box()
	# second and fourth plot
	replicate(2,{
	openplotmat(ylim = c(0, 1), xlim = c(0, length(Time)))
	box()
	abline(v = 1:length(Time))
	Month=substr(Time, 6, 100)
	text(position(0:length(Time))+ifelse(nchar(Month)==2,-0.25,0), 0.5, Month , cex = month.cex, 
			...)})
	# third plot
	openplotmat(ylim = c(-nrow(task), 0), xlim = c(0, length(Time)))
	box()
	space <- cbind(task$xmin,max(task$xmax)-task$xmax)
	for (i in 1:nrow(task)) {
		rect(task[i, 'xmin'], -i, task[i, 'xmax'], 1 - i, col = "gray")
		if (!text.left) 
			if(space[i,1]<space[i,2])
			text(task[i, 'xmax'], (1 - 2 * i)/2, task[i, item], adj = 0, cex = text.cex, ...) else
			text(task[i, 'xmin'], (1 - 2 * i)/2, task[i, 
							2], adj = 1, cex = text.cex, ...) 
	}
} 
