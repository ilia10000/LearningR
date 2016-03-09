#Generate normal distr. using realizations of unif. distr.
RNORM = function(U,V){
theta = 2*pi*U
R = sqrt(-2*log(V))
return(c(R*cos(theta), R*sin(theta)))
}


KS = function(KSd, n, size)
{
KS = NULL
upper = c(1:size)/size
lower = upper - 1/size
for (i in 1:n)
{
new_data = sort(rnorm(size,0,1))
m = mean(new_data)
s = sd(new_data)
U = abs(upper-pnorm(new_data,0,1))
L = abs(lower-pnorm(new_data,0,1))
dstar = max(U,L)
KS = c(KS,dstar)
}
pvalue = length(KS[KS>KSd])/n
print(pvalue)
#return (KS)
}

data=NULL
for (i in 1:1000)
{
data = c(data, RNORM(runif(1,0,1),runif(1,0,1)))
}
data=sort(data)
data=sort(rnorm(1000,0,1))
upper = c(1:1000)/1000
lower = upper - 1/1000
m=mean(data)
s=sd(data)
U = abs(upper-pnorm(data,m,s))
L = abs(lower-pnorm(data,m,s))
KSd = max(U,L)
KS(KSd, 1000, 1000)



