#Algorithm for CMC
# y = (x-1)/(4-1) = (x-1)/3
# x = 3y + 1
# dx = 3dy
# New integral is from 0 to 1 of [3ln(3y+1)/(3y+1)^2]dy
y = runif(1000)
g = 3*log(3*y+1)/(3*y+1)^2
mean(g)

