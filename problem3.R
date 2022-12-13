
#PART a)

#Predicted ERA values for each pitcher based on model
Pitcher1_ERA <- 5.81 - (11.7 * 0.2) + (11.4 * 0.1) # = 4.61
Pitcher2_ERA <- 5.81 - (11.7 * 0.25) + (11.4 * 0.2) # = 5.165

#What is the probability that pitcher 1's ERA is lower than pitcher 2's ERA under this model?

pnorm(5.164, mean = 4.61, sd = 1.31)


#PART b)

# I would expect the coefficient for BB% to go down if Hit By Pitches per PA were added
# since BB% is most likely directly correlated to ERA as well as the fact that HBP/PA
# is a subset of BB%. This would split the effect that BB% has on ERA into BB% and HBP%.
# We can probably safely assume that HBP/PA is also directly correlated to ERA, and would
# therefore be a positive coefficient. Therefore, if the coefficient for BB% were to go
# up with the addition of HBP/PA, then...


#PART c) 

# Create a function for the partial derivative wrt K% given a logistic regression model
# and the given coefficients

fun <- deriv(expression((exp(-2.18+(15.9*x1)-16.1*x2))/(1+exp(-2.18+(15.9*x1)-16.1*x2))), c("x1", "x2"), function.arg = TRUE)
fun(0.2, 0.1)
fun(0.25, 0.2)

# The marginal effect of K% on the probability of a pitcher's ERA being less than 4.00
# is greater for the pitcher with K% = 0.2 and BB% = 0.1. This implies that the first
# pitcher's ERA would benefit more from increasing his K% than the second pitcher based
# on this model.


#PART d)

