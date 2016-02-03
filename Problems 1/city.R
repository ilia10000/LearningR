#Some interesting logistics examples
Quint = function(n){
closures=NULL
#sampling n times
for (i in 1:n) 
{roadstatuses = rbinom(8,1, 0.65) #returns array of 0,1s where 0 is open and 1 is closed
A=min(roadstatuses[1:3]) #0 if at least 1 open for city A, 1 if all closed
B=min(roadstatuses[3:5])
C=min(roadstatuses[5:7])
D=min(roadstatuses[c(7,8,1)])
E=min(roadstatuses[c(2,4,6,8)])
closures = c(closures, A+B+C+D+E) #appending sum of closed cities in sample to closures array
}
return (closures)
}
set.seed(1)
Quint(10)
