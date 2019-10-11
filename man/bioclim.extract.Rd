\name{bioclim.extract}
\alias{bioclim.extract}
\title{Extract 19 bioclimate based on bioclim(1-19).grd data (30 second).}
\usage{
bioclim.extract(bioclim.pos="E:/analysis and graphics/R.eclipse/data/worldclim",site)
}
\description{
This function can be used to extract 19 bioclimate variables.
}
\arguments{
	\item{bioclim.pos} {the directory of bioclimate data. }
        \item{site} {a data.frame that contains only coordinates (long, lat) .}
}

\examples{

bioclim.extract(site=data.frame(long=c(110,108),lat=c(40,39)))

# see online-search automatically. 
library(raster)
#  Valid resolutions are 0.5 (30 second), 2.5, 5, and 10 (minutes of a degree). 
dat <- getData('worldclim', var='bio', res=10)
d <- data.frame(x=c(118.5),y=c(48.73333)) # 新巴尔虎左旗
extract(dat,d)

}
