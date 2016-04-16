library(mileageClub)

ids = readr::read_csv('data/id.csv'); ids$id_text = NULL

# 1) Update days.csv
# 2) Create a new YYYYMMDD.csv file with 'id' as the header then all the IDs of cards that
#    were turned in that day. Save this file in the data/cards/ directory. Easiest way may
#    be to copy a previous file and put in the IDs. 

# If you need to find a student's name or ID
find_name(ids)

# If you want to learn to use git, you can commit the changes to days.csv and the added files.

# 3) Now read in the cards and create the summary
cards = read_cards()
summary(cards, ids)

# 4) Create Certificates
#    a) Save appropriate certificate file on 'Certificate' tab
#    b) Click on certificates/10mile.dotx and say 'No'
#    c) Click 'Mailings' and 'Select Receipts > Use an existing list...'
#    d) Open saved file from a), most likely in Downloads
#    e) Check document and print