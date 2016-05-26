library(dplyr)

check_names = function(YYYYMMDD) {
  read.csv(paste0("data/cards/",YYYYMMDD,".csv")) %>%
    left_join(read.csv("data/id.csv"), by="id") %>%
    select(id,last,first,grade,teacher)
}

check_names("20160523")
