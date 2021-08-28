library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "appeals_non_suspensive") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

appeals_non_suspensive <-
  read_excel(tf, sheet = "Data - Asy_D08", skip = 1)

# Wrangling
appeals_non_suspensive <-
  appeals_non_suspensive |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(appeals_non_suspensive, overwrite = TRUE)
readr::write_csv(appeals_non_suspensive, "data-raw/appeals_non_suspensive.csv")
