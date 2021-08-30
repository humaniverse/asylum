library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "outcomes") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

outcomes <-
  read_excel(tf, sheet = "Data - Asy_D04", skip = 1)

# Rename this column because R package documentation doesn't seem to like commas in column names
names(outcomes)[names(outcomes) == "Final outcomes: Refused asylum, HP, DL or other leave"] <- "Final outcomes: Refused asylum or HP or DL or other leave"

# Save output to data/ folder
usethis::use_data(outcomes, overwrite = TRUE)
readr::write_csv(outcomes, "data-raw/outcomes.csv")
