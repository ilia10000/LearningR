#Generate normal distr. using realizations of unif. distr.
RNORM = function(U,V){
theta = 2*pi*U
R = sqrt(-2*log(V))
return(c(R*cos(theta), R*sin(theta)))
}

# Generate Exp(2) from N(0,1)
# Note that Exp(2) = (1/4)Exp(1/2) = (1/4)Chi(2)
U1 = runif(1,0,1)
V1 = runif(1,0,1)
Norm = RNORM(U1,V1) #2 independent r.v.s from N(0,1)
Chis_df1 = Norm^2 #2 independent Chi Squares df 1
Chi_df2 = sum(Chis_df1) #1 Chi Square df 2
Exp = Chi_df2/4
Exp
