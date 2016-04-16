library(readr)
library(dplyr)

miles_per_card = 5

source("read_cards.R")
source("cumulative_miles_by_id.R")

cards = read_cards()
cumulative_miles = cumulative_miles_by_id(cards)

# This week's 10 mile certificates
ten_mile_certificates = cumulative_miles %>%
  filter(week==2, cumulative_miles == 10) %>%
  mutate(milestone = cumulative_miles) %>%
  merge(read_csv('data/id.csv'), by='id') %>%
  select(first, last, grade, teacher, milestone) %>%
  arrange(grade,teacher) %>%
  write_csv(path='ten_mile_certificates.csv')
  