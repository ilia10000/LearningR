KS_chisq=function(data)
{
#Step 1 - Initializations
n = length(data)
N = 1000
F_upperstep = c(1:n)/n
F_lowerstep = F_upperstep - 1/n
#Step 2 - Parameter Estimation
mu = mean(data)
sigma = sd(data)
df = mu
#Step 3 - initial distance calculation
#Calculate initial d
data = sort(data) #Make sure it is sorted
F = pchisq(data, df)
d = max(abs(F-F_upperstep),abs(F-F_lowerstep))
ddots = NULL
for (i in 1:N)
{
newdata = sort(rchisq(n,df))
newmu = mean(newdata)
newsd = sd(newdata)
newdf=newmu
F = pchisq(newdata,newmu)
ddot = max(abs(F-F_upperstep),abs(F-F_lowerstep))
ddots = c(ddots,ddot)
}
pvalue = length(ddots[ddots>d])/N
cat("\n","The pvalue is: ", pvalue,"\n")
if (pvalue < 0.10) print("reject Ho")
else print ("do not reject Ho")
cat("\n","We tested df of ", df )
cat("\n","We expected df of 2","\n")
}
x=rchisq(50,1)
y=rchisq(50,1) #Independence is assumed since X and Y are
                 # created separately.
z = x+y
KS_chisq(z)