\name{item.slide}
\alias{item.slide}
\title{Building a slide including multiple items}
\usage{
item.slide(frametitle,font.size="\\normalsize",item.text, footnote)
}
\description{
This function can be used to build a slide inlcuidng multiple items.
}

\arguments{
  \item{frametitle} {title of slide.}
  \item{font.size} {font size. default is normalsize.}
  \item{item.text} {a vectors of multiple items}
  \item{footnote} {add a refence as footnote.}

}

\examples{

item.slide(frametitle ="Litter decomposition process",
          item.text=c("Above ground litter decomposition is the result of three interlinked processes: \\alert{leaching}, \\alert{fragmentation} and \\alert{catabolism}.",
                      "Litter decomposition estimates are most commonly based on measurements of mass loss from litter residues, confined in mesh bags. This method provides a rough estimate of leaching and catabolism, while preventing fragmentation from occurring.",
                      "Litter decomposition is studied in the laboratory as microbial respiration of litter residue. In this case, generally only catabolism is measured."),
           footnote= "(Cotrufo et al. 2010 Plant Soil)")
}
