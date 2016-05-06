MNTL_new = function(n)
{
  #n is the number of iterations.  If n=1 then MNTL lost power one time.
  #  IF n=2 then MNTL loses power twice.  
  
  L = NULL  #An empty output vector containing the lifetimes from 1 to n.
  counter = 0
  for (i in 1:n)
  {
    T = rexp(8,1/20)  #Lives of our 8 trans. lines.
    
    # MNTL
    P1 = min(T[1],T[2],T[7])
    P2 = min(T[1:4],T[8])
    P3 = min(T[1],T[5:6],T[8])
    P4 = min(T[1],T[3:7])
    P5 = min(T[5],T[8])
    P6 = min(T[2:4],T[6],T[8])
    P7 = min(T[6],T[2],T[7])
    P8 = min(T[3:5],T[7])
    
    #print(T[5])
    #print(T[6])
    
    

    life = max(P1,P2,P3,P4,P5,P6,P7,P8)
    #Chateau
    if (max(T[5],T[6])<=life){
    counter = counter + 1
    }
    L = c(L,life)
    
  }  #end the for loop
  
  return(counter)  #return the lifetimes!
  
}  #end the function
proportions = NULL
for(i in 1:100){
proportions = c(proportions,MNTL_new(100)/100)
}
estimate = mean(proportions)
SE = sd(proportions)/10
c(estimate - 1.96*SE, estimate + 1.96*SE)

