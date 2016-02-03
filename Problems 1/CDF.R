#Given a certain CDF, let's answer some questions
cdf = function(x)
{
	return (exp(-exp((1-x)/2)))
}
Neg = cdf(0) #P(X<0)
Negmax10 = cdf(0)^10 #Probability that maximum of 10 trials is negative
Posmin10 = (1-cdf(0))^10 #Probability that minimum of ten trials is positive
Posmin3by10of5 = (Posmin10^3)*((1-Posmin10)^2)*choose(5,3)#P that 5 sets of 10 trials have 3 with positive min
Posmin4by10of5 = (Posmin10^4)*((1-Posmin10))*choose(5,4)#P that 5 sets of 10 trials have 4 with positive min
Posmin5by10of5 = (Posmin10^5)#P that 5 sets of 10 trials have 5 with positive min
Posmin3ormore = Posmin3by10of5 + Posmin4by10of5 + Posmin5by10of5 
results = c(Neg,Negmax10,Posmin10,Posmin3ormore)
results