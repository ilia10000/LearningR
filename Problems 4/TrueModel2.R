X=matrix(c(rep(1,times=20),c(1:20),c(1:20)^2), ncol=3, nrow=20)
B=c(1.5,2,3.7)
e=rnorm(20,0,1)
Y = X%*%B + e
Y

XTX = t(X)%*%X
XTX_inv = solve(XTX)
coeffs = XTX_inv%*%t(X)
B_hat_1_coeffs = coeffs[2, ] # B_hat_1
B_hat_1_coeffs

#V_y = var(Y)
#var(e)
#V_y
V_Bhat = (var(Y)[1,1])*XTX_inv
Cov_Bhat1_Bhat2 = V_Bhat[2,3]
Cov_Bhat1_Bhat2

New_Y=c(5.3967195761284,
20.7427062868898,
41.7567933779706,
67.8612008826903,
104.913635725741,
146.025048782235,
198.605194904219,
254.811635463541,
319.635613188451,
390.560652578658,
470.758999796069,
558.952618509929,
651.812193504609,
755.735282049078,
863.861992783895,
979.825450085884,
1104.26106404376,
1236.32310038241,
1376.60803871586,
1523.13553590764)

New_Bhat1 = B_hat_1_coeffs%*%New_Y
New_Bhat1
Mult = qt(0.975, 18)
New_V_Bhat=var(e)*XTX_inv
new_var = New_V_Bhat[2,2]
SE = sqrt(new_var)
conf_int_B1 = c(New_Bhat1 - Mult*SE,New_Bhat1 + Mult*SE)
conf_int_B1
new_cov_B1_B2 = New_V_Bhat[2,3]
new_cov_B1_B2

#set.seed(20567856)
counter=0
for (i in 1:100000){
new_e=rnorm(20,0,1)
New_Y=X%*%B + new_e
New_Bhat1 = B_hat_1_coeffs%*%New_Y
New_Bhat1
Mult = qt(0.975, 18)
New_V_Bhat=var(new_e)*XTX_inv
new_var = New_V_Bhat[2,2]
SE = sqrt(new_var)
conf_int_B1 <- c(New_Bhat1 - Mult*SE, New_Bhat1 + Mult*SE)
if (conf_int_B1[1] < 2 && 2 < conf_int_B1[2]){counter = counter + 1}
}
proportion=counter/100000
proportion

