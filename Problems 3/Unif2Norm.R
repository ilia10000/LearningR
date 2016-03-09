RNORM = function(U,V){
theta = 2*pi*U
R = sqrt(-2*log(V))
return(c(R*cos(theta), R*sin(theta)))
}