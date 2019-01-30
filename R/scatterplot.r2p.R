#' A scatterplot.r2p function
#' This function can be used drawing a scatterplot with or without category/group variable and add R2 and P-value for fitted regession lines automatically.
#' @dat A data.frame 
#' @x A variable in x axis
#' @y A variable in y axis
#' @group A group variable. The group default is NULL. 
#' @color Feed color array for different groups.
#' @whole.line Which is valid for scatterplot with group variable. 
#' @pty Feed array on point types. 
#' @cex.size Cex size in figure options. 
#' @cornerlabel Add a marker at corner position. 
#' @r2.p.pos The position of r2.p which ranges from (0,1) for x and y axises.
#' @txt.space Mofidy the distance between level marker and r2.p text.
#' @subfig.nrow Default is one subplot. If you want to show multiple subplots provide provide a number of subplots vertically.
#' @level.off Whether level is shown or not. 
#' @examples

scatterplot.r2p <- function(dat,x = x,y = y,group = NULL, intercept=TRUE, color=NULL, whole.line=FALSE,pty=NULL,
                            cex.size=1,cornerlabel=NULL,r2.p.pos=c(0.1,0.95),txt.space=10,subfig.nrow =1, level.off=FALSE,...) {

  x.variable <- dat[,x]
  y.variable <- dat[,y]
  if(is.null(group)){
    if(intercept)     lm.whole <- lm(y.variable~x.variable) else 
	 lm.whole <- lm(y.variable~x.variable-1)
    total <- data.frame(r2 = summary(lm.whole)$r.squared,p = summary(lm.whole)$coef[8],
                        x1 = min(lm.whole$model$x.variable,na.rm = TRUE),  x2 = max(lm.whole$model$x.variable,na.rm=TRUE))
    with(dat,plot(x.variable,y.variable,pch=ifelse(is.null(pty),1,pty[1]),col = ifelse(is.null(color),'black',color[1]),...))
	  if(intercept)   plotrix::ablineclip(a=coef(lm.whole)[1],b=coef(lm.whole)[2],x1=total$x1,x2=total$x2,lty = ifelse(total[,'p']<0.05,1,0)) else
     plotrix::ablineclip(b=coef(lm.whole)[1],x1=total$x1,x2=total$x2,lty = ifelse(total[,'p']<0.05,1,0)) 
    
    r2.p.pos[1]=grconvertX(r2.p.pos[1], "npc")  
    r2.p.pos[2]=grconvertY(r2.p.pos[2], "npc")  
    
    if(total[,'p']<0.001) 
	   text(r2.p.pos[1], r2.p.pos[2], substitute(paste(R^2 == A, italic(P) < B),  list(A = sprintf("%.2f, ",  total[,'r2']),B = "0.001")),adj=0) else 
       text(r2.p.pos[1], r2.p.pos[2], substitute(paste(R^2 == A, italic(P)== B), list(A = sprintf("%.2f, ",  total[,'r2']),
                                                                      B = sprintf("%.3f", total[,'p']))),adj=0,cex=cex.size)
  } else{
    group <- dat[,group]
    if(!is.factor(group)) factor(group) ->group
    dat <- data.frame(x.variable,y.variable,group)
    
    group.string <- levels(group)
    group.no <- length(levels(group))
    
    if(is.null(pty))   pty=c(1,19,2,17,22,15,5,18,12,14,8,4)[1:group.no] 
    
    if(length(pty)==1) {pty=rep(pty,group.no); dat$pty=pty[1]} else
      dat$pty <- as.numeric(as.character(factor(group,level=levels(group),label=pty)))
    
    
    
    library(plyr)
    lm.out <- dlply(dat,.(group),function(df) lm(y.variable~x.variable,data=df))
    lm.coef <- ldply(lm.out,function(lt) c(a=as.vector(coef(lt))[1],b=as.vector(coef(lt))[2],
                                           r2=summary(lt)$r.squared,p=coefficients(summary(lt))[2,4],
                                           x=range(lt$model$x.variable,na.rm=TRUE)))
    
    
    # significant relationship：solid line, marginally significant relationship: dashed line; no relationship: no line
    lm.coef$lty <- ifelse(lm.coef$p<0.05,1,0)
    
    txt <- sapply(1:group.no,function(i) 
      substitute(paste(ifelse(lm.coef[i,'r2']<0.01, R^2 < A, R^2 ==A), ifelse(lm.coef[i,'p']<0.001, italic(P) < B, italic(P)== B)), 
          list(A = ifelse(lm.coef[i,'r2']<0.01, "0.01",sprintf("%.2f, ", lm.coef[i,'r2'])), 
               B = ifelse(lm.coef[i,'p']<0.001, '0.001', sprintf("%.3f", lm.coef[i,'p'])))))
    
    
    levels(group) <- pty[1:group.no]
    
    if(is.null(color)) color=as.numeric(lm.coef$group) else if (length(color)==1) color <- rep(color,group.no)
    
    with(dat,plot(x.variable,y.variable,pch=pty,col = color[as.numeric(group)],...))
    
    if(r2.p.pos[2]>=0.05){
      y <- grconvertY(seq(r2.p.pos[2],by=-0.05/par('fin')[2]*6.5/ifelse(subfig.nrow==1,1,subfig.nrow*0.7),length=group.no), "npc")  
    } else y <-  rev(grconvertY(seq(r2.p.pos[2],by=0.05/par('fin')[2]*6.5/ifelse(subfig.nrow==1,1,subfig.nrow*0.7),
      length=group.no), "npc"))

    x <- grconvertX(r2.p.pos[1], "npc")
    
    r2.p.pos <- data.frame(x=x,y=y)
    
    if(!is.null(cornerlabel))  plotrix::corner.label(x=-1,y=1,label=cornerlabel)
    
    space <- strwidth(paste(rep("a",txt.space),collapse = ''))
    lapply(1:group.no,function(i) {
      plotrix::ablineclip(a=lm.coef[i,"a"],b=lm.coef[i,"b"],x1=lm.coef[i,'x1'],x2=lm.coef[i,'x2'],
                          col=color[i], lty=lm.coef[i,'lty'])
      if(lm.coef[i,'p']<0.001) text(r2.p.pos$x[i]+ space,y=r2.p.pos$y[i] , substitute(paste(R^2 == A, italic(P) < B), 
                                               list(A = sprintf("%.2f, ",  lm.coef[i,'r2']), B = "0.001")),adj=0,cex=cex.size) else 
      { if(lm.coef[i,"r2"]<0.01)
         text(r2.p.pos$x[i]+ space,y=r2.p.pos$y[i] ,substitute(paste(R^2 < A, italic(P)== B),  
                                                               list(A = "0.01, ",
                                                        B = sprintf("%.3f", lm.coef[i,'p']))),adj=0,cex=cex.size) else 
     text(r2.p.pos$x[i]+ space,y=r2.p.pos$y[i] ,substitute(paste(R^2 == A, italic(P)== B),  list(A = sprintf("%.2f, ",  lm.coef[i,'r2']),
                                                                           B = sprintf("%.3f", lm.coef[i,'p']))),adj=0,cex=cex.size)
       }

      legend(r2.p.pos$x[i],y=r2.p.pos$y[i],legend=ifelse(level.off,'', group.string[i]),yjust=0.5,pch=pty[i],col=color[i],lty=lm.coef[i,'lty'],bty='n')
    })
    
    if(whole.line){ 
    lm.whole <- lm(y.variable~x.variable)
      total <- data.frame(a = as.vector(coef(lm.whole))[1],b = as.vector(coef(lm.whole))[2],
                          r2 = summary(lm.whole)$r.squared,p = summary(lm.whole)$coef[8],
                          x1 = min(lm.whole$model$x.variable,na.rm = TRUE),  x2 = max(lm.whole$model$x.variable,na.rm=TRUE),
                          lty=ifelse(summary(lm.whole)$coef[8]<0.05,1,ifelse(summary(lm.whole)$coef[8]<0.1,2,0)))
      all.y=r2.p.pos$y[group.no]-abs(diff(r2.p.pos$y)[1])
      legend(r2.p.pos$x[1],y=all.y,legend=ifelse(level.off,'', "overall"),yjust=0.5,adj=-0.2,lty=lm.whole$lty,bty='n')
      if(total[,'p']<0.001) text(r2.p.pos$x[1]+ space, all.y, substitute(paste(R^2 == A, italic(P) < B), 
                                            list(A = sprintf("%.2f, ",  total[,'r2']), B = "0.001")),adj=0) else 
          text(r2.p.pos$x[1]+ space, all.y, substitute(paste(R^2 == A, italic(P)== B), list(A = sprintf("%.2f, ",  total[,'r2']),
                                                                        B = sprintf("%.3f", total[,'p']))),adj=0)
      legend(r2.p.pos$x[1], all.y,legend='',yjust=0.5,pch=NA,lty=total[,'lty'],bty='n',lwd=2)
      
      plotrix::ablineclip(a=total$a,b=total$b,x1=total$x1,x2=total$x2,
                          , lty=ifelse(total$p<0.05,1,0),lwd=2)  
    }
  }
}

