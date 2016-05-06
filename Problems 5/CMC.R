#Algorithm for CMC
# y = e^(-x+1)
# x = 1 - ln(y)
# dx = (1-1/y)dy
# New integral is from 0 to 1 of [(1-1/y)*log(1-log(y))/(1-log(y))^2]dy
y = runif(1000)
g = (1-1/y)log(1-log(y))/(1-log(y))^2
mean(g)
c(mean(g)-1.96*sqrt(var(g)/n), mean(g)+1.96*sqrt(var(g)/n))
n = (1.96^2)*(var(g))/0.0001^2
n