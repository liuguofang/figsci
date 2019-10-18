dnorm.curve <- function(M, SD,xlab='',...) 
{
	# 2019-10-14
	# used to show precipitation variation distribution
	maximum <- c(M+3*SD)
	minimum <- c(M-3*SD)
	if(minimum<0) minimum <- 0
	
	par(yaxs='i',xaxs='i',mar=c(4,4,1,1))
	pos.50th <- dnorm(M,mean=M,sd=SD)*1.1
	curve(dnorm(x,mean=M,sd=SD),from=minimum,to=maximum,ylim=c(0, pos.50th),ylab='',xlab='',...)
	limit.0.05 <- qnorm(c(0.05,0.95),mean=M,sd=SD)
	limit.0.1 <- qnorm(c(0.1,0.9),mean=M,sd=SD)
	pos.5th <- dnorm(limit.0.05,mean=M,sd=SD)*1.1
	pos.10th <- dnorm(limit.0.1,mean=M,sd=SD)*1.1
	
	polygon(c(minimum,maximum,seq(maximum,minimum,len=100)),c(0,0,dnorm(seq(maximum,minimum,len=100),mean=M,sd=SD)),col='yellow')
	
	
	x.left <- c(minimum,limit.0.05[1],seq(limit.0.05[1],minimum,len=100))
	polygon(x.left,c(0,0,dnorm(seq(limit.0.05[1],minimum,len=100),M,SD)),col='red')
	
	x.right <- c(limit.0.05[2],maximum,seq(maximum,limit.0.05[2],len=100))
	polygon(x.right,c(0,0,dnorm(seq(maximum,limit.0.05[2],len=100),M,SD)),col='red')
	
	plotrix::ablineclip(v=limit.0.05,y1=0,y2=pos.5th)
	plotrix::ablineclip(v=limit.0.1,y1=0,y2=pos.10th,lty=2)
	plotrix::ablineclip(v=M,y1=0,y2=pos.50th*0.95,lty=2)
	
	text(limit.0.05,pos.5th,'5th',pos=c(2,4))
	text(limit.0.1,pos.10th,'10th',pos=c(2,4))
	text(M,pos.50th,'50th',pos=1)
	mtext("Probability of occurrence",side=2,line=2.5)
	mtext(xlab,side=1,line=2.5)
	preci.para <- qnorm(c(0.05,0.10,0.5,0.9,0.95),mean=M,sd=SD)
	legend('topright',legend=sprintf("%s: %3.0f %s",c('5th','10th','50th','10th','5th'),preci.para,"mm"),bty='n',adj=0)
}


