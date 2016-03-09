#Generate normal distr. using realizations of unif. distr.
RNORM = function(U,V){
theta = 2*pi*U
R = sqrt(-2*log(V))
return(c(R*cos(theta), R*sin(theta)))
}

# Generate Gam(1/2,1/2) from N(0,1)
# Note that Gam(1/2,1/2) = (4)Gam(1/2,2)=(4)Chi(1)
U1 = runif(1,0,1)
V1 = runif(1,0,1)
Norm = RNORM(U1,V1) #2 independent r.v.s from N(0,1)
Chis_df1 = Norm^2 #2 independent Chi Squares df 1
Gam_05_05 = Chis_df1*4
Gam_05_05
