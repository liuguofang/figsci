\name{com.abund2matrix}
\alias{com.abund2matrix}
\title{Transform a community investigation data into a species x quadrate matrix
}
\usage{
com.abund2matrix(dat, species = "species", quadrate = "plot", abundance='abundance')
}
\description{
The function could be used as transforming plant community invegetation into species x quadrate matrix. 
}
\arguments{
	\item{dat} {a community abundance data with different quadrates input.}
	\item{species} {a species array.}
	\item{quadrate} {a quadrate code array.}
	\item{abundance} {a species abundance array.}
}

\examples{

data(BCI,package='vegan')
 BCI2 <- stack(BCI)
 BCI2$id <- 1:nrow(BCI)
 BCI2 <- subset(BCI2,values>0)
 head(BCI2) 
#     values                   ind id
# 10       1    Abarema.macradenia 10
# 78       2 Vachellia.melanoceras 28
# 82       1 Vachellia.melanoceras 32
# 134      1 Acalypha.diversifolia 34
# 140      1 Acalypha.diversifolia 40
# 178      1 Acalypha.macrostachya 28

BCI3 <- com.abund2matrix(BCI2, species = 'ind', quadrat = 'id',abundance = 'values')
dim(BCI3)

}
