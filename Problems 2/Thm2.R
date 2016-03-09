KS_chi=function(data)
{
#Step 1 - Initializations
n = length(data)
N = 1000
F_upperstep = c(1:n)/n
F_lowerstep = F_upperstep - 1/n
#Step 2 - Parameter Estimation
mu = mean(data)
sigma = sd(data)
#Step 3 - initial distance calculation
#Calculate initial d
data = sort(data) #Make sure it is sorted
F = pchisq(data,1)
d = max(abs(F-F_upperstep),abs(F-F_lowerstep))
ddots = NULL
for (i in 1:N)
{
newdata = sort(rchisq(n,data,1))
newmu = mean(newdata)
newsd = sd(newdata)
F = pchisq(newdata,1)
ddot = max(abs(F-F_upperstep),abs(F-F_lowerstep))
ddots = c(ddots,ddot)
}
pvalue = length(ddots[ddots>d])/N
cat("\n","The pvalue is: ", pvalue,"\n")
if (pvalue < 0.10) print("reject Ho")
else print ("do not reject Ho")
cat("\n","We tested a mean of, ", mu, " and standard deviation of, ", sigma)
cat("\n","We expected a mean of, 1, and standard deviation of, 2","\n")
}
z=rnorm(50,0,1)
z = z*z
KS_chi(z)