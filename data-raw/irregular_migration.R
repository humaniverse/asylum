library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "irrgular_migration") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

irregular_migration <-
  read_excel(tf, sheet = "Data - Irr_D01", skip = 1)

# Wrangling
irregular_migration <-
  irregular_migration |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(irregular_migration, overwrite = TRUE)
readr::write_csv(irregular_migration, "data-raw/irregular_migration.csv")
