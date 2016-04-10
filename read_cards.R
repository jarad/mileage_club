library(dplyr)
library(readr)

source("my_read_csv.R")

days = read_csv('data/days.csv') %>%
  mutate(date = as.Date(date, format='%m/%d/%Y'))

d = list.files(path = 'data/cards/', full.names = TRUE) %>% 
  lapply(my_read_csv) %>% 
  bind_rows %>%
  merge(days, by="date")
