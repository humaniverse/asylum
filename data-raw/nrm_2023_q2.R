library(tidyverse)
library(lubridate)
library(devtools)
library(readODS)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "nrm_2023_q2") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".ods"))
)

# ---- Table 11: NRM referrals by government agency first responder, exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_govt_2023_q2_raw <-
  read_ods(tf, sheet = "Table_11", skip = 5)

nrm_referrals_govt_2023_q2 <-
  nrm_referrals_govt_2023_q2_raw |>
  as_tibble() |>

  # Replace dots in column names with a space
  rename_with(~str_replace_all(.x, "[\\.]+", " ")) |>

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
nrm_referrals_govt_2023_q2 <-
  nrm_referrals_govt_2023_q2 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 12: NRM referrals by NGO and third sector organisation first responder, exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_ngo_2023_q2_raw <-
  read_ods(tf, sheet = "Table_12", skip = 5)

nrm_referrals_ngo_2023_q2 <-
  nrm_referrals_ngo_2023_q2_raw |>
  as_tibble() |>

  # Replace dots in column names with a space
  rename_with(~str_replace_all(.x, "[\\.]+", " ")) |>

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
nrm_referrals_ngo_2023_q2 <-
  nrm_referrals_ngo_2023_q2 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 13: NRM referrals by police first responder, exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_police_2023_q2_raw <-
  read_ods(tf, sheet = "Table_13", skip = 5)

nrm_referrals_police_2023_q2 <-
  nrm_referrals_police_2023_q2_raw |>
  as_tibble() |>

  # Replace dots in column names with a space
  rename_with(~str_replace_all(.x, "[\\.]+", " ")) |>

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
nrm_referrals_police_2023_q2 <-
  nrm_referrals_police_2023_q2 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 14: NRM referrals from local authority first responder by exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_la_2023_q2_raw <-
  read_ods(tf, sheet = "Table_14", skip = 5)

nrm_referrals_la_2023_q2 <-
  nrm_referrals_la_2023_q2_raw |>
  as_tibble() |>

  # Replace dots in column names with a space
  rename_with(~str_replace_all(.x, "[\\.]+", " ")) |>

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
nrm_referrals_la_2023_q2 <-
  nrm_referrals_la_2023_q2 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Combine NRM referrals into a single dataframe ----
nrm_referrals_2023_q2 <-
  bind_rows(
    nrm_referrals_govt_2023_q2,
    nrm_referrals_ngo_2023_q2,
    nrm_referrals_police_2023_q2 |> filter(str_detect(`First responder`, "total")),  # Just take totals for Police
    nrm_referrals_la_2023_q2
  )

# ---- Table 26: DtN reports by nationality ----
nrm_duty_to_notify_2023_q2 <-
  read_ods(tf, sheet = "Table_35", skip = 5) |>
  as_tibble()

# ---- Save output to data/ folder ----
usethis::use_data(nrm_referrals_2023_q2, overwrite = TRUE)
readr::write_csv(nrm_referrals_2023_q2, "data-raw/nrm_referrals_2023_q2.csv")

usethis::use_data(nrm_referrals_govt_2023_q2, overwrite = TRUE)
readr::write_csv(nrm_referrals_govt_2023_q2, "data-raw/nrm_referrals_government_2023_q2.csv")

usethis::use_data(nrm_referrals_ngo_2023_q2, overwrite = TRUE)
readr::write_csv(nrm_referrals_ngo_2023_q2, "data-raw/nrm_referrals_ngo_2023_q2.csv")

usethis::use_data(nrm_referrals_police_2023_q2, overwrite = TRUE)
readr::write_csv(nrm_referrals_police_2023_q2, "data-raw/nrm_referrals_police_2023_q2.csv")

usethis::use_data(nrm_referrals_la_2023_q2, overwrite = TRUE)
readr::write_csv(nrm_referrals_la_2023_q2, "data-raw/nrm_referrals_local-authority_2023_q2.csv")

usethis::use_data(nrm_duty_to_notify_2023_q2, overwrite = TRUE)
readr::write_csv(nrm_duty_to_notify_2023_q2, "data-raw/nrm_duty_to_notify_2023_q2.csv")
