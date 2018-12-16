## figsci
Guofang Liu

This is a R package used to plotting a scatter plot, one-way or two-way barplot annonated by statistical parameter, visualizing phylogenetic barplot with its associated continuous variables, agenda plot, and randomized block experiment layout, search R packages based on developer's name, save R data.frame into excel format, search influential factors by means of regular expression, add ten segments boundary for Southern Sea China etc. 


```{R,results="hide",warning=FALSE,message = FALSE}
  #install.packages("devtools")
  devtools::install_github("liuguofang/figsci")
  library(figsci)
```

If it doesn't work, you downloaded the zip file (you will see the green button "clone or download." on top right place), unzipped it and the following worked.

```{R,results="hide",warning=FALSE,message = FALSE}
devtools::install("C:\\Users\\liuguofang\\Desktop\\figsci-master") # please replace your own file path. 
```

```{R,results="hide",warning=FALSE,message = FALSE}
sci.search(journal='^ecology$',yr=2018)
      Rank Full.Journal.Title JCR.Abbreviated.Title      ISSN Total.Cites   IF2   IF5 Eigenfactor.Score year Soil Ecology Plant Bio.Conservatation Environment
22530 1019            ECOLOGY               ECOLOGY 0012-9658      60,825 4.617 5.677           0.04415 2018      ecology           
              
