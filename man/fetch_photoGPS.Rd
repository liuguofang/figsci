\name{fetch_photoGPS}
\alias{fetch_photoGPS}
\title{Fetch GPS points from a group of photos with geographical position information}
\usage{
fetch_photoGPS(photo.pos, jhead.pos)
}
\description{
This function can be used to fetch GPS points from photo with geographical position. It will output photo name, latitude and longtitude. The function depends on jhead.exe file (\url{http://www.sentex.net/~mwandel/jhead/jhead.exe}), which can extract from an jpeg file. 
}

\arguments{
	\item{photo.pos} {the place of photos filefold.}
	\item{jhead.pos} {the place of jhead.exe file. please download jhead.exe file from \url{http://www.sentex.net/~mwandel/jhead/jhead.exe} }
}
\author{Juan Du \email{du@ibcas.ac.cn}

\examples{

out <- fetch_photoGPS(photo.pos= "D:/photo/", jhead.pos="D:/software/EXE")
out

}
