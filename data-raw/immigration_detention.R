library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "immigration_detention") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

people_entering_detention <-
  read_excel(tf, sheet = "Data - Det_D01", skip = 1)

people_in_detention <-
  read_excel(tf, sheet = "Data - Det_D02", skip = 1)

people_leaving_detention <-
  read_excel(tf, sheet = "Data - Det_D03", skip = 1)

# Wrangling
people_entering_detention <-
  people_entering_detention |>
  drop_na() |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

people_in_detention <-
  people_in_detention |>
  drop_na() |>
  rename(Date = `Date (as at…)`) |>
  mutate(Date = dmy(Date)) |>
  mutate(Year = year(Date)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date, Year, Quarter)

people_leaving_detention <-
  people_leaving_detention |>
  drop_na() |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

# Save output to data/ folder
usethis::use_data(people_entering_detention, overwrite = TRUE)
readr::write_csv(people_entering_detention, "data-raw/people_entering_detention.csv")

usethis::use_data(people_in_detention, overwrite = TRUE)
readr::write_csv(people_in_detention, "data-raw/people_in_detention.csv")

usethis::use_data(people_leaving_detention, overwrite = TRUE)
readr::write_csv(people_leaving_detention, "data-raw/people_leaving_detention.csv")
