mydata = read.table("D:/Workspace/LearningR/Problems 4/mydata.txt", header=TRUE)
X = matrix(c(rep(1,27),mydata["Price"][,],mydata["EngineSize"][,], mydata["Weight"][,], mydata["HorsePower"][,]),ncol=5,nrow=27)
Y = mydata["Consumption"][,]
XTX = t(X)%*%X
XTX_inv = solve(XTX)
XT = t(X)
XTY = XT%*%Y
B = XTX_inv%*%XTY
B

estimate=B[5]
Mult = qt(0.975, 18)
New_V_Bhat=XTX_inv
new_var = New_V_Bhat[5,5]
SE = sqrt(new_var)
conf_int_B4 = c(estimate- Mult*SE,estimate+ Mult*SE)
conf_int_B4

new_X = c(1,28300,1800,78,1200)
new_Y= new_X%*%B
new_Y
SE = sqrt(var(Y))
conf_int_Y = c(estimate- Mult*SE,estimate+ Mult*SE)
conf_int_Y