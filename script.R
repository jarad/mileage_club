library(dplyr)
library(mileageClub)

cards = read_cards()
ids = readr::read_csv('data/id.csv')

summary(cards, ids)

