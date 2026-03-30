\name{vector_diff_compare}
\alias{vector_diff_compare}
\title{Check whether elements of x don't belong to y and whether elments of y don't belong to x}
\usage{
vector_diff_compare(x, y)
}
\description{
This function can be used to check interactively whether elements from array x don't belong to array y.
}

\arguments{
	\item{x} {an array.}
	\item{y} {an array.}
}

\examples{
data(BCI, package='vegan')
set.seed(99)
species.group1 <- sample(names(BCI),100)
# randomly delete 5 species 
species.group2<- species.group1[-sample(100,5)]
vector_diff_compare(species.group1, species.group2)
}
