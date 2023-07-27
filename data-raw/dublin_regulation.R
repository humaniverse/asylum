library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "dublin_regulation") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

dublin_regulation <-
  read_excel(tf, sheet = "Data - Dub_D01", skip = 0)

# Wrangling
dublin_regulation <-
  dublin_regulation |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(dublin_regulation, overwrite = TRUE)
readr::write_csv(dublin_regulation, "data-raw/dublin_regulation.csv")
