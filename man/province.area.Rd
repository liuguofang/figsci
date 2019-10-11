\name{province.area}
\alias{province.area}
\title{Calculate the province or city area}
\usage{
province.area(province)
}
\description{
Calculate the province or city area. The province.area function was written in 2013. 
}
\arguments{
	\item{province} {a province name.}
}

\examples{setwd("E:/3R/2data/china's edges")
provinceArea('新疆')

 province.area('河南省')
#[1] 16.13505
 province.area('北京')
#[1] 1.733211
 province.area('上海')
#[1] 0.6844895
 province.area('天津')
#[1] 1.213667
 province.area('内蒙')
#[1] 129.1125
 province.area('新疆')
#[1] 175.5907

}
