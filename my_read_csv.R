library(stringr)
library(readr)

my_read_csv = function(f) {
  d = read_csv(f)
  d$date = as.Date(str_extract(f, '[0-9]{8}'), format="%Y%m%d")
  return(d)
}