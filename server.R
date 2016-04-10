library(shiny)

cards_per_mile = 5

source("read_cards.R")

total_miles = d %>%
  group_by(week) %>%
  summarize(cards = n()) %>%
  arrange(week) %>%
  mutate(cumulative_cards = cumsum(cards),
         cumulative_miles = cards_per_mile*cumulative_cards)

milestones = d %>%
  group_by(id, week) %>%
  summarize(total_miles = cards_per_mile*n()) %>%
  group_by(total_miles) %>%
  summarize(this_week = n()) %>%
  arrange(total_miles) %>%
  mutate(cumulative = cumsum(this_week))
  

shinyServer(function(input, output) {
  
  # display 10 rows initially
  output$ex1 = DT::renderDataTable(
    DT::datatable(read.csv("data/id.csv"), options = list(pageLength = 25))
  )
  
  output$total_miles = DT::renderDataTable(
    DT::datatable(total_miles)
  )
  
  output$milestones = DT::renderDataTable(
    DT::datatable(milestones)
  )
})
