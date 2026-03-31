\name{twoway_barplot_facet}
\alias{twoway_barplot_facet}
\title{Draw a two-way ggplot barplot and add significant letters onto the bars automatically}
\usage{
twoway_barplot_facet(data, x.factor, group, value, facet_row = NULL, facet_col = NULL,
                     method = "HSD.test",scales = "fixed")
}
\description{
The function could be used as drawing two-way ggplot barplot and adding letters representing significant difference automatically. Same uppercase and lowercase denote non-significant difference between factor levels (x axis) for each of group levels and between group levels (group) for each of factor levels (x axis) in terms of ggplot style.
Also, the function can use the facet_grid function to draw the two-bay plots for many response variables.
}


\arguments{
	\item{data} {a dataframe. }
	\item{x.factor} {a category variable at the x axis.}
	\item{value} {a continuous response variable. }
	\item{group} { a group variable at the y axis.}
	\item{facet_row} {order subplots into one row, the default is NULL. }
	\item{facet_col} {order subplots into one column, the default is NULL. }
	\item{method} {one of multiple contrast approach in \code{\link{HSD.test}}, \code{\link{duncan.test}}, \code{\link{LSD.test}} etc in agricolae package. The default is Tukey HSD.test.}
    \item{scales}{When \code{facet_grid} is used, if the response variables have different ranges, the \code{scales} argument can be set (e.g., \code{"free_y"}) to allow each panel to have its own y-axis range according to the actual data.}
}

\examples{
## draw two-way barplot in terms of ggplot.

x11()
data(Chz2006,package='agricolae')
dat <- Chz2006$yield
p1 <- twoway_barplot_facet(data=dat,x.factor='amendment',group='crop',value='health')
p1
p1 +
  theme(legend.position = c(0.1, 0.9),
  legend.background = element_blank()
  )+
  labs(fill = "Crop")+
  labs(x="Amendment",y='Health')

# draw multiple two-way barplots using facet_row or facet_column argument.
x11()
library(reshape)
dat2 <- melt(dat,id.vars=c("amendment", "crop", "block"))
multi.p <- twoway_barplot_facet(data=dat2,x.factor='amendment',group='crop',value='value',
    facet_row='variable',scale='free_y')
multi.p

multi.p + theme(
  legend.position = c(0.8, 0.4),
  legend.background = element_blank(),
  legend.box.background = element_blank()
)

｝
