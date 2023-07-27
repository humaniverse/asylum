library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)
library(zoo)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "age_disputes") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

age_disputes <-
  read_excel(tf, sheet = "Data - Asy_D05", skip = 1)

# Wrangling
age_disputes <-
  age_disputes |>
  drop_na() |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

# Save output to data/ folder
usethis::use_data(age_disputes, overwrite = TRUE)
readr::write_csv(age_disputes, "data-raw/age_disputes.csv")
