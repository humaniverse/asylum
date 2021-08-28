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

# Save output to data/ folder
usethis::use_data(outcomes, overwrite = TRUE)
readr::write_csv(outcomes, "data-raw/outcomes.csv")
