\name{lignin.NMR}
\alias{lignin.NMR}
\title{ Calculate lignin content based on 13C Nuclear Magnetic Resonance (NMR).}
\usage{
lignin.NMR(I_low,I_high)
}
\description{
 This function can be used to Calculate lignin content based on 13C Nuclear Magnetic Resonance (NMR). Haw J F, Maciel G E, Schroeder H A. Carbon-13 nuclear magnetic resonance spectrometric study of wood and wood pulping with cross polarization and magic-angle spinning[J]. Analytical Chemistry, 1984, 56(8): 1323-1329.}
\arguments{
	\item{I_low} {0-112 ppm to the low shielding side.}
	\item{I_high} {112-160 to the high shielding side.}
}
\details{
The method is based on the reference that Haw J F, Maciel G E, Schroeder H A. Carbon-13 nuclear magnetic resonance spectrometric study of wood and wood pulping with cross polarization and magic-angle spinning[J]. Analytical Chemistry, 1984, 56(8): 1323-1329.
}

\examples{
pack <- author.packages("Hadley Wickham")
pack
}
