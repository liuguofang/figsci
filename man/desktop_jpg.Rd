\name{desktop_jpg}
\alias{desktop_jpg}
\title{Create desktop jpg and/or add a saying}
\usage{
desktop_jpg(saying='')
}
\description{
Create desktop jpg and/or add a saying.
}
\arguments{
	\item{saying} {a saying on topright space.}
}


\examples{
lapply(1:100, function(i) {
			jpeg(file = paste("Rart", i, ".jpg", sep = ""), width = 1280, height = 800)
			desktop_jpg(saying="宁静致远")
			dev.off()
		})
    
}
