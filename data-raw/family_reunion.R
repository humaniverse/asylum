library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)
library(zoo)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "family_reunion") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

family_reunion <-
  read_excel(tf, sheet = "Data - Fam_D01", skip = 1)

# Wrangling
family_reunion <-
  family_reunion |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(family_reunion, overwrite = TRUE)
readr::write_csv(family_reunion, "data-raw/family_reunion.csv")
