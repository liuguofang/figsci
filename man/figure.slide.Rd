\name{figure.slide}
\alias{figure.slide}
\title{ Build PPT slide supported by latex running.
}
\usage{
figure.slide(topdown=FALSE, frametitle,figure.fold, font.size="\\normalsize",
                          layout=c(0.5,0.5), width = c(5, 5), fig.name, caption.text, footnote)
}
\description{
The function could be used as building PPT slide supported by latex running.
}
\arguments{
  \item{topdown} {valid when two figures are shown. default is left-right layout, top-down layout if it is TRUE. }
  \item{frametitle} {title of slide.}
  \item{figure.fold} {figure fold position.}
  \item{font.size} {font size. default is normalsize.}
  \item{layout} {the slide space is divided into 2 or several parts.}
  \item{width} {the figures' width.}
  \item{caption.text} {the caption of figure(s).}
  \item{footnote} {add a refence.}
}

\examples{

figure.slide(frametitle='litter quality affects soil N',
              figure.fold='E:/paperfigs',
              font.size='\\tiny',
              layout=c(0.45,0.55),
              width=c(5,5),
              fig.name=c("Carrillo_et_al_2011_fig1.pdf","Carrillo_et_al_2011_fig2.pdf"),
              caption.text=c('Mean daily nitrogen mineralization rates','Relationships between N mineralization or immobilization rates with litter quality parameters'),
              footnote='(Carrillo et al 2011 SBB)'
              )
              
}
