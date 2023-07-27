library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "claims_certified_section_94") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

claims_certified_section_94 <-
  read_excel(tf, sheet = "Data - Asy_D08", skip = 1)

# Wrangling
claims_certified_section_94 <-
  claims_certified_section_94 |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(claims_certified_section_94, overwrite = TRUE)
readr::write_csv(claims_certified_section_94, "data-raw/claims_certified_section_94.csv")
