library(tidyverse)
library(lubridate)
library(devtools)
library(readODS)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "nrm_2023_q1") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
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

# Fix mistake in original dataset where 2023 Q1 is recorded as 2022
nrm_referrals_longitudinal[826:840, "Year"] <- 2023

# ---- Table 11: NRM referrals by government agency first responder, exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_govt_2023_q1_raw <-
  read_ods(tf, sheet = "Table_11", skip = 5)

nrm_referrals_govt_2023_q1 <-
  nrm_referrals_govt_2023_q1_raw |>
  as_tibble() |>

  # The first row of each new type of first responder is a total - make that clear in the data
  mutate(
    `Exploitation type` = if_else(!is.na(`Government agency first responder`), "Total", `Exploitation type`),
    `Age at exploitation` = if_else(!is.na(`Government agency first responder`), "Total", `Age at exploitation`),
    `Gender` = if_else(!is.na(`Government agency first responder`), "Total", `Gender`)
  ) |>

  #... same for exploitation type
  mutate(
    `Age at exploitation` = if_else(!is.na(`Exploitation type`), "Total", `Age at exploitation`),
    `Gender` = if_else(!is.na(`Exploitation type`), "Total", `Gender`)
  ) |>

  #... and same for age
  mutate(
    `Gender` = if_else(!is.na(`Age at exploitation`), "Total", `Gender`)
  ) |>

  # Fill in all the other blanks
  fill(`Government agency first responder`, `Exploitation type`, `Age at exploitation`, Gender) |>

  # Rename total row
  mutate(`Government agency first responder` = if_else(`Government agency first responder` == "Total", "Government agency total", `Government agency first responder`)) |>
  # filter(`Government agency first responder` != "Total") |>

  rename(`First responder` = `Government agency first responder`) |>
  mutate(`First responder type` = "Government agency") |>
  relocate(`First responder type`)

# Make nationality a single column
nrm_referrals_govt_2023_q1 <-
  nrm_referrals_govt_2023_q1 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 12: NRM referrals by NGO and third sector organisation first responder, exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_ngo_2023_q1_raw <-
  read_ods(tf, sheet = "Table_12", skip = 5)

nrm_referrals_ngo_2023_q1 <-
  nrm_referrals_ngo_2023_q1_raw |>
  as_tibble() |>

  # The first row of each new type of first responder is a total - make that clear in the data
  mutate(
    `Exploitation type` = if_else(!is.na(`NGO and third sector first responder`), "Total", `Exploitation type`),
    `Age at exploitation` = if_else(!is.na(`NGO and third sector first responder`), "Total", `Age at exploitation`),
    `Gender` = if_else(!is.na(`NGO and third sector first responder`), "Total", `Gender`)
  ) |>

  #... same for exploitation type
  mutate(
    `Age at exploitation` = if_else(!is.na(`Exploitation type`), "Total", `Age at exploitation`),
    `Gender` = if_else(!is.na(`Exploitation type`), "Total", `Gender`)
  ) |>

  #... and same for age
  mutate(
    `Gender` = if_else(!is.na(`Age at exploitation`), "Total", `Gender`)
  ) |>

  # Fill in all the other blanks
  fill(`NGO and third sector first responder`, `Exploitation type`, `Age at exploitation`, Gender) |>

  # Rename total row
  mutate(`NGO and third sector first responder` = if_else(`NGO and third sector first responder` == "Total", "NGO and third sector total", `NGO and third sector first responder`)) |>
  # filter(`NGO and third sector first responder` != "Total") |>

  rename(`First responder` = `NGO and third sector first responder`) |>
  mutate(`First responder type` = "NGO and third sector") |>
  relocate(`First responder type`)

# Make nationality a single column
nrm_referrals_ngo_2023_q1 <-
  nrm_referrals_ngo_2023_q1 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 13: NRM referrals by police first responder, exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_police_2023_q1_raw <-
  read_ods(tf, sheet = "Table_13", skip = 5)

nrm_referrals_police_2023_q1 <-
  nrm_referrals_police_2023_q1_raw |>
  as_tibble() |>

  # The first row of each new type of first responder is a total - make that clear in the data
  mutate(
    `Exploitation type` = if_else(!is.na(`Police first responder`), "Total", `Exploitation type`),
    `Age at exploitation` = if_else(!is.na(`Police first responder`), "Total", `Age at exploitation`),
    `Gender` = if_else(!is.na(`Police first responder`), "Total", `Gender`)
  ) |>

  #... same for exploitation type
  mutate(
    `Age at exploitation` = if_else(!is.na(`Exploitation type`), "Total", `Age at exploitation`),
    `Gender` = if_else(!is.na(`Exploitation type`), "Total", `Gender`)
  ) |>

  #... and same for age
  mutate(
    `Gender` = if_else(!is.na(`Age at exploitation`), "Total", `Gender`)
  ) |>

  # Fill in all the other blanks
  fill(`Police first responder`, `Exploitation type`, `Age at exploitation`, Gender) |>

  # Rename total row
  mutate(`Police first responder` = if_else(`Police first responder` == "Total", "Police total", `Police first responder`)) |>
  # filter(`Police first responder` != "Total") |>

  rename(`First responder` = `Police first responder`) |>
  mutate(`First responder type` = "Police") |>
  relocate(`First responder type`)

