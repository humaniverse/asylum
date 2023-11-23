library(tidyverse)
library(lubridate)
library(devtools)
library(readODS)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "nrm_2023_q3") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".ods"))
)

# ---- Table 2: NRM referrals by quarter by age at exploitation and location of exploitation ----
nrm_referrals_longitudinal <-
  read_ods(tf, sheet = "Table_2", skip = 6)

names(nrm_referrals_longitudinal) <- c(
  "Year",
  "Quarter",

  "Adult (18 or over) - Overseas",
  "Adult (18 or over) - UK",
  "Adult (18 or over) - UK and Overseas",
  "Adult (18 or over) - Not specified or unknown",
  "Adult (18 or over) - Total",

  "Child (17 or under) - Overseas",
  "Child (17 or under) - UK",
  "Child (17 or under) - UK and Overseas",
  "Child (17 or under) - Not specified or unknown",
  "Child (17 or under) - Total",

  "Age not specified or unknown - Overseas",
  "Age not specified or unknown - UK",
  "Age not specified or unknown - UK and Overseas",
  "Age not specified or unknown - Not specified or unknown",
  "Age not specified or unknown - Total",

  "Total"
)

nrm_referrals_longitudinal <-
  nrm_referrals_longitudinal |>
  as_tibble() |>
  select(-Total) |>
  fill(Year) |>
  filter(!is.na(Quarter)) |>

  pivot_longer(cols = -c(Year:Quarter), names_to = "AgeLocation", values_to = "NRM referrals") |>
  separate_wider_delim(AgeLocation, delim = " - ", names = c("Age at exploitation", "Location of exploitation"))

# Fix mistake in original dataset where 2023 q2 is recorded as 2022
nrm_referrals_longitudinal[826:nrow(nrm_referrals_longitudinal), "Year"] <- 2023

# ---- Table 16: NRM reasonable grounds decisions made by both competent authorities by quarter, outcome and age at exploitation ----
nrm_reasonable_grounds_raw <-
  read_ods(tf, sheet = "Table_16", skip = 6)

names(nrm_reasonable_grounds_raw) <- c(
  "Year",
  "Quarter",
  "Adult (18 or over) - Negative reasonable grounds",
  "Adult (18 or over) - Positive reasonable grounds",
  "Adult (18 or over) - Total",
  "Child (17 or under) - Negative reasonable grounds",
  "Child (17 or under) - Positive reasonable grounds",
  "Child (17 or under) - Total",
  "Age not specified or unknown - Negative reasonable grounds",
  "Age not specified or unknown - Positive reasonable grounds",
  "Age not specified or unknown - Total",
  "Total"
)

nrm_reasonable_grounds <-
  nrm_reasonable_grounds_raw |>
  as_tibble() |>

  # The first row of each year is a total - make that clear in the data
  mutate(
    Quarter = if_else(!is.na(Year), "Total", Quarter)
  ) |>

  fill(Year)

# ---- Table 28: NRM conclusive grounds decisions made by both competent authorities by quarter, outcome and age at exploitation ----
nrm_conclusive_grounds_raw <-
  read_ods(tf, sheet = "Table_28", skip = 6)

names(nrm_conclusive_grounds_raw) <- c(
  "Year",
  "Quarter",
  "Adult (18 or over) - Negative conclusive grounds",
  "Adult (18 or over) - Positive conclusive grounds",
  "Adult (18 or over) - Total",
  "Child (17 or under) - Negative conclusive grounds",
  "Child (17 or under) - Positive conclusive grounds",
  "Child (17 or under) - Total",
  "Age not specified or unknown - Negative conclusive grounds",
  "Age not specified or unknown - Positive conclusive grounds",
  "Age not specified or unknown - Total",
  "Total"
)

nrm_conclusive_grounds <-
  nrm_conclusive_grounds_raw |>
  as_tibble() |>

  # The first row of each year is a total - make that clear in the data
  mutate(
    Quarter = if_else(!is.na(Year), "Total", Quarter)
  ) |>
  fill(Year)

# ---- Table 40: DtN reports by quarter ----
nrm_duty_to_notify_longitudinal <-
  read_ods(tf, sheet = "Table_40", skip = 5) |>
  as_tibble()

nrm_duty_to_notify_longitudinal <-
  nrm_duty_to_notify_longitudinal |>
  # The first row of each year is a total - make that clear in the data
  mutate(
    Quarter = if_else(!is.na(Year), "Total", Quarter)
  ) |>
  fill(Year) |>
  filter(!is.na(Quarter))

# ---- Save output to data/ folder ----
usethis::use_data(nrm_referrals_longitudinal, overwrite = TRUE)
readr::write_csv(nrm_referrals_longitudinal, "data-raw/nrm_referrals_longitudinal.csv")

usethis::use_data(nrm_reasonable_grounds, overwrite = TRUE)
readr::write_csv(nrm_reasonable_grounds, "data-raw/nrm_reasonable_grounds.csv")

usethis::use_data(nrm_conclusive_grounds, overwrite = TRUE)
readr::write_csv(nrm_conclusive_grounds, "data-raw/nrm_conclusive_grounds.csv")

usethis::use_data(nrm_duty_to_notify_longitudinal, overwrite = TRUE)
readr::write_csv(nrm_duty_to_notify_longitudinal, "data-raw/nrm_duty_to_notify_longitudinal.csv")
