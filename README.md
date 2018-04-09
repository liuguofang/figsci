## figsci
Guofang Liu

This is a R package used to plotting a scatter plot annonated by statistical parameter, phylogenetic barplot for continuous variables, agenda plot, and randomized block experiment layout etc. 


```{R,results="hide",warning=FALSE,message = FALSE}
  #install.packages("devtools")
  devtools::install_github("liuguofang/figsci")
  library(figsci)
```

```{R,results="hide",warning=FALSE,message = FALSE}
plot.agenda(task=d,  period = 'period',item='item',text.cex = 1.5, month.cex = 1.5, text.left = FALSE) 
```

An agenda figure is shown as follows.
![alt text](https://github.com/liuguofang/figsci/blob/master/agenda.jpg)
