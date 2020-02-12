# TODO: Add comment
# 
# Author: liuguofang
###############################################################################


lignin.NMR <- function(I_low,I_high){
	# Haw et al 1984
	I_lig <- (9.92/6)*I_low
	I_carb <- I_high-(3.92/6)*I_low
	I_lig2_st <- I_lig/(I_lig+I_carb)
	I_carb_st <- I_carb/(I_lig+I_carb)
	lignin <- (183/9.92)*I_lig2_st/(183/9.92*I_lig2_st+162/6*I_carb_st)
	lignin
}

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

