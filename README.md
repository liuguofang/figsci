## figsci
Guofang Liu

This is a R package used to plotting a scatter plot, one-way or two-way barplot annonated by statistical parameter, visualizing phylogenetic barplot with its associated continuous variables, agenda plot, and randomized block experiment layout, search R packages based on developer's name, save R data.frame into excel format, search influential factors by means of regular expression, and ten segments boundary for Southern Sea China etc. 


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
sci.search(journal=c('^ecology$','^journal of ecology','Functional ec(.*?)gy','journal of applied ecology',
                      'new phyto','land degradation','^nature','proceedings of the (.*?) america',"^science$",
                    '^sustainability$','plos one','scientific reports'),yr=2018)
```

```r
                                                                   Full.Journal.Title JCR.Abbreviated.Title      ISSN Total.Cites           IF2           IF5
22530                                                                         ECOLOGY               ECOLOGY 0012-9658      60,825         4.617         5.677
44421                                                              JOURNAL OF ECOLOGY                J ECOL 0022-0477      18,409         5.172         6.525
28813                                                              FUNCTIONAL ECOLOGY            FUNCT ECOL 0269-8463      14,638         5.491         5.657
41305                                                      JOURNAL OF APPLIED ECOLOGY           J APPL ECOL 0021-8901      18,142         5.742         6.160
62480                                                                 NEW PHYTOLOGIST            NEW PHYTOL 0028-646X      44,994         7.433         7.833
55935                                                  LAND DEGRADATION & DEVELOPMENT       LAND DEGRAD DEV 1085-3278       4,655         7.270         6.564
61175                                                                          NATURE                NATURE 0028-0836     710,766        41.577        44.958
61184                                                                Nature + Culture              NAT CULT 1558-6073         307         0.645         2.513
61189                                                                Nature Astronomy            NAT ASTRON 2397-3366         322 Not Available Not Available
61190                                                   Nature Biomedical Engineering        NAT BIOMED ENG 2157-846X         341 Not Available Not Available
61192                                                            NATURE BIOTECHNOLOGY        NAT BIOTECHNOL 1087-0156      57,510        35.724        43.271
61199                                                             NATURE CELL BIOLOGY         NAT CELL BIOL 1465-7392      39,896        19.064        20.460
61206                                                         Nature Chemical Biology         NAT CHEM BIOL 1552-4450      19,562        13.843        13.990
61212                                                                Nature Chemistry              NAT CHEM 1755-4330      29,548        26.201        28.790
61220                                                           Nature Climate Change       NAT CLIM CHANGE 1758-678X      17,986        19.181        22.363
61239                                                           Nature Communications            NAT COMMUN 2041-1723     178,348        12.353        13.691
61247                                                    Nature Conservation-Bulgaria  NAT CONSERV-BULGARIA 1314-6947         175         1.367         1.910
61249                                                      Nature Ecology & Evolution         NAT ECOL EVOL 2397-334X         596 Not Available Not Available
61251                                                                   Nature Energy            NAT ENERGY 2058-7546       5,072        46.859        46.870
61253                                                                 NATURE GENETICS             NAT GENET 1061-4036      93,639        27.125        31.154
61259                                                               Nature Geoscience            NAT GEOSCI 1752-0894      20,386        14.391        14.846
61267                                                               NATURE IMMUNOLOGY           NAT IMMUNOL 1529-2908      41,410        21.809        21.974
61273                                                                NATURE MATERIALS             NAT MATER 1476-1122      92,291        39.235        47.534
61280                                                                 NATURE MEDICINE               NAT MED 1078-8956      75,461        32.621        33.409
61287                                                                  NATURE METHODS           NAT METHODS 1548-7091      54,686        26.919        41.934
61295                                                             Nature Microbiology         NAT MICROBIOL 2058-5276       2,510        14.174        14.182
61296                                                           Nature Nanotechnology       NAT NANOTECHNOL 1748-3387      57,369        37.490        45.815
61303                                                             NATURE NEUROSCIENCE          NAT NEUROSCI 1097-6256      59,426        19.912        19.188
61311                                                                Nature Photonics         NAT PHOTONICS 1749-4885      39,331        32.521        38.551
61318                                                                  Nature Physics              NAT PHYS 1745-2473      33,233        22.727        22.610
61325                                                                   Nature Plants            NAT PLANTS 2055-026X       2,284        11.471        11.471
61327                                                                Nature Protocols            NAT PROTOC 1754-2189      36,821        12.423        15.269
61334                                                           NATURE REVIEWS CANCER        NAT REV CANCER 1474-175X      50,407        42.784        50.293
61341                                                       Nature Reviews Cardiology       NAT REV CARDIOL 1759-5002       5,228        15.162        13.249
61348                                                        Nature Reviews Chemistry          NAT REV CHEM 2397-3358         282 Not Available Not Available
61349                                                Nature Reviews Clinical Oncology    NAT REV CLIN ONCOL 1759-4774       8,354        24.653        20.605
61357                                                  Nature Reviews Disease Primers   NAT REV DIS PRIMERS 2056-676X       1,559        16.071        16.155
61358                                                   NATURE REVIEWS DRUG DISCOVERY   NAT REV DRUG DISCOV 1474-1776      31,312        50.167        54.490
61365                                                    Nature Reviews Endocrinology    NAT REV ENDOCRINOL 1759-5029       7,377        20.265        19.244
61372                                    Nature Reviews Gastroenterology & Hepatology  NAT REV GASTRO HEPAT 1759-5045       6,686        16.990        16.533
61379                                                         NATURE REVIEWS GENETICS         NAT REV GENET 1471-0056      35,680        41.465        44.913
61386                                                       NATURE REVIEWS IMMUNOLOGY       NAT REV IMMUNOL 1474-1733      39,215        41.982        46.507
61393                                                        Nature Reviews Materials         NAT REV MATER 2058-8437       3,218        51.941        51.941
61394                                                     NATURE REVIEWS MICROBIOLOGY     NAT REV MICROBIOL 1740-1526      26,627        31.851        31.155
61401                                           NATURE REVIEWS MOLECULAR CELL BIOLOGY  NAT REV MOL CELL BIO 1471-0072      43,667        35.612        47.918
61408                                                       Nature Reviews Nephrology       NAT REV NEPHROL 1759-5061       4,668        14.101        12.170
61415                                                        Nature Reviews Neurology        NAT REV NEUROL 1759-4758       8,095        19.819        20.888
61422                                                     NATURE REVIEWS NEUROSCIENCE      NAT REV NEUROSCI 1471-003X      40,834        32.635        38.691
61429                                                     Nature Reviews Rheumatology     NAT REV RHEUMATOL 1759-4790       6,584        15.661        14.358
61436                                                          Nature Reviews Urology          NAT REV UROL 1759-4812       2,966         8.089         7.335
61443                                           NATURE STRUCTURAL & MOLECULAR BIOLOGY   NAT STRUCT MOL BIOL 1545-9993      27,547        13.333        12.816
61451                                                          Natureza & Conservacao       NAT CONSERVACAO 1679-0073         433         2.766         2.532
68706 PROCEEDINGS OF THE NATIONAL ACADEMY OF SCIENCES OF THE UNITED STATES OF AMERICA   P NATL ACAD SCI USA 0027-8424     637,268         9.504        10.359
74079                                                                         SCIENCE               SCIENCE 0036-8075     645,132        41.058        40.627
77792                                                                  Sustainability  SUSTAINABILITY-BASEL 2071-1050       8,904         2.075         2.177
67415                                                                        PLoS One              PLOS ONE 1932-6203     582,877         2.766         3.352
74403                                                              Scientific Reports            SCI REP-UK 2045-2322     192,841         4.122         4.609
 
	

```
