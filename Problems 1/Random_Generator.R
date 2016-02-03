#Let's use rchisq to do some random sampling
X_arr = rchisq(100, 1) #GAM(2,1/2)
X_arr = rchisq(100,1) + rchisq(100,1) + rchisq(100,1) #Chi-Squared(df=3)
X_arr = rchisq(100,1) + rchisq(100,1) #EXP(1/2)
X_arr = sqrt(rchisq(100,1)) #N(0,1)
X_arr = 4 + 3*sqrt(rchisq(100,1)) #N(4,9)
