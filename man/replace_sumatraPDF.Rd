\name{replace_sumatraPDF}
\alias{replace_sumatraPDF}
\title{Replace automatically sumatraPDF settings with a saved file containing settings}
\usage{
replace_sumatraPDF(settings.file, SumatraPDF.settings.place = NULL)
}
\description{
This function could be used as openning a list of PDFs efficiently. It will replace automatically sumatraPDF settings with a saved file containing settings. You need install the open source Sumatra PDF software \url{https://www.sumatrapdfreader.org/free-pdf-reader.html}
}
\arguments{
	\item{settings.file} {a string describing a colour. }
	\item{SumatraPDF.settings.place} {feed a directory on sumatraPDF settings. default is NULL, the code could obtain the directory by itselft.}
}


\examples{

replace_sumatraPDF(settings.file = "empty.txt")

}
