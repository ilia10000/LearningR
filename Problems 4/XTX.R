XTX = matrix(c(30,2108,5414,2108,152422,376562,5414,376562,1015780), ncol=3, nrow=3)
XTX_inv = solve(XTX)
XTX_inv
XTY = c(5263,346867,921939)
B_hat = XTX_inv%*%XTY
B_hat
# SSE = (Y-XB)'(Y-XB) = Y'Y - Y'XB - Y(XB)' + (XB)'XB
#     = Y'Y - (X'Y)'B - Y(XB)' + B'X'XB = Y'Y - 2(X'Y)'B + B'X'XB
YTY = 1148317
#SSE = YTY - 2*t(XTY)%*%B_hat + t(B_hat)%*%XTX%*%B_hat
#SSE
SSE = YTY - t(B_hat)%*%XTY
SSE

MSE = SSE[1,1]
V_Bhat = MSE*XTX_inv
V_Bhat_1 = V_Bhat[2,2]
Cov_Bhat_1_2 = V_Bhat[2, 3]
V_Bhat
V_Bhat_1
Cov_Bhat_1_2
