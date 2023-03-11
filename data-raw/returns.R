library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "returns") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

returns <-
  read_excel(tf, sheet = "Data - Ret_D01", skip = 1)

returns_by_destination <-
  read_excel(tf, sheet = "Data - Ret_D02", skip = 1)

returns_offenders_by_nationality <-
  read_excel(tf, sheet = "Data - Ret_D03", skip = 1)

returns_offenders_by_destination <-
  read_excel(tf, sheet = "Data - Ret_D04", skip = 1)

# Wrangling
returns <-
  returns |>
  drop_na() |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

returns_by_destination <-
  returns_by_destination |>
  drop_na() |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

returns_offenders_by_nationality <-
  returns_offenders_by_nationality |>
  drop_na() |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

returns_offenders_by_destination <-
  returns_offenders_by_destination |>
  drop_na() |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

# Save output to data/ folder
usethis::use_data(returns, overwrite = TRUE)
readr::write_csv(returns, "data-raw/returns.csv")

usethis::use_data(returns_by_destination, overwrite = TRUE)
readr::write_csv(returns_by_destination, "data-raw/returns_by_destination.csv")

usethis::use_data(returns_offenders_by_nationality, overwrite = TRUE)
readr::write_csv(returns_offenders_by_nationality, "data-raw/returns_offenders_by_nationality.csv")

usethis::use_data(returns_offenders_by_destination, overwrite = TRUE)
readr::write_csv(returns_offenders_by_destination, "data-raw/returns_offenders_by_destination.csv")
