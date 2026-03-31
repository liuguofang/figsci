\name{OLS_regression_facet}
\alias{OLS_regression_facet}
\title{The ordinary linear regression (with or without group) with facets}
\description{
  Draws a scatter plot with optional grouping and faceting, fits OLS regression lines, and highlights significant regressions based on p-value.
}
\usage{
OLS_regression_facet(
  data, x, y, group = NULL, facet = NULL,
  nrow = NULL, ncol = NULL, alpha = 0.05, title.pos = 0.5)
}
\arguments{
  \item{data}{A data.frame containing the variables to be plotted.}
  \item{x}{Name of the variable to be used for the x-axis (string).}
  \item{y}{Name of the variable to be used for the y-axis (string).}
  \item{group}{(Optional) Name of the grouping variable (string).}
  \item{facet}{(Optional) Name of the faceting variable (string).}
  \item{nrow}{(Optional) Number of rows for facet layout.}
  \item{ncol}{(Optional) Number of columns for facet layout.}
  \item{alpha}{Significance level for regression p-value (default is 0.05).}
  \item{title.pos}{Horizontal justification for facet labels (default is 0.5: center; 0: left-aligned; 1: right-aligned).}
}
\details{
  The function creates a scatter plot using \code{ggplot2}, fits OLS regression lines for each group/facet, and only displays regression lines where the slope is statistically significant (\code{p < alpha}). Facet labels can be left, center, or right aligned using \code{title.pos}.
}
\value{
  A \code{ggplot} object.
}
\seealso{
  \code{\link[ggplot2]{ggplot}}, \code{\link[ggpmisc]{stat_poly_eq}}
}

\examples{
data(leaflife,package = 'smatr')
OLS_regression_facet(leaflife, x = 'lma', y = 'longev')
OLS_regression_facet(leaflife, x = 'lma', y = 'longev', group = 'rain')
OLS_regression_facet(leaflife, x = 'lma', y='longev', group = 'soilp', facet = 'rain')

library(reshape2)
library(ggplot2)
iris2 <- melt(iris, id.vars = c("Petal.Width", "Species"))
OLS_regression_facet(
  iris2, x = "Petal.Width", y = "value",
  group = "Species", facet = "variable",
  nrow = 2, ncol = 2, title.pos = 0
)
}
