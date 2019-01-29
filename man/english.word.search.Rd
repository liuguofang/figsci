\name{english.word.search}
\alias{english.word.search}
\title{search the meaning of a word or english word}
\usage{
english.word.search(string='')
}
\description{
This function could be used as searching the meaning of a word or english word. 
}
\arguments{
	\item{string} {a word or the meaning of a word }
}


\examples{

english.word.search("^preci(.*?)n")

english.word.search("hier")
english.word.search("disentangle")
english.word.search("解开")
english.word.search("阐明")

}
