#' A temp.dayscale.plot.ibutton function
#' 
#' This function can be used to plot dayscale temperature and humidity graph.
#' @temp the name of temperature file.
#' @humidity the name of humidity file. Default is drawing dayscale temperature curve. 
#' @start.time the start point of temperature or humidity graph
temp.dayscale.plot.ibutton <- function(temp=temperature,humidity=NULL,start.time='07:00'){	 
	 if(!is.null(humidity))  layout(matrix(1:2,ncol=1))
	 par(mar=rep(1,4),omi=c(0.5,0.7,0.1,0.1))
	 plot(Value.mean~day,data=temperature,type='n',xaxt='n',ylab='Mean temperature per day (%)',xlab='')
	 with(temperature,lines(day,Value.mean))
	 mtext(expression(paste("Mean relative temperature  ",group("(",degree,")"))),side=2,line=2) 
	 
	 time.pos <- as.POSIXct(strptime(sprintf("%s %s:00 CST",Sys.Date(),start.time),
					 "%Y-%m-%d %H:%M:%S"))+seq(0,24,by=2)*3600
	 	 
	 if(!is.null(humidity)){
		 axis(1,at=time.pos,label=rep("",nrow(temperature)),line=1)
		 plot(Value.mean~day,data=humidity,type='n',xaxt='n',ylab='',xlab='')
		 with(humidity,lines(day,Value.mean))
		 mtext(~Mean~relative~humidity~('%'),side = 2,line=2)
	 }
	 axis(1,at=time.pos,label=substr(time.pos,12,16),line=1) 
	 dev.off()
 }
