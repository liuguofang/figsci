## figsci
Guofang Liu

This is a R package used to plotting a scatter plot annonated by statistical parameter, phylogenetic barplot for continuous variables, agenda plot, and randomized block experiment layout etc. 



  #install.packages("devtools")
  
  devtools::install_github("liuguofang/figsci")
  
  library(figsci)


d <- data.frame(period = c("2011-4 ~ 2011-4", "2011-5~2011-6", "2011-6~2011-7", 
				"2011-7~2011-9", "2011-9~2012-1", "2012-01~2012-2", "2012-2~2012-10", "2012-9~2012-12"), 
		item = c("This is the first task", "This is the second task", "This is the third task", 
				"This is the fourth task", "This is the five task", "This is the sixth task", 
				"This is the seventh task", "This is the eighth task"))

plot.agenda(task=d,  period = 'period',item='item',text.cex = 1.5, month.cex = 1.5, text.left = FALSE) 

![alt text](https://github.com/liuguofang/figsci/blob/master/agenda.jpg)
