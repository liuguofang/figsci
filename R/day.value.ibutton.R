#' A day.value.ibutton function
#' 
#' This function can be used to calculate the day-mean temperature or humidity based data from ibutton equipment.
#' @filename the file name from ibutton equipment.
#' @humidity.correct humidity correction when the value is over 100.

day.value.ibutton <- function(filename = filename,humidity.correct=FALSE){ 
  # first 19 lines denote descriptive information	
  data <- read.csv(filename,skip=19) 
  blank.pos <- regexpr(" ",data$Date.Time)
  data$day <- substr(data$Date.Time,1,blank.pos-1)
  if(humidity.correct)
	data$Value[data$Value>100] <- 100 
  library(plyr)
  data.day <- ddply(data,.(day),summarise,Value.mean=mean(Value),Value.max=max(Value),Value.min=min(Value))
  #paste 20 for day like "16-3-9" data structure so that it seems to be year format.
  data.day$day <- as.Date(paste("20",data.day$day,sep='')) 
  data.day <- data.day[order(data.day$day),]
  row.names(data.day) <- NULL
  data.day
}
