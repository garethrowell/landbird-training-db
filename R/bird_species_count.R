

library(tidyverse)

# setwd("./wetlands/src/VIBI-herbaceous")

# load the Survey123 data

birdobs <- read_csv("BirdObservationsThru2022_3.csv")

glimpse(birdobs)

birdobs |>
  distinct(AOUCode)




