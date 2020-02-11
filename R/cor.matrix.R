
cor.matrix <- function(dat,method='pearson'){
 pvalue2display <- function(p){
      p <- sprintf("%.3f",p)
      for(i in 1:length(p))
         if(p[i]<0.001) 
            p[i] <- '<0.001'
         tag <- grep("<",p)
      p[-tag] <- paste0("",p[-tag])
      p
}

	para <- pgirmess::cormat(dat,method=method,sep=TRUE)

	r <- round(para$coef.estimates,3)
	tag <- upper.tri(r)
    r[tag] <- as.data.frame(lapply(para$p.values,pvalue2display))[tag]
	r <- as.matrix(r)
    diag(r) <- ''
	r

}
