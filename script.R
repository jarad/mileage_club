library(mileageClub)

ids = readr::read_csv('data/id.csv')

# 1) Update days.csv
# 2) Create a new YYYYMMDD.csv file with 'id' as the header then all the IDs of cards that
#    were turned in that day. Save this file in the data/cards/ directory. Easiest way may
#    be to copy a previous file and put in the IDs. 

# If you need to find a student's name or ID
find_name(ids)

# 3) Now read in the cards and create the summary
cards = read_cards()
summary(cards)
