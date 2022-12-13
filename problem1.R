
#The probability of an even occurring k times over n trials is
#a randomly distributed binomial variable. We simulate this
# using rbinom() over a million iterations to estimate the 
#proportion of average successes over 165 or 50 innings given 
#the respective pitcher.

#starting pitcher simulation
sp <- rbinom(n = 1000000, size = 165, prob = 0.4) 
sp <- sp / 165

#relief pitcher simulation

rp <- rbinom(n = 1000000, size = 50, prob = 0.3)
rp <- rp / 50

#We then take the results and logically evaluate each vector
#in order to create a probability that the starting pitcher 
#outperforms the relief pitcher.

#result

result <- sp < rp
num <- sum(result, na.rm = TRUE)

num / 1000000
