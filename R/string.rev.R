string.rev <- function(x){
	library(plyr)
	library(dplyr)
	laply(x,strsplit,split='') %>% lapply(rev) %>% lapply(paste0,collapse='')
} 
