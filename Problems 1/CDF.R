#Given a certain CDF, let's answer some questions
cdf = function(x)
{
	return (exp(-exp((1-x)/2)))
}
Neg = cdf(0) #P(X<0)
Negmax10 = cdf(0)^10 #Probability that maximum of 10 trials is negative
Posmin10 = (1-cdf(0))^10 #Probability that minimum of ten trials is positive


