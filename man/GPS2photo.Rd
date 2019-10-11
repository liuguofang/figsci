\name{GPS2photo}
\alias{GPS2photo}
\title{Add GPS coordinates to photos}
\usage{
GPS2photo(photo.pos ="d:/photo", exiftool.pos= "D:/software/EXE", GPS.point)
}
\description{
This function can be used to add GPS coordiantes (Longitude, Latitude) onto photos. Thus photos taken by camera can be visual on the map openned by cell phone i.e. iphone  fetch GPS points from photo with geographical position. It will output photo name, latitude and longtitude. The function depends on exiftool.exe software file (\url{https://sno.phy.queensu.ca/~phil/exiftool/}).
}

\arguments{
	\item{photo.pos} {the place of photos filefold.}
	\item{exiftool.pos} {the place of exiftool.exe file. please download exiftool.exe file from \url{https://sno.phy.queensu.ca/~phil/exiftool/} }
  \item{GPS.point} {Longitude and latitude coordinates,i.e. GPS.point=c(110,40)}
}

\examples{
pt <- c(109.8264,39.35989)
GPS2photo(GPS.point=pt)

}
