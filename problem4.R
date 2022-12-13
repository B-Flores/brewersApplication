library(tidyverse)

# This function (taking in p as an argument) simulates the last three series for the Mets and Braves. 
# This simulation assumes that the braves have 9 games left and the mets have 8 games left. The probability 
# of the braves winning the division is simulating using randomly distributed binomial variables defined by the 
# values above and evaluated logically as "braves_win_div" given each case that this is possible. The results 
# are summed up and averaged over 1 million iterations and returned as a percentage.

braves_mets_sim <- function(p){
  braves_mets <- rbinom(1000000, 3, 0.5)
  mets_braves <- 3 - braves_mets

  braves_other <- rbinom(1000000, 6, p)
  mets_other <- rbinom(1000000, 5, 0.5)

  braves_total <- braves_mets + braves_other + 95
  mets_total <- mets_other + mets_braves + 97

  braves_win_div <- (braves_total > mets_total) | ((braves_total == mets_total) & braves_mets == 3)

  return(sum(braves_win_div, na.rm = TRUE) / 1000000)
}

#An initial range of values for p is defined to pass into the simulation. This narrows down the 
# range that would result in a win % of 0.5.

range <- seq(0.5, 0.85, by = 0.05)
range2 <- seq(0.8, 0.84, by = 0.001)

values <- map_dbl(.x = range2, .f = ~braves_mets_sim(.x))


# We plot the Projected Prob of Winning the division over the range of values for P 
# and estimate an approximate answer given the graph 

plot(range2, values, xlab = "Values for p", ylab = "Projected Chance of Winning Division")
abline(h=0.5,col="blue")
abline( v=0.8285, col = "red")

