mean.se <- function(data,...) 
{
	m.and.se <-function(x,...) sprintf("%.2f±%.2f",mean(x,...),sciplot::se(x,...))
	
	library(dplyr);library(sciplot) 
	data %>% group_by_if(is.factor) %>% summarise_if(is.numeric, 
			list(mean=mean,se=se,mean.se = m.and.se),...)
}
