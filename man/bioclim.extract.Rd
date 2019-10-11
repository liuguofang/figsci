\name{bioclim.extract}
\alias{bioclim.extract}
\title{Extract 19 bioclimate based on bioclim(1-19).grd data (30 second).}
\usage{
bioclim.extract(bioclim.pos="E:/analysis and graphics/R.eclipse/data/worldclim",site)
}
\description{
This function can be used to extract 19 bioclimate variables.

\arguments{
	\item{bioclim.pos} {the directory of bioclimate data. }
    \item{site} {a data.frame that contains only coordinates (long, lat) .}
}

\examples{

bioclim.extract(site=data.frame(long=c(110,108),lat=c(40,39)))
}
