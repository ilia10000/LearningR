#Generate normal distr. using realizations of unif. distr.
RNORM = function(U,V){
theta = 2*pi*U
R = sqrt(-2*log(V))
return(c(R*cos(theta), R*sin(theta)))
}

# Generate N(4,9) from N(0,1)
U1 = runif(1,0,1)
V1 = runif(1,0,1)
mu = 4
sigma = 3
Norm = RNORM(U1,V1) #2 independent r.v.s from N(0,1)
New_norm = sigma*Norm + mu
New_norm