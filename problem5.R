library(tidyverse)

season <- c(1:12)
WAR_per_S <- c(-2.6, -1.5, -0.5, 0.2, 0.8, 1.4, 1.5, 1.4, 1.2, 0.9, 0.5, -0.1)
sd <- c(0.2, 0.7, 1.0, 1.3, 1.5, 1.7, 1.9, 2.1, 2.3, 2.4, 2.6, 2.8)
df <- data.frame(season, WAR_per_S, sd)

#Calculating P(WAR-0.05 < X < WAR+0.05)
df <- df %>% mutate(prob = pnorm(WAR_per_S+0.5, mean = WAR_per_S, sd = sd)-pnorm(WAR_per_S-0.05, mean = WAR_per_S, sd = sd)) 

playing_time <- function(p){
  if(p < 0){
    return(0)
  }else if(p>0 & p<=2){
    return(600*(p/2))
  }else{
    return(600)
  }
}

df <- df %>% 
  rowwise() %>%
  mutate(PA_unweighted = playing_time(WAR_per_S))

df <- df %>%
  mutate(PA_weighted = PA_unweighted * prob)
View(df)

#Looking at the data frame we can see that the maximum playing time occurs during 
# seasons 5 to 11

sum(df$PA_weighted) # = 264.0842 PA
