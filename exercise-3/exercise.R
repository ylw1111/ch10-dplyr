# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library(fueleconomy)

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
Acura_2015 <- filter(vehicles, make == "Acura", year == 2015)
best_Acura_2015 <- filter(Acura_2015, hwy == max(hwy))
best_model_Acura_2015 <- select(best_Acura_2015, model)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
best_model_Acura_2015 <- select(
  filter(
    filter(vehicles, make == "Acura", year == 2015), hwy == max(hwy)
  ), model
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
best_model_Acura_2015 <- filter(vehicles, make == "Acura", year == 2015) %>%
  filter(hwy == max(hwy))%>%
  select(model)


### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times
first_approach <- function(){
  Acura_2015 <- filter(vehicles, make == "Acura", year == 2015)
  best_Acura_2015 <- filter(Acura_2015, hwy == max(hwy))
  best_model_Acura_2015 <- select(best_Acura_2015, model)
}

nested_approach <- function(){
  best_model_Acura_2015 <- select(
    filter(
      filter(vehicles, make == "Acura", year == 2015), hwy == max(hwy)
    ), model
  )
}

pipe_approach <- function(){
  best_model_Acura_2015 <- filter(vehicles, make == "Acura", year == 2015) %>%
    filter(hwy == max(hwy))%>%
    select(model)
}

system.time(for (i in 1:1000) first_approach())
system.time(for (i in 1:1000) nested_approach())
system.time(for (i in 1:1000) pipe_approach())