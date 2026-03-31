\name{search_package_data}
\alias{search_package_data}
\title{Query the summary of data from a given package}
\usage{
search_package_data(package.name='smatr')
}
\description{
There are many data appeared in contributed R packages. The search_package_data can help users to query the data.
}


\arguments{
	\item{package.name} {the name of the package. }
}

\examples{

search_package_data()
#  leaflife
#  site     rain     soilp        longev            lma
#  1:17   high:34   high:40   Min.   :0.5162   Min.   : 56.94
#  2:17   low :33   low :27   1st Qu.:1.0100   1st Qu.:116.05
#  3:23                       Median :1.4591   Median :153.60
#  4:10                       Mean   :1.6676   Mean   :162.12
#                             3rd Qu.:2.1318   3rd Qu.:202.79
#                             Max.   :4.7304   Max.   :333.89
#
#  leafmeas
#      site          spp          Amass               lma
#  Murrua:108   Pimmic : 13   Min.   :  0.2593   Min.   : 31.1
#  RHM   :119   Eridif : 11   1st Qu.: 36.8416   1st Qu.:108.8
#  RHW   :173   Puldap : 10   Median : 56.6167   Median :160.0
#  WH    :130   Solfer : 10   Mean   : 70.9848   Mean   :187.2
#               Spapub : 10   3rd Qu.: 85.7306   3rd Qu.:236.6
#               Acaflo :  8   Max.   :410.9682   Max.   :595.7
#               (Other):468   NA's   :29         NA's   :14

search_package_data(package.name = 'agricolae')

}
