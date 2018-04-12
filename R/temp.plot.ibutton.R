
#' A temp.plot.ibutton function
#' 
#' This function can be used to plot humidity and temperature curve graph.
#' @temp the name of temperature file.
#' @humidity the name of humidity file. Default is drawing temperature curve across time. 

temp.plot.ibutton <- function(temp=temperature,humidity=NULL){
	if(!is.null(humidity))  layout(matrix(1:2,ncol=1))
	sapply(c('dplyr','plyr'),library,character.only = TRUE)
	temp.range <- temperature[,c("Value.max",'Value.min')] %>% each(max,min)()
	temp.range <- ceiling(abs(temp.range))*sign(temp.range)
	par(mar=rep(1,4),omi=c(0.8,0.7,0.1,0.1))
	plot(Value.mean~as.Date(day),data = temperature,type='n',xaxt='n',ylab='',xlab='',ylim=sort(temp.range))
	figsci::polygon.region(temperature[,c("day","Value.min", "Value.max")],
			x='day',x.type='as.Date',polygon.draw = T,col='gray', border='gray')
	with(temperature,lines(as.Date(day),Value.mean))
	abline(h=0,col='gray')
	mtext(expression(paste("Mean relative temperature  ",group("(",degree,")"))),side=2,line=2) 
	if(!is.null(humidity)) 	
		axis(1,at=as.numeric(temperature$day),label=as.numeric(substr(temperature$day,9,10)))
	if(!is.null(humidity)) {
		plot(Value.mean~as.Date(day),data=humidity,type='n',xaxt='n',ylab='',xlab='',ylim=c(0,100))
		figsci::polygon.region(humidity[,c("day","Value.min", "Value.max")],
				x='day',x.type='as.Date',polygon.draw = T,col='gray', border='gray')
		with(humidity,lines(as.Date(day),Value.mean))
		mtext("Mean relative humidity (%)",side = 2,line=2)
	}
	
	axis(1,at=as.numeric(temperature$day),label=as.numeric(substr(temperature$day,9,10)))
	month.pt <- temperature$day[grep("01$",temperature$day)]
	month.pt <- temperature$day[grep("01$",temperature$day)]
	axis(1,at=month.pt,label=sprintf("\n%s",month.abb[as.numeric(substr(month.pt,6,7))]),line=1,col='white', tick=FALSE)
	year <- regmatches(temperature[,"day"],regexpr("[0-9]{4}",temperature[,"day"]))
	year.pt <- as.Date(temperature[which(!duplicated(year)),'day'])
	axis(1,at=year.pt,label=sprintf("\n\n%s",substr(year.pt,1,4)),line=2,col='white', tick=FALSE)
	dev.off()
}
