score24 <- function(x){
	library(reshape)
	library(plyr)
	library(Hmisc)
	
	x <- t(x)
	tag <- expand.grid(1:4,1:4)
	tag <- tag[!(apply(tag,1,diff) %in% 0),]
	
	remaining <- t(apply(tag,1,function(s) (1:4)[1:4 %nin% s]))
	tmp <- expand.grid(c("+","-","*","/"),apply(cbind(x[tag[,1]],x[tag[,2]]),1,paste0,collapse='-'))
	tmp <- data.frame(sign=tmp[,1],colsplit(tmp[,2],split='-',name=c('Var1','Var2')))
	tmp$sign <- sprintf('(%s%s%s)',tmp[,2],tmp[,1],tmp[,3])
	
	whole.tag <- data.frame(Var1=x[tag[,1]],Var2=x[tag[,2]],remaining1=x[remaining[,1]],remaining2=x[remaining[,2]])
	
	x <- join(tmp,whole.tag,by=c("Var1",'Var2'))[,-c(2:3)]
	names(x) <- c('x1','x2','x3')
	
	result <- data.frame()
	for(i in 1:nrow(x)){
		tag <- expand.grid(1:3,1:3)
		tag <- tag[!(apply(tag,1,diff) %in% 0),]
		remaining <- t(t(apply(tag,1,function(s) (1:3)[1:3 %nin% s])))
		tmp <- expand.grid(c("+","-","*","/"),apply(cbind(t(x[i,tag[,1]]),t(x[i,tag[,2]])),1,paste0,collapse='o'))
		tmp <- data.frame(tmp)
		
		tmp <- cbind(tmp[,1],colsplit(tmp[,2],split='o',name=c('Var1','Var2')))
		tmp$`tmp[, 1]` <- sprintf('(%s%s%s)',tmp[,2],tmp[,1],tmp[,3])
		whole.tag <- cbind(Var1=t(x[i,tag[,1]]),Var2=t(x[i,tag[,2]]),remaining1=t(x[i,remaining[,1]]))
		colnames(whole.tag) <- c('Var1','Var2','remaining')
		whole.tag <- data.frame(whole.tag)
		result <- rbind(result,join(tmp,whole.tag,by=c("Var1",'Var2'))[,-c(2:3)])
	}
	
	result2 <- data.frame()
	for(j in 1:nrow(result)){
		tag <- expand.grid(1:2,1:2)
		tag <- tag[!(apply(tag,1,diff) %in% 0),]
		tmp <- expand.grid(c("+","-","*","/"),apply(cbind(t(result[j,tag[,1]]),t(result[j,tag[,2]])),1,paste0,collapse='o'))
		tmp <- data.frame(tmp)
		tmp <- cbind(tmp[,1],colsplit(tmp[,2],split='o',name=c('Var1','Var2')))
		tmp$`tmp[, 1]` <- sprintf('%s%s%s',tmp[,2],tmp[,1],tmp[,3])
		result2 <- rbind(result2,tmp)
	}
	output <- cbind(result2,condition=apply(result2[1],1,function(s) eval(parse(text=s))==24))
	unique(subset(output,condition==TRUE)[,1])
}
