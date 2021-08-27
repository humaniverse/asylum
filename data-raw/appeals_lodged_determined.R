library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "appeals_lodged_determined") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

appeals_lodged <-
  read_excel(tf, sheet = "Data - Asy_D06", skip = 1)

appeals_determined <-
  read_excel(tf, sheet = "Data - Asy_D07", skip = 1)

# Wrangling
appeals_lodged <-
  appeals_lodged |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

appeals_determined <-
  appeals_determined |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(appeals_lodged, overwrite = TRUE)
readr::write_csv(appeals_lodged, "data-raw/appeals_lodged.csv")

usethis::use_data(appeals_determined, overwrite = TRUE)
readr::write_csv(appeals_determined, "data-raw/appeals_determined.csv")
