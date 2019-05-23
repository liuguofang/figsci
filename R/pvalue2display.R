pvalue2display <- function(p,p.r2.on = FALSE){
   if(!p.r2.no){
      p <- round(p,3)
      for(i in 1:length(p))
         if(p[i]<0.001) 
            p[i] <- '<0.001'
         tag <- grep("<",p)
      p[-tag] <- paste0("==",p[-tag])
      p
   } else {
      r2 <- round(p, 2)
      for(i in 1:length(r2))
         if(r2[i]<0.01)
            r2[i]<-'<0.01'
         tag <- grep('<',r2)
      r2[-tag] <- paste0("==",r2[-tag])
      r2
      
   }
}
