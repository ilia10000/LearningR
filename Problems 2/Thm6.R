KS_gamma=function(data)
{
#Step 1 - Initializations
n = length(data)
N = 1000
shape = 2
F_upperstep = c(1:n)/n
F_lowerstep = F_upperstep - 1/n
#Step 2 - Parameter Estimation
mu = mean(data)
sigma = sd(data)
scale = mu/shape
rate = 1/scale
#Step 3 - initial distance calculation
#Calculate initial d
data = sort(data) #Make sure it is sorted
F = pgamma(data, shape, rate)
d = max(abs(F-F_upperstep),abs(F-F_lowerstep))
ddots = NULL
for (i in 1:N)
{
newdata = sort(rgamma(n,shape, rate))
newmu = mean(newdata)
newsd = sd(newdata)
newscale=newmu/shape
newrate = 1/newscale
F = pgamma(newdata,shape, newrate)
ddot = max(abs(F-F_upperstep),abs(F-F_lowerstep))
ddots = c(ddots,ddot)
}
pvalue = length(ddots[ddots>d])/N
cat("\n","The pvalue is: ", pvalue,"\n")
if (pvalue < 0.10) print("reject Ho")
else print ("do not reject Ho")
cat("\n","We tested mean, sd, rate of ", mu, ", ", sigma, ", ", rate )
cat("\n","We expected mean, sd, rate of 0.2, 0.02^0.5, 10","\n")
}
x=rexp(50,10)
y=rexp(50,10) #Independence assumed since generated separately
z = x+y
KS_gamma(z)