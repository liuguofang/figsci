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
	<TR><TD width=50>mean.variation.calc</TD><td width=700>根据分类变量计算其均值±标准差/标准误，并标记代表差异性的字母</TD>
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



The function `sci.search` could carrry out searching journal(s) based regular expression. Therefore, it is more efficient to search Journal compared with using excel.

```r
journal <- c("^AMERICAN NATURALIST$", "^ANALYTICAL CHEMISTRY$", "^ANNALS OF BOTANY$", 
"^BIOCHIMICA ET BIOPHYSICA ACTA-BIOENERGETICS$", "^BIOSCIENCE$", 
"^BMC BIOLOGY$", "^BMC EVOLUTIONARY BIOLOGY$", "^CELL REPORTS$", 
"^CLADISTICS$", "^CLIMATIC CHANGE$", "^DIVERSITY AND DISTRIBUTIONS$", 
"^ECOGRAPHY$", "^ECOLOGICAL APPLICATIONS$", "^ECOLOGY$", "^EMBO REPORTS$", 
"^EVOLUTION$", "^FOOD CHEMISTRY$", "^FRONTIERS IN ECOLOGY AND THE ENVIRONMENT$", 
"^FUNCTIONAL ECOLOGY$", "^GENETICS$", "^GENOME BIOLOGY AND EVOLUTION$", 
"^GLOBAL BIOGEOCHEMICAL CYCLES$", "^GLOBAL CHANGE BIOLOGY$", 
"^GLOBAL ECOLOGY AND BIOGEOGRAPHY$", "^JOURNAL OF BIOGEOGRAPHY$", 
"^JOURNAL OF BIOLOGICAL CHEMISTRY$", "^JOURNAL OF ECOLOGY$", 
"^JOURNAL OF EXPERIMENTAL BOTANY$", "^JOURNAL OF GEOPHYSICAL RESEARCH", 
"^JOURNAL OF PROTEOME RESEARCH$", "^MOLECULAR ECOLOGY$", "^MOLECULAR PHYLOGENETICS AND EVOLUTION$", 
"^MOLECULAR PLANT-MICROBE INTERACTIONS$", "^NEW PHYTOLOGIST$", 
"^NUCLEIC ACIDS RESEARCH$", "^PHOTOSYNTHESIS RESEARCH$", "^PLANT AND CELL PHYSIOLOGY$", 
"^PLANT BIOTECHNOLOGY JOURNAL$", "^PLANT CELL AND ENVIRONMENT$", 
"^PLANT JOURNAL$", "^PLANT MOLECULAR BIOLOGY$", "^PLANT PHYSIOLOGY$", 
"^PLOS GENETICS$", "^POSTHARVEST BIOLOGY AND TECHNOLOGY$", "^PROCEEDINGS OF THE ROYAL SOCIETY B-BIOLOGICAL SCIENCES$", 
"^REMOTE SENSING OF ENVIRONMENT$", "^SCIENCE SIGNALING$", "^SOIL BIOLOGY & BIOCHEMISTRY$", 
"^TAXON$", "^THEORETICAL AND APPLIED GENETICS$")

library(figsci)
sci.search(journal=journal,yr=2018)

```

