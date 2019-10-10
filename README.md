## figsci
Guofang Liu

The figsci package is a R package used to plot a scatterplot, one-way or two-way barplot annonated by statistical parameter, visualizing phylogenetic barplot with its associated continuous variables, make agenda plot, and randomized block experiment layout, search R packages based on developer's name, save R data.frame into excel format, search influential factors by means of regular expression, and ten segments boundary for Southern Sea China, transform PDF into png with given DPI, etc. 


<table cellpadding=2>
	<TR><TD width=50>author.packages</TD><td width=700>根据R语言包开发者姓名，查找其属名的r扩展包</TD>
	<TR><TD width=50>color.alpha</TD><td width=700>产生表征点疏密程度的颜色</TD>
	<TR><TD width=50>colorexcel</TD><td width=700>对Excel数据中复合条件的数据值添加背景色</TD>
	<TR><TD width=50>com.abund2matrix</TD><td width=700>把群落调查数据（样方、物种、数量）转换成为物种 x 样方的矩阵数据</TD>
	<TR><TD width=50>crosscheck</TD><td width=700>筛选两个向量的相互不包含的元素</TD>
	<TR><TD width=50>data2excel</TD><td width=700>把数据框数据输出成为Excel数据</TD>
	<TR><TD width=50>english.word.search</TD><td width=700>查找中/英文词语的单词/含义</TD>
	<TR><TD width=50>fetch_manuscript_citation</TD><td width=700><font color=#0000E3>查看论文稿子正文括弧中参考文献写法</font></TD>
	<TR><TD width=50>line10</TD><td width=700>表示中国南海疆域的十段线</TD>
	<TR><TD width=50>mean.variation.calc</TD><td width=700>对不同分类变量计算其均值±标准差/标准误，并标记代表差异性的字母</TD>
	<TR><TD width=50>month.cal.agenda</TD><td width=700>对某月的日历表进行任务添加</TD>
	<TR><TD width=50>oneway.barplot</TD><td width=700><font color=#0000E3>做单因素柱状图，标记代表差异性的字母</font></TD>
	<TR><TD width=50>package.basefuns</TD><td width=700>挖掘R扩展包中的基础函数</TD>
	<TR><TD width=50>pdf2png</TD><td width=700>调用第三方软件，用R把PDF转成给定分辨率的png图片</TD>
	<TR><TD width=50>phylo.barplot</TD><td width=700><font color=#0000E3>做系统发育柱状图</font></TD>
	<TR><TD width=50>plantspecies2chinese</TD><td width=700>根据物种拉丁名，查找其中文名称</TD>
	<TR><TD width=50>plot.agenda</TD><td width=700>做年度计划图</TD>
	<TR><TD width=50>polygon.region</TD><td width=700>做区域多边形图</TD>
	<TR><TD width=50>randomized.block.layout</TD><td width=700>画随机区组设计图</TD>
	<TR><TD width=50>replace_sumatraPDF</TD><td width=700>替换sumatraPDF软件中的settings文件</TD>
	<TR><TD width=50>scatterplot.r2p</TD><td width=700><font color=#0000E3>做有无分类变量的散点图，标记r2和p值</font></TD>
	<TR><TD width=50>sci</TD><td width=700>SCI 数据集 2012-2018</TD>
	<TR><TD width=50>sci.search</TD><td width=700>利用正则表达式查找一个或多个SCI期刊的影响因子情况</TD>
	<TR><TD width=50>twoway.barplot</TD><td width=700 ><font color=#0000E3>做双因素柱状图，标记代表差异性的字母</font></TD>
</TABLE><!-- End contacts table -->

 


```r
  #install.packages("devtools")
  devtools::install_github("liuguofang/figsci")
  library(figsci)
```

If it doesn't work, you downloaded the zip file (you will see the green button "clone or download." on top right place), unzipped it and the following worked.

```r
devtools::install("C:\\Users\\liuguofang\\Desktop\\figsci-master") # please replace your own file path. 
```

The `scatterplot.r2p` function can make a scatterplot with R<sup>2</sup> and p value for ordinary linear regressions.
```r
data(leaflife,package='smatr')
scatterplot.r2p(dat=leaflife,x='longev',y='lma',group='soilp',pty=c(1,19),
                xlab=Leaf~longevity~(yr),ylab=~LMA~(kg~m^-2))
```

![](readme_files/scatterplot.jpg) 



