\name{province.color}
\alias{province.color}
\title{Obtain the color vector based on focused provinces of China map}
\usage{
province.color(mapdata, provname, provcol, othercol)
}
\description{
Obtain the color vector based on focused provinces of China map. The code is from  Yichuan Qiu (邱怡轩). 
}
\arguments{
	\item{mapdata} {china map data with shp file.}
	\item{provname} {a province vector.}
  \item{provcol} {a vector on provinces' colors.}
  \item{othercol} {a background color.}
}
\examples{
library(maptools)
library(gstat)
setwd("E:\\3R\\2data\\china's polygon")
nc <- readShapePoly('bou2_4p.shp', proj4string = CRS("+proj=longlat +ellps=clrk66"))
provname1 <- c("北京市","天津市","上海市","重庆市");
provcol1 <- c("red","pink",'green','blue','yellow')
plot(nc,col=province.color(nc,provname=provname1,provcol=provcol1,othercol="white"))
provname2 <- c( "内蒙古自治区" ,"新疆维吾尔自治区","甘肃省", "宁夏回族自治区","青海省")
provcol2 <- rainbow(33)[1:length(provname2)]
plot(nc,col=province.color(nc,provname=provname2,provcol=provcol2,othercol="white"))
}
