\name{GPS2kml}
\alias{GPS2kml}
\title{Build a kml file with geographical points}
\usage{
GPS2kml(points, filename)
}
\description{
This function can be used to build a kml file with geographical points.
}

\arguments{
  \item{points }{the points data.frame.}
  \item{filename}{the kml filename.}
}

\author{Juan Du \email{du@ibcas.ac.cn}

\examples{

county <- c("yijinhuoluo", "zhungeer", "dalate", "hangjin", "wushen", "etuokeqian", "etuoke")
lon <- c(109.73379, 110.87967, 110.02905, 108.72321, 108.84956, 107.43605, 107.98152)
lat <- c(39.566647, 39.647034, 40.396904, 39.839581, 38.598644, 38.22477, 39.09407)

example.pt <- data.frame(county, lon, lat)

GPS2kml(example.pt, "county position")

}
