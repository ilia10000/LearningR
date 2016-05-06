#Algorithm for CMC
# y = (x-1)/(4-1) = (x-1)/3
# x = 3y + 1
# dx = 3dy
# New integral is from 0 to 1 of [3log(3y+1)/(3y+1)^2]dy
y = runif(1000)
g = 3*log(3*y+1)/(3*y+1)^2
mean(g)

varcmc = var(g)/1000
#Algo for Stratified
e = exp(1)
# max of log(x)/x^2 occurs at x = sqrt(e)
# y1 = (x-1)/(sqrt(e)-1)
# x = (sqrt(e)-1)*y1 + 1
# dx = (sqrt(e)-1)dy
# Integrate (sqrt(e)-1)*log((sqrt(e)-1)*y1 + 1)/((sqrt(e)-1)*y1 + 1)^2 from 0 to 1
# y2 = (x-sqrt(e))/(4-sqrt(e))
# x = (4-sqrt(e))*y2 + sqrt(e)
# dx = (4-sqrt(e))dy
# Integrate (4-sqrt(e))*log((4-sqrt(e))*y2 + sqrt(e))/((4-sqrt(e))*y2 + sqrt(e))^2 from 0 to 1
y1 = runif(1000)
g1 = log((sqrt(e)-1)*y1 + 1)/((sqrt(e)-1)*y1 + 1)^2
y2 = runif(1000)
g2 = log((4-sqrt(e))*y2 + sqrt(e))/((4-sqrt(e))*y2 + sqrt(e))^2
mean((sqrt(e)-1)*g1 + (4-sqrt(e))*g2)

Var1 = sd(g1)
Var2 = sd(g2)
VarSum = (sqrt(e)-1)*Var1 + (4-sqrt(e))*Var2
n1 = round(1000*Var1*(sqrt(e)-1)/VarSum,0)
n2=1000-n1
n1;n2

y1 = runif(n1)
g1 = log((sqrt(e)-1)*y1 + 1)/((sqrt(e)-1)*y1 + 1)^2
y2 = runif(n2)
g2 = log((4-sqrt(e))*y2 + sqrt(e))/((4-sqrt(e))*y2 + sqrt(e))^2
mean((sqrt(e)-1)*g1)+mean((4-sqrt(e))*g2)

VarStrat = ((sqrt(e)-1)^2)*var(g1)/n1 + ((4-sqrt(e))^2)*var(g2)/n2
Efficiency = varcmc/VarStrat
Efficiency

