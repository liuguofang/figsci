\name{lignin.NMR}
\alias{lignin.NMR}
\title{ Calculate lignin content based on Nuclear Magnetic Resonance (NMR).}
\usage{
lignin.NMR(I_low,I_high)
}
\description{
 This function can be used to Calculate lignin content based on Nuclear Magnetic Resonance (NMR). Haw J F, Maciel G E, Schroeder H A. Carbon-13 nuclear magnetic resonance spectrometric study of wood and wood pulping with cross polarization and magic-angle spinning[J]. Analytical Chemistry, 1984, 56(8): 1323-1329.}
\arguments{
	\item{I_low} {0-112 ppm to the low shielding side.}
	\item{I_high} {112-160 to the high shielding side.}
}
\details{
The method is based on the reference that Haw J F, Maciel G E, Schroeder H A. Carbon-13 nuclear magnetic resonance spectrometric study of wood and wood pulping with cross polarization and magic-angle spinning[J]. Analytical Chemistry, 1984, 56(8): 1323-1329.
}

\examples{
# data from Chen et al 1989 Chemical properties and soilid state CPMAS 13C-NMR 
# of composted organic matter Science of the Total Environment
NMR.dat <- read.table(head=TRUE,text='
ppm	day0	day147
0-50	13.7	19.5
50-60	5.8	6.2
60-70	10.8	7.8
70-98	36.3	22.7
98-112	11.3	8.5
112-145	9.5	13.1
145-163	5.3	8.7
163-1g0	5.7	10.8
190-215	1.6	2.7')

I_high <- apply(NMR.dat[1:5,-1],2,sum)
I_low <- apply(NMR.dat[6:7,-1],2,sum)
parameter <- data.frame(I_low,I_high)

sapply(1:length(parameter),function(i) lignin.NMR(parameter[i,1],parameter[i,2]))
## [1] 0.1968061 0.3279816

apply(NMR.dat[-1],2,sum)

}
