\name{sci.search}
\alias{sci.search}
\title{Search journal or influence factors from a local database}
\usage{
sci.search(dat = sci,journal,type=NULL,IF5.threshold=NULL,yr=NULL)
}
\description{
This function can be used to search journal or influence factors from a local database.
}

\arguments{
	\item{data} {the SCI indexes file.}
	\item{journal} {a journal or journal vector.}
	\item{type} {type can be one of Ecology, Plant, Bio.Conservatation, Environment.}
	\item{IF5.threshold} {default is NULL. filter condition with its values of IF-5 years over threhold.}
	\item{yr} {subset based yr augments}

}

\examples{

setwd("E:/3 Word PPT材料/科学写作帮助/SCI期刊影响因子等信息")
sci <- read.csv("2012-2018JCR.csv")
sci.search(sci, journal = 'plos one',yr = 2018)
sci.search(dat = sci,journal= "^science of (.*?)ent$")
sci.search(dat = sci,journal= "^nature")
sci.search(journal = 'ecology',yr = 2018,IF5.threshold = 5)
sci.search(journal = "^ecological indicator")
sci.search(journal = c("^nature$",'^science$',"^cell$","proceedings of the national"))
sci.search(journal = c("ecology letters",'ecological monographs',"trends in ecology"))
}



