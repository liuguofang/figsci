\name{fetch_manuscript_citation}
\alias{fetch_manuscript_citation}
\title{Fetch citation from main text in a manuscript}
\usage{
fetch_manuscript_citation(txt)
}
\description{
The function could be used as fetching citation from main text in a manuscript. It is used to show cited references tyles and list. Thus, it can be used to check whether references cited match or not if they are compared with with reference list at the end of manuscript. 
}
\arguments{
	\item{txt} {a txt file from main text in manuscript.}
}


\examples{
txt <- readLines("clipboard")
fetch.reference(txt)

}
