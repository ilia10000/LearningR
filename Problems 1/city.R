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
n=1000
data = Quint(n)
mean(data)
sd(data)
#Make data binary
data[data<3] <- 0
data[data>=3] <- 1
smean = mean(data) 	#sample mean
svar = var(data) 		#sample var
std = sqrt(svar)		#sample std deviation
error = qt(0.975, df=n-1)*std/sqrt(n) #Use T(n-1)
left = smean - error
right = smean + error
ci = c(left,right)
ci

#Let's say roads increased
Quint = function(n){
closures=NULL
#sampling n times
for (i in 1:n) 
{roadstatuses = rbinom(12,1, 0.65) #returns array of 0,1s where 0 is open and 1 is closed
A=min(roadstatuses[c(1:3,9)]) #0 if at least 1 open for city A, 1 if all closed
B=min(roadstatuses[c(3:5,10)])
C=min(roadstatuses[c(5:7,11)])
D=min(roadstatuses[c(7,8,1,12)])
E=min(roadstatuses[c(2,4,6,8,9:12)])
closures = c(closures, A+B+C+D+E) #appending sum of closed cities in sample to closures array
}
return (closures)
}
n=1000
data = Quint(n)
mean(data)
sd(data)
