#Let's use rchisq to do some random sampling
RG = function(N)
{
	if (N == 0){
		X_arr = rchisq(100, 1) #GAM(2,1/2)
		return (X_arr)
	}
	if (N == 1){
		X_arr = rchisq(100,1) + rchisq(100,1) + rchisq(100,1) #Chi-Squared(df=3)
		return (X_arr)
	}
	if (N == 2){
		X_arr = rchisq(100,1) + rchisq(100,1) #EXP(1/2)
		return (X_arr)
	}
	if (N == 3){
		X_arr = sqrt(rchisq(100,1)) #N(0,1)
		return (X_arr)
	}
	if (N == 4){
		X_arr = 4 + 3*sqrt(rchisq(100,1)) #N(4,9)
		return (X_arr)
	}
	return (c(1:100))
}
N = 0
hist(	RG(N),
	main="Histogram of Random-Generator Output")
N = 1
hist(	RG(N),
	main="Histogram of Random-Generator Output")
N = 2
hist(	RG(N),
	main="Histogram of Random-Generator Output")
N = 3
hist(	RG(N),
	main="Histogram of Random-Generator Output")
N = 4
hist(	RG(N),
	main="Histogram of Random-Generator Output")
	