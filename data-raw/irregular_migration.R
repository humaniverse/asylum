library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)
library(zoo)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "irrgular_migration") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

# ---- Detected attempts to enter the UK irregularly ----
irregular_migration <-
  read_excel(tf, sheet = "Data - Irr_D01", skip = 1)

# Wrangling
irregular_migration <-
  irregular_migration |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# ---- Asylum applications from small boat arrivals ----
small_boat_asylum_applications <-
  read_excel(tf, sheet = "Data - Irr_D02", skip = 1)

small_boat_asylum_applications <-
  small_boat_asylum_applications |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# ---- Initial decisions on asylum applications from small boat arrivals ----
small_boat_initial_decisions <-
  read_excel(tf, sheet = "Data - Irr_D03", skip = 1)

small_boat_initial_decisions <-
  small_boat_initial_decisions |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# ---- NRM referrals from small boat arrivals ----
small_boat_NRM_referrals <-
  read_excel(tf, sheet = "Data - Irr_D04", skip = 1)

small_boat_NRM_referrals <-
  small_boat_NRM_referrals |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# ---- Outcomes of NRM referrals from small boat arrivals ----
small_boat_NRM_outcomes <-
  read_excel(tf, sheet = "Data - Irr_D05", skip = 1)

small_boat_NRM_outcomes <-
  small_boat_NRM_outcomes |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(irregular_migration, overwrite = TRUE)
readr::write_csv(irregular_migration, "data-raw/irregular_migration.csv")

usethis::use_data(small_boat_asylum_applications, overwrite = TRUE)
readr::write_csv(small_boat_asylum_applications, "data-raw/small_boat_asylum_applications.csv")

usethis::use_data(small_boat_initial_decisions, overwrite = TRUE)
readr::write_csv(small_boat_initial_decisions, "data-raw/small_boat_initial_decisions.csv")

usethis::use_data(small_boat_NRM_referrals, overwrite = TRUE)
readr::write_csv(small_boat_NRM_referrals, "data-raw/small_boat_NRM_referrals.csv")

usethis::use_data(small_boat_NRM_outcomes, overwrite = TRUE)
readr::write_csv(small_boat_NRM_outcomes, "data-raw/small_boat_NRM_outcomes.csv")
