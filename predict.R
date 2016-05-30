## Prediction
library(dplyr)

ids = readr::read_csv('data/id.csv'); ids$id_text = NULL
cards = read_cards() %>%
  filter(date < as.Date("2016-05-06"))


days = read.csv('data/days.csv') %>%
  mutate(date = as.Date(date, '%m/%d/%Y'))

d = merge(cards,days) %>%
  mutate(miles=5) %>%
  group_by(id) %>%
  summarize(current_miles = sum(miles), 
            
            # day is the last day a card was turned in
            # but day 1 is really the 4th day, so add 3
            
            day = max(day) + 3,
            
            # subtract 1/2 from day because the card could 
            # have been turned in any time that day
            
            rate = current_miles/(day-0.5)
            ) 

total_days = max(d$day)
days_remaining = 8

prob = function(current_miles, rate, day, days_remaining, target_miles=25) {
  if (current_miles>=target_miles) return(1)
  
  1-ppois(25-current_miles, rate*(total_days-day+days_remaining))
}

d = d %>% 
  group_by(id) %>%
  mutate(prob = prob(current_miles, rate, day, days_remaining, 25)) %>%
  merge(ids)


over25 = d %>%
  group_by(grade) %>% # or by t-shirt size
  summarize(n = sum(prob))

round(over25)
