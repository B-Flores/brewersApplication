library(tidyverse)

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

range <- seq(0.5, 0.85, by = 0.05)
range <- seq(0.8, 0.84, by = 0.001)

values <- map_dbl(.x = range, .f = ~braves_mets_sim(.x))



plot(range, values)


