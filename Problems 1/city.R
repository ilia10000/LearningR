#Some interesting logistics examples
#Function 1
Quint = function(n)
{
cut_off_burgs = NULL
for (i in 1:n)
{
burgs = 0 
X=rbinom(8,1,0.65);
#Is burg A cut off?
if (sum(X[1:3])==3) burgs = burgs + 1
#Is burg B cut off?
if
(sum(X[3:5])==3) burgs = burgs + 1
#Is burg C cut off?
if (sum(X[5:7])==3) burgs = burgs + 1
#Is burg D cut off?
if (sum(X[c(1,7:8)])==3) burgs = burgs + 1
#Is burg E cut off?
if (sum(X[c(2,4,6,8)])==4) burgs = burgs + 1
cut_off_burgs = c(cut_off_burgs,burgs)
}
return(cut_off_burgs)
}
set.seed(1)
Quint(10)

#Function 2
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
