## Prediction
library(dplyr)

ids = readr::read_csv('data/id.csv'); ids$id_text = NULL
cards = read_cards()


days = read.csv('data/days.csv') %>%
  mutate(date = as.Date(date, '%m/%d/%Y'))

d = merge(cards,days) %>%
  mutate(miles=5) %>%
  group_by(id) %>%
  summarize(current_miles = sum(miles), 
            day = max(day+3)) # first cards turned in on day 4, so add 3 to day

total_days = max(d$day)
days_remaining = 7

over25 = d %>% 
  mutate(expected_miles = current_miles + current_miles/day * (days_remaining+total_days-day)) %>%
  merge(ids) 

# over25 %>% filter(expected_miles>=40, current_miles>15) %>% arrange(-expected_miles)

# over25 %>% 
#   filter(current_miles > 15) %>% 
#   arrange(-expected_miles) %>% 
#   head(20)

over25 %>%
  filter(expected_miles > 25) %>%
  group_by(grade) %>%
  summarize(n = length(id))