pvalue2display <- function(p){
   p <- round(p,3)
   for(i in 1:length(p))
     if(p[i]<0.001) 
       p[i] <- '<0.001'
     if(p[i]<0.05) 
       p[i] <- '<0.05'
    tag <- grep("<",p)
    p[-tag] <- paste0("==",p[-tag])
    p
}
