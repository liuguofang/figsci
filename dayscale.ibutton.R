#' A dayscale.ibutton function
#' 
#' This function can be used to calculate the dayscale (24 hour) temperature or humidity based data from ibutton equipment.
#' @filename the file name from ibutton equipment.
#' @humidity.correct relative humidity correction when the strange value is over 100.

dayscale.ibutton <- function(filename = filename,humidity.correct = FALSE, start.time = '07:00'){
	# first 19 lines denote descriptive information	
	data <- read.csv(filename,skip=19) 
	blank.pos <- regexpr(" ",data$Date.Time)
	data$day <- substring(data$Date.Time,blank.pos+1)
	library(doBy)
	if(humidity.correct)
		data$Value[data$Value>100] <- 100 
	data.day <- summaryBy(Value~day,data=data,FUN=mean)
	data.day$day <- as.POSIXct(strptime(sprintf("%s %s",Sys.Date(),data.day$day), "%Y-%m-%d %H:%M:%S"))
	data.day <- data.day[order(data.day$day),]
	start.pt <- as.POSIXct(strptime(sprintf("%s %s:00",Sys.Date(),start.time), "%Y-%m-%d %H:%M:%S"))
	tag <- which.min(abs(data.day$day-start.pt))-1
	data.day$day[1:tag] <- data.day[1:tag,'day']+86400 # 86400 seconds for one day.
	row.names(data.day) <- NULL
	data.day <- data.day[order(data.day$day),]
	data.day <- rbind(data.day,data.day[1,])
	data.day[nrow(data.day),'day'] <- data.day[nrow(data.day),'day']+86400 
	data.day
}
