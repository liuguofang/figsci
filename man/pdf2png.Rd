\name{pdf2png}
\alias{pdf2png}
\title{Transoform the cover page of pdf files into png files}
\usage{
pdftopng(pdf.pos, pdftopng.pos, resolution=250, full.page = FALSE)
}
\description{
This function can be used to transoform the cover page of pdf files into png files.  
}

\arguments{
	\item{pdf.pos} {pdf fold place.}
	\item{pdftopng.pos} {the place of pdftopng.exe file.}
	\item{full.page} {if the argument is TRUE, the function will show the full pages of a PDF file. }
	\item{resolution}{ the resolution of png, default is 250 dpi.}
}

\examples{

pdf2png(pdf.pos = "D:/pdf", pdftopng.pos ="D:/software/EXE/xpdfbin-win-3.04/bin64",resolution = 300)

}
