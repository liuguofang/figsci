
lignin.NMR <- function(I_low,I_high){
	# Haw et al 1984
	I_lig <- (9.92/6)*I_low
	I_carb <- I_high-(3.92/6)*I_low
	I_lig2_st <- I_lig/(I_lig+I_carb)
	I_carb_st <- I_carb/(I_lig+I_carb)
	lignin <- (183/9.92)*I_lig2_st/(183/9.92*I_lig2_st+162/6*I_carb_st)
	lignin
}