# Make nationality a single column
nrm_referrals_police_2023_q1 <-
  nrm_referrals_police_2023_q1 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 14: NRM referrals from local authority first responder by exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_la_2023_q1_raw <-
  read_ods(tf, sheet = "Table_14", skip = 5)

nrm_referrals_la_2023_q1 <-
  nrm_referrals_la_2023_q1_raw |>
  as_tibble() |>

  # The first row of each new type of exploitation type is a total - make that clear in the data
  mutate(
    `Age at exploitation` = if_else(!is.na(`Exploitation type`), "Total", `Age at exploitation`),
    `Gender` = if_else(!is.na(`Exploitation type`), "Total", `Gender`)
  ) |>

  #... and same for age
  mutate(
    `Gender` = if_else(!is.na(`Age at exploitation`), "Total", `Gender`)
  ) |>

  # Fill in all the other blanks
  fill(`Exploitation type`, `Age at exploitation`, Gender) |>

  mutate(
    `First responder type` = "Local Authority",
    `First responder` = "Local Authority"
  ) |>
  relocate(`First responder type`, `First responder`) |>

  # Rename total row
  mutate(`First responder` = if_else(`Exploitation type` == "Total", "Local Authority total", `First responder`))

# Make nationality a single column
nrm_referrals_la_2023_q1 <-
  nrm_referrals_la_2023_q1 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Combine NRM referrals into a single dataframe ----
nrm_referrals_2023_q1 <-
  bind_rows(
    nrm_referrals_govt_2023_q1,
    nrm_referrals_ngo_2023_q1,
    nrm_referrals_police_2023_q1 |> filter(str_detect(`First responder`, "total")),  # Just take totals for Police
    nrm_referrals_la_2023_q1
  )

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

# ---- Table 19: NRM conclusive grounds decisions made by both competent authorities by quarter, outcome and age at exploitation ----
nrm_conclusive_grounds_raw <-
  read_ods(tf, sheet = "Table_19", skip = 6)

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

# ---- Table 26: DtN reports by nationality ----
nrm_duty_to_notify_2023_q1 <-
  read_ods(tf, sheet = "Table_26", skip = 5) |>
  as_tibble()

# ---- Table 25: DtN reports by quarter ----
nrm_duty_to_notify_longitudinal <-
  read_ods(tf, sheet = "Table_25", skip = 5) |>
  as_tibble()

nrm_duty_to_notify_longitudinal <-
  nrm_duty_to_notify_longitudinal |>
  fill(Year) |>
  filter(!is.na(Quarter))

# ---- Save output to data/ folder ----
usethis::use_data(nrm_referrals_longitudinal, overwrite = TRUE)
readr::write_csv(nrm_referrals_longitudinal, "data-raw/nrm_referrals_longitudinal.csv")

usethis::use_data(nrm_referrals_2023_q1, overwrite = TRUE)
readr::write_csv(nrm_referrals_2023_q1, "data-raw/nrm_referrals_2023_q1.csv")

usethis::use_data(nrm_referrals_govt_2023_q1, overwrite = TRUE)
readr::write_csv(nrm_referrals_govt_2023_q1, "data-raw/nrm_referrals_government_2023_q1.csv")

usethis::use_data(nrm_referrals_ngo_2023_q1, overwrite = TRUE)
readr::write_csv(nrm_referrals_ngo_2023_q1, "data-raw/nrm_referrals_ngo_2023_q1.csv")

usethis::use_data(nrm_referrals_police_2023_q1, overwrite = TRUE)
readr::write_csv(nrm_referrals_police_2023_q1, "data-raw/nrm_referrals_police_2023_q1.csv")

usethis::use_data(nrm_referrals_la_2023_q1, overwrite = TRUE)
readr::write_csv(nrm_referrals_la_2023_q1, "data-raw/nrm_referrals_local-authority_2023_q1.csv")

usethis::use_data(nrm_reasonable_grounds, overwrite = TRUE)
readr::write_csv(nrm_reasonable_grounds, "data-raw/nrm_reasonable_grounds.csv")

usethis::use_data(nrm_conclusive_grounds, overwrite = TRUE)
readr::write_csv(nrm_conclusive_grounds, "data-raw/nrm_conclusive_grounds.csv")

usethis::use_data(nrm_duty_to_notify_2023_q1, overwrite = TRUE)
readr::write_csv(nrm_duty_to_notify_2023_q1, "data-raw/nrm_duty_to_notify_2023_q1.csv")

usethis::use_data(nrm_duty_to_notify_longitudinal, overwrite = TRUE)
readr::write_csv(nrm_duty_to_notify_longitudinal, "data-raw/nrm_duty_to_notify_longitudinal.csv")
