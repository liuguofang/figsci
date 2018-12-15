\name{plantspecies2chinese}
\alias{plantspecies2chinese}
\title{transform plant species latin into chinese name by visiting  \url{http://www.cvh.ac.cn/search/} }
\usage{
plantspecies2chinese(species)
}
\description{
This function can be used to transform plant species latin into chinese name by visiting  \url{http://www.cvh.ac.cn/search/} (中国数字标本馆).}

\arguments{
	\item{species} { the array of species name.}
}

\examples{


species <- c("Phragmites australis", "Setaria viridis")

plantspecies2chinese(species = species)

}
