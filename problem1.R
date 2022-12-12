
#starting pitcher simulation
sp <- rbinom(n = 1000000, size = 165, prob = 0.4) 
sp <- sp / 165

#relief pitcher simulation

rp <- rbinom(n = 1000000, size = 50, prob = 0.3)
rp <- rp / 50

#result

result <- sp < rp
num <- sum(result, na.rm = TRUE)

num / 1000000