```r
                                          Full.Journal.Title JCR.Abbreviated.Title      ISSN Total.Cites    IF2    IF5 year
4410                                     AMERICAN NATURALIST                AM NAT 0003-0147      29,269  4.265  4.330 2018
4714                                    ANALYTICAL CHEMISTRY             ANAL CHEM 0003-2700     123,665  6.042  6.035 2018
5241                                        ANNALS OF BOTANY        ANN BOT-LONDON 0305-7364      19,918  3.646  4.246 2018
10121            BIOCHIMICA ET BIOPHYSICA ACTA-BIOENERGETICS     BBA-BIOENERGETICS 0005-2728      11,931  4.280  4.785 2018
10942                                             BIOSCIENCE            BIOSCIENCE 0006-3568      17,072  5.876  6.708 2018
11320                                            BMC BIOLOGY              BMC BIOL 1741-7007       5,144  5.770  7.436 2018
11387                               BMC EVOLUTIONARY BIOLOGY         BMC EVOL BIOL 1471-2148      12,388  3.027  3.628 2018
14506                                           Cell Reports              CELL REP 2211-1247      29,789  8.032  8.700 2018
16168                                             CLADISTICS            CLADISTICS 0748-3007       3,775  5.877  5.594 2018
16266                                        CLIMATIC CHANGE       CLIMATIC CHANGE 0165-0009      18,223  3.537  4.436 2018
21766                            DIVERSITY AND DISTRIBUTIONS        DIVERS DISTRIB 1366-9516       7,404  4.614  4.777 2018
22414                                              ECOGRAPHY             ECOGRAPHY 0906-7590      10,103  4.520  5.617 2018
22437                                ECOLOGICAL APPLICATIONS             ECOL APPL 1051-0761      20,577  4.393  4.892 2018
22530                                                ECOLOGY               ECOLOGY 0012-9658      60,825  4.617  5.677 2018
23482                                           EMBO REPORTS              EMBO REP 1469-221X      13,293  8.749  9.127 2018
26613                                              EVOLUTION             EVOLUTION 0014-3820      32,227  3.818  4.268 2018
28075                                         FOOD CHEMISTRY             FOOD CHEM 0308-8146      90,665  4.946  4.879 2018
28588               FRONTIERS IN ECOLOGY AND THE ENVIRONMENT    FRONT ECOL ENVIRON 1540-9295       9,137  8.302 10.898 2018
28813                                     FUNCTIONAL ECOLOGY            FUNCT ECOL 0269-8463      14,638  5.491  5.657 2018
29384                                               GENETICS              GENETICS 0016-6731      42,809  4.075  5.076 2018
29458                           Genome Biology and Evolution      GENOME BIOL EVOL 1759-6653       5,746  3.940  4.171 2018
30226                           GLOBAL BIOGEOCHEMICAL CYCLES  GLOBAL BIOGEOCHEM CY 0886-6236      13,353  4.457  5.203 2018
30233                                  GLOBAL CHANGE BIOLOGY    GLOBAL CHANGE BIOL 1354-1013      36,182  8.997  9.791 2018
30248                        GLOBAL ECOLOGY AND BIOGEOGRAPHY  GLOBAL ECOL BIOGEOGR 1466-822X      10,294  5.958  7.315 2018
41967                                JOURNAL OF BIOGEOGRAPHY            J BIOGEOGR 0305-0270      15,146  4.154  4.885 2018
41979                        JOURNAL OF BIOLOGICAL CHEMISTRY           J BIOL CHEM 0021-9258     366,247  4.010  4.253 2018
44421                                     JOURNAL OF ECOLOGY                J ECOL 0022-0477      18,409  5.172  6.525 2018
45389                         JOURNAL OF EXPERIMENTAL BOTANY             J EXP BOT 0022-0957      40,585  5.354  6.044 2018
46266            JOURNAL OF GEOPHYSICAL RESEARCH-ATMOSPHERES   J GEOPHYS RES-ATMOS 2169-897X      63,717  3.380  4.136 2018
46268         Journal of Geophysical Research-Biogeosciences  J GEOPHYS RES-BIOGEO 2169-8953       7,085  3.484  4.217 2018
46270          JOURNAL OF GEOPHYSICAL RESEARCH-EARTH SURFACE   J GEOPHYS RES-EARTH 2169-9003       6,791  3.337  4.118 2018
46272                 JOURNAL OF GEOPHYSICAL RESEARCH-OCEANS  J GEOPHYS RES-OCEANS 2169-9275      30,649  2.711  3.207 2018
46274                JOURNAL OF GEOPHYSICAL RESEARCH-PLANETS  J GEOPHYS RES-PLANET 2169-9097       9,281  3.544  3.706 2018
46276            JOURNAL OF GEOPHYSICAL RESEARCH-SOLID EARTH  J GEOPHYS RES-SOL EA 2169-9313      43,855  3.482  4.101 2018
46278          JOURNAL OF GEOPHYSICAL RESEARCH-SPACE PHYSICS   J GEOPHYS RES-SPACE 2169-9380      36,438  2.752  2.720 2018
51371                           JOURNAL OF PROTEOME RESEARCH        J PROTEOME RES 1535-3893      21,459  3.950  4.033 2018
60233                                      MOLECULAR ECOLOGY              MOL ECOL 0962-1083      37,813  6.131  6.885 2018
60402                  MOLECULAR PHYLOGENETICS AND EVOLUTION   MOL PHYLOGENET EVOL 1055-7903      18,604  4.412  4.294 2018
60430                   MOLECULAR PLANT-MICROBE INTERACTIONS  MOL PLANT MICROBE IN 0894-0282      10,099  3.588  4.078 2018
62480                                        NEW PHYTOLOGIST            NEW PHYTOL 0028-646X      44,994  7.433  7.833 2018
63105                                 NUCLEIC ACIDS RESEARCH     NUCLEIC ACIDS RES 0305-1048     168,962 11.561 10.235 2018
66343                                PHOTOSYNTHESIS RESEARCH        PHOTOSYNTH RES 0166-8595       6,396  3.091  3.480 2018
67031                              PLANT AND CELL PHYSIOLOGY    PLANT CELL PHYSIOL 0032-0781      14,544  4.059  4.454 2018
67065                            PLANT BIOTECHNOLOGY JOURNAL    PLANT BIOTECHNOL J 1467-7644       6,544  6.305  6.107 2018
67093                             PLANT CELL AND ENVIRONMENT    PLANT CELL ENVIRON 0140-7791      20,478  5.415  6.151 2018
67168                                          PLANT JOURNAL               PLANT J 0960-7412      39,212  5.775  6.101 2018
67182                                PLANT MOLECULAR BIOLOGY        PLANT MOL BIOL 0167-4412      13,723  3.543  4.013 2018
67213                                       PLANT PHYSIOLOGY         PLANT PHYSIOL 0032-0889      75,249  5.949  6.620 2018
67394                                          PLoS Genetics            PLOS GENET 1553-7404      42,988  5.540  6.684 2018
68075                     POSTHARVEST BIOLOGY AND TECHNOLOGY  POSTHARVEST BIOL TEC 0925-5214       9,642  3.112  3.241 2018
68733 PROCEEDINGS OF THE ROYAL SOCIETY B-BIOLOGICAL SCIENCES  P ROY SOC B-BIOL SCI 0962-8452      51,704  4.847  5.611 2018
71239                          REMOTE SENSING OF ENVIRONMENT   REMOTE SENS ENVIRON 0034-4257      44,168  6.457  7.737 2018
74307                                      Science Signaling            SCI SIGNAL 1945-0877      10,316  6.378  7.251 2018
76071                            SOIL BIOLOGY & BIOCHEMISTRY     SOIL BIOL BIOCHEM 0038-0717      32,573  4.926  5.419 2018
78121                                                  TAXON                 TAXON 0040-0262       5,081  2.680  2.964 2018
78561                       THEORETICAL AND APPLIED GENETICS      THEOR APPL GENET 0040-5752      19,565  3.930  4.062 2018

```

