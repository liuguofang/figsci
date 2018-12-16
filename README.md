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
	Rank	Full.Journal.Title	JCR.Abbreviated.Title	ISSN	Total.Cites	IF2	IF5	Eigenfactor.Score	year	Soil	Ecology	Plant	Bio.Conservatation	Environment
22530	1019	ECOLOGY	ECOLOGY	0012-9658	60,825	4.617	5.677	0.04415	2018		ecology			
44421	807	JOURNAL OF ECOLOGY	J ECOL	0022-0477	18,409	5.172	6.525	0.02482	2018		ecology	plant		
28813	719	FUNCTIONAL ECOLOGY	FUNCT ECOL	0269-8463	14,638	5.491	5.657	0.02176	2018		ecology			
41305	658	JOURNAL OF APPLIED ECOLOGY	J APPL ECOL	0021-8901	18,142	5.742	6.16	0.02282	2018		ecology			
62480	394	NEW PHYTOLOGIST	NEW PHYTOL	0028-646X	44,994	7.433	7.833	0.07783	2018					
55935	411	LAND DEGRADATION & DEVELOPMENT	LAND DEGRAD DEV	1085-3278	4,655	7.27	6.564	0.00628	2018	soil				environment
61175	11	NATURE	NATURE	0028-0836	710,766	41.577	44.958	1.35581	2018					
61184	10337	Nature + Culture	NAT CULT	1558-6073	307	0.645	2.513	0.00094	2018					
61189	12271	Nature Astronomy	NAT ASTRON	2397-3366	322	Not Available	Not Available	2.00E-05	2018					
61190	12271	Nature Biomedical Engineering	NAT BIOMED ENG	2157-846X	341	Not Available	Not Available	3.00E-05	2018					
61192	19	NATURE BIOTECHNOLOGY	NAT BIOTECHNOL	1087-0156	57,510	35.724	43.271	0.16146	2018					
61199	80	NATURE CELL BIOLOGY	NAT CELL BIOL	1465-7392	39,896	19.064	20.46	0.09296	2018					
61206	140	Nature Chemical Biology	NAT CHEM BIOL	1552-4450	19,562	13.843	13.99	0.06124	2018					
61212	35	Nature Chemistry	NAT CHEM	1755-4330	29,548	26.201	28.79	0.10172	2018					
61220	78	Nature Climate Change	NAT CLIM CHANGE	1758-678X	17,986	19.181	22.363	0.0967	2018					environment
61221	78	Nature Climate Change	NAT CLIM CHANGE	1758-678X	17,986	19.181	22.363	0.0967	2018					environment
61239	176	Nature Communications	NAT COMMUN	2041-1723	178,348	12.353	13.691	0.92656	2018					
61247	7080	Nature Conservation-Bulgaria	NAT CONSERV-BULGARIA	1314-6947	175	1.367	1.91	0.00054	2018					
61249	12271	Nature Ecology & Evolution	NAT ECOL EVOL	2397-334X	596	Not Available	Not Available	5.00E-05	2018					
61251	8	Nature Energy	NAT ENERGY	2058-7546	5,072	46.859	46.87	0.02043	2018					
61253	31	NATURE GENETICS	NAT GENET	1061-4036	93,639	27.125	31.154	0.23411	2018					
61259	124	Nature Geoscience	NAT GEOSCI	1752-0894	20,386	14.391	14.846	0.07889	2018					
61267	59	NATURE IMMUNOLOGY	NAT IMMUNOL	1529-2908	41,410	21.809	21.974	0.10229	2018					
61273	15	NATURE MATERIALS	NAT MATER	1476-1122	92,291	39.235	47.534	0.195	2018					
61280	22	NATURE MEDICINE	NAT MED	1078-8956	75,461	32.621	33.409	0.17198	2018					
61287	32	NATURE METHODS	NAT METHODS	1548-7091	54,686	26.919	41.934	0.24317	2018					
61295	132	Nature Microbiology	NAT MICROBIOL	2058-5276	2,510	14.174	14.182	0.01367	2018					
61296	16	Nature Nanotechnology	NAT NANOTECHNOL	1748-3387	57,369	37.49	45.815	0.17063	2018					
61303	73	NATURE NEUROSCIENCE	NAT NEUROSCI	1097-6256	59,426	19.912	19.188	0.15371	2018					
61311	23	Nature Photonics	NAT PHOTONICS	1749-4885	39,331	32.521	38.551	0.12812	2018					
61318	54	Nature Physics	NAT PHYS	1745-2473	33,233	22.727	22.61	0.12221	2018					
61325	200	Nature Plants	NAT PLANTS	2055-026X	2,284	11.471	11.471	0.01224	2018					
61327	174	Nature Protocols	NAT PROTOC	1754-2189	36,821	12.423	15.269	0.08655	2018					
61334	9	NATURE REVIEWS CANCER	NAT REV CANCER	1474-175X	50,407	42.784	50.293	0.07973	2018					
61341	114	Nature Reviews Cardiology	NAT REV CARDIOL	1759-5002	5,228	15.162	13.249	0.01821	2018					
61348	12271	Nature Reviews Chemistry	NAT REV CHEM	2397-3358	282	Not Available	Not Available	0	2018					
61349	39	Nature Reviews Clinical Oncology	NAT REV CLIN ONCOL	1759-4774	8,354	24.653	20.605	0.02611	2018					
61357	98	Nature Reviews Disease Primers	NAT REV DIS PRIMERS	2056-676X	1,559	16.071	16.155	0.00725	2018					
61358	6	NATURE REVIEWS DRUG DISCOVERY	NAT REV DRUG DISCOV	1474-1776	31,312	50.167	54.49	0.05441	2018					
61365	68	Nature Reviews Endocrinology	NAT REV ENDOCRINOL	1759-5029	7,377	20.265	19.244	0.02519	2018					
61372	92	Nature Reviews Gastroenterology & Hepatology	NAT REV GASTRO HEPAT	1759-5045	6,686	16.99	16.533	0.02417	2018					
61379	12	NATURE REVIEWS GENETICS	NAT REV GENET	1471-0056	35,680	41.465	44.913	0.0943	2018					
61386	10	NATURE REVIEWS IMMUNOLOGY	NAT REV IMMUNOL	1474-1733	39,215	41.982	46.507	0.08536	2018					
61393	5	Nature Reviews Materials	NAT REV MATER	2058-8437	3,218	51.941	51.941	0.01506	2018					
61394	24	NATURE REVIEWS MICROBIOLOGY	NAT REV MICROBIOL	1740-1526	26,627	31.851	31.155	0.05549	2018					
61401	20	NATURE REVIEWS MOLECULAR CELL BIOLOGY	NAT REV MOL CELL BIO	1471-0072	43,667	35.612	47.918	0.09554	2018					
61408	135	Nature Reviews Nephrology	NAT REV NEPHROL	1759-5061	4,668	14.101	12.17	0.0171	2018					
61415	74	Nature Reviews Neurology	NAT REV NEUROL	1759-4758	8,095	19.819	20.888	0.02809	2018					
61422	21	NATURE REVIEWS NEUROSCIENCE	NAT REV NEUROSCI	1471-003X	40,834	32.635	38.691	0.06994	2018					
61429	104	Nature Reviews Rheumatology	NAT REV RHEUMATOL	1759-4790	6,584	15.661	14.358	0.02231	2018					
61436	351	Nature Reviews Urology	NAT REV UROL	1759-4812	2,966	8.089	7.335	0.00866	2018					
61443	152	NATURE STRUCTURAL & MOLECULAR BIOLOGY	NAT STRUCT MOL BIOL	1545-9993	27,547	13.333	12.816	0.08182	2018					
61451	2975	Natureza & Conservacao	NAT CONSERVACAO	1679-0073	433	2.766	2.532	0.00123	2018					
68706	255	PROCEEDINGS OF THE NATIONAL ACADEMY OF SCIENCES OF THE UNITED STATES OF AMERICA	P NATL ACAD SCI USA	0027-8424	637,268	9.504	10.359	1.10822	2018					
74079	13	SCIENCE	SCIENCE	0036-8075	645,132	41.058	40.627	1.12716	2018					
77792	4599	Sustainability	SUSTAINABILITY-BASEL	2071-1050	8,904	2.075	2.177	0.01377	2018					environment
77793	4599	Sustainability	SUSTAINABILITY-BASEL	2071-1050	8,904	2.075	2.177	0.01377	2018					environment
67415	2975	PLoS One	PLOS ONE	1932-6203	582,877	2.766	3.352	1.86235	2018				Biological Conservation	
74403	1308	Scientific Reports	SCI REP-UK	2045-2322	192,841	4.122	4.609	0.71896	2018					

```
