plot.kid.eqt <- function(equation, no=50, col.n=3, page.no=NULL,main="50-math-formulas excise for kids",
                         subtitle= c("Class","Name","Time","Date"),cex=1,width=NULL) 
{
	eqt.pos <- function(no = 50,col.n = 3){
		row.no <- if(no%%col.n) {
					column.len <- rep(no%/%col.n+1,col.n-1) 
					c(column.len,no-sum(column.len))} else 
					rep(no%/%col.n,col.n)
		plyr::ldply(1:col.n,function(i) 
					data.frame(x=i,y=(max(row.no[1]):1)[1:row.no[i]])) 
	}
	
	pt.pos <- eqt.pos(no=no,col.n=col.n)
	pt.pos <- cbind(rowid=as.numeric(row.names(pt.pos)),pt.pos)
	
	if(is.null(width)){
		width <- matrix(equation[1:length(equation)%/% col.n*col.n],ncol=3)
		width <- apply(apply(width,2,nchar),2,max)
		pos <- order(width)
		width[pos] <- width[pos]*seq(1.5,1,len=col.n)
		
	}
	par(mar=rep(0,4),omi=c(0.5,0.8,1.2,0.5),xpd=TRUE)
	layout(matrix(1:col.n,ncol=col.n),widths=width)
	library(plyr)
	d_ply(pt.pos,.(x),.fun=function(dt){
				plot(1,xlim=c(0,1),ylim=c(0.8,max(dt$y)+0.3),type='n',axes = F)
				text(0,dt$y,paste(dt$rowid,equation[dt$rowid],sep='. '),adj=0,cex=cex,xpd=T)
				abline(h=grconvertY(c(1.0,1.005), from = "npc"),xpd=TRUE,col='gray')
			})
	
	blank.line <- paste(rep("_",11),collapse='')
	txt <- paste0(subtitle,":",blank.line)
	mtext(txt,side=3, line= 1, adj=c(0.01,0.30,0.60,0.95),out=TRUE)
	
	mtext(side=3,text=main,line=4,out=TRUE,cex=1.5)
	if(!is.null(page.no)) 	mtext(sprintf("%s",page.no),side=1, line=0,adj=0.5,out=TRUE)
	
}
