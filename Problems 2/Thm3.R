KS_exp=function(data)
{
#Step 1 - Initializations
n = length(data)
N = 1000
F_upperstep = c(1:n)/n
F_lowerstep = F_upperstep - 1/n
#Step 2 - Parameter Estimation
mu = mean(data)
sigma = sd(data)
lambda = 1/mu
#Step 3 - initial distance calculation
#Calculate initial d
data = sort(data) #Make sure it is sorted
F = pexp(data, lambda)
d = max(abs(F-F_upperstep),abs(F-F_lowerstep))
ddots = NULL
for (i in 1:N)
{
newdata = sort(rexp(n,lambda))
newmu = mean(newdata)
newsd = sd(newdata)
newlambda=1/newmu
F = pexp(newdata,newlambda)
ddot = max(abs(F-F_upperstep),abs(F-F_lowerstep))
ddots = c(ddots,ddot)
}
pvalue = length(ddots[ddots>d])/N
cat("\n","The pvalue is: ", pvalue,"\n")
if (pvalue < 0.10) print("reject Ho")
else print ("do not reject Ho")
cat("\n","We tested a mean of ", mu, " and lambda of ", lambda )
cat("\n","We expected a mean of 0.5, and lambda of 2","\n")
}
x=rexp(50)
y=rexp(50) #Independence is assumed since X and Y are
                 # created separately.
z = min(x,y)
KS_exp(z)