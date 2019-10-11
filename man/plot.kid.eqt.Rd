\name{plot.kid.eqt }
\alias{plot.kid.eqt }
\title{Produce an excise on 50 equations for primary students}
\usage{
plot.kid.eqt(equation, no=50, col.n=3, page.no=NULL,main="50-math-formulas excise for kids",
	subtitle= c("Class","Name","Time","Date"),cex=1,width=NULL) 

}
\description{This function is used to produce an excise on 50 equations for primary students
}
\arguments{
   \item{equation} {equation vector.}
   \item{no} {No of equation.}
   \item{col.n} {No of columns.}
   \item{page.no} {the page No.}
   \item{main} {the title.}
   \item{subtitle} {subtitle of a page.}
   \item{cex} {The font size.}
   \item{width} {The widths of columns.}
}


\examples{
	
## # addition/minus between 10 and 100
## library(dplyr)
## add.minus <- expand.grid(x=10:100,y=10:100)
## add.eqt <- with(add.minus[between(apply(add.minus,1,sum),10,100),],paste0(x,'+',y,"="))
## minus.eqt <- with(add.minus[between(apply(add.minus,1,diff),10,100),],paste0(y,'-',x,"="))
## equation1 <- sample(c(add.eqt,minus.eqt))
## 
## x <- expand.grid(2:9,2:9)
## x <- unique(cbind(x,sum=x[,1]*x[,2]))
## 
## equation2 <- sample(c(sprintf("%s×%s= ",x[,1],x[,2]),sprintf("%s÷%s= ",x[,3],x[,2])))
## 
## #math: over and less operations for kids
## x <- expand.grid(2:9,2:9)
## x <- unique(cbind(x,sum=x[,1]*x[,2]))
## library(plyr)
## x <- expand.grid(diff=seq(-5,5),sum=x$sum) %>% join(x)
## x <-subset(mutate(x,sum2=diff+sum),sum2>3&sum2%/%x[,3]<10)
## 
## equation3 <- c(sprintf("%s×%s (  ) %s",x[,3],x[,4],x[,5]),
## 		sprintf("%s÷%s (  ) %s",x[,5],x[,3],x[,4]))
## d <- expand.grid(10:89,2:9)
## d2 <- mutate(d,yu=Var1%%Var2,value=Var1%/%Var2)
## d2 <- subset(d2,yu!=0&value<10)
## equation4 <- sprintf("%s÷%s = (  )......(  )",d2$Var1,d2$Var2)
## 
## string <- c(sample(equation1,13),sample(equation2,13),
## 		sample(equation3,12),sample(equation4,12))
## plot.kid.eqt(string[1:50],col.n=3,cex=1.8,width=c(0.9,1,1.2))
## 
## # produce a 100-pages pdf file.
## cairo_pdf("小学生加减乘除运算50道（100页）.pdf",
## 		width=8.267717,height=11.69291,family='GB1',onefile=TRUE)
## 
## for(i in 1:100){ 
## 	
## 	string <- c(sample(equation1,13),sample(equation2,13),sample(equation3,12),sample(equation4,12))
## 	plot.kid.eqt(string[1:50],col.n=3,cex=1.8,width=c(0.9,1,1.2),main="小学生加减乘除运算50道",
## 			subtitle=c("班级","姓名","时间","日期"))
## } 
## dev.off()
## 
## # TODO: 加减乘除（含）余算式题
## ## addition/minus between 10 and 100
## library(dplyr)
## add.minus <- expand.grid(x=10:100,y=10:100)
## add.eqt <- with(add.minus[between(apply(add.minus,1,sum),10,100),],paste0(x,'+',y,"="))
## minus.eqt <- with(add.minus[between(apply(add.minus,1,diff),10,100),],paste0(y,'-',x,"="))
## equation1 <- sample(c(add.eqt,minus.eqt))
## 
## ##乘除运算
## x <- expand.grid(2:9,2:9)
## x <- unique(cbind(x,sum=x[,1]*x[,2]))
## equation2 <- sample(c(sprintf("%s×%s= ",x[,1],x[,2]),sprintf("%s÷%s= ",x[,3],x[,2])))
## 
## ## 大于小于
## x <- expand.grid(2:9,2:9)
## x <- unique(cbind(x,sum=x[,1]*x[,2]))
## library(plyr)
## x <- expand.grid(diff=seq(-5,5)[-6],sum=x$sum) %>% join(x)
## x <-subset(mutate(x,sum2=diff+sum),sum2>3&sum2%/%x[,3]<10) 
## 
## equation3 <- c(sprintf("%s×%s (  ) %s",x[,3],x[,4],x[,5]),
## 		sprintf("%s÷%s (  ) %s",x[,5],x[,3],x[,4]))
## d <- expand.grid(10:89,2:9)
## d2 <- mutate(d,yu=Var1%%Var2,value=Var1%/%Var2)
## d2 <- subset(d2,yu!=0&value<10)
## equation4 <- sprintf("%s÷%s = (  )......(  )",d2$Var1,d2$Var2)
## 
## setwd("d:/")
## for(i in 1:20){	
## 	cairo_pdf(sprintf("加减乘除(含余)大于小于50道(20页)(%s)(%s).pdf",i,Sys.Date()),
## 			width=8.267717,height=11.69291,family='GB1')
## 	string <- c(sample(equation1,13),sample(equation2,13),
## 			sample(equation3,12),sample(equation4,12))
## 	plot_kid_eqt(string[1:50],col.n=3,main='小学二年级（下）数学练习题',cex=1.8,width=c(0.9,1,1.2))
## 	dev.off()
## }
	
}
