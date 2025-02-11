library(tidyverse)
library(lubridate)
library(devtools)
library(readODS)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "nrm_2022_q4") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

# ---- Table 11: NRM referrals by government agency first responder, exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_govt_2022_q4_raw <-
  read_ods(tf, sheet = "Table_11", skip = 5)

nrm_referrals_govt_2022_q4 <-
  nrm_referrals_govt_2022_q4_raw |>
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
nrm_referrals_govt_2022_q4 <-
  nrm_referrals_govt_2022_q4 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 12: NRM referrals by NGO and third sector organisation first responder, exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_ngo_2022_q4_raw <-
  read_ods(tf, sheet = "Table_12", skip = 5)

nrm_referrals_ngo_2022_q4 <-
  nrm_referrals_ngo_2022_q4_raw |>
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
nrm_referrals_ngo_2022_q4 <-
  nrm_referrals_ngo_2022_q4 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 13: NRM referrals by police first responder, exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_police_2022_q4_raw <-
  read_ods(tf, sheet = "Table_13", skip = 5)

nrm_referrals_police_2022_q4 <-
  nrm_referrals_police_2022_q4_raw |>
  as_tibble() |>

  # The first row of each new type of first responder is a total - make that clear in the data
  mutate(
    `Exploitation type` = if_else(!is.na(`Police and ROCUs first responder`), "Total", `Exploitation type`),
    `Age at exploitation` = if_else(!is.na(`Police and ROCUs first responder`), "Total", `Age at exploitation`),
    `Gender` = if_else(!is.na(`Police and ROCUs first responder`), "Total", `Gender`)
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
  fill(`Police and ROCUs first responder`, `Exploitation type`, `Age at exploitation`, Gender) |>

  # Rename total row
  mutate(`Police and ROCUs first responder` = if_else(`Police and ROCUs first responder` == "Total", "Police total", `Police and ROCUs first responder`)) |>
  # filter(`Police first responder` != "Total") |>

  rename(`First responder` = `Police and ROCUs first responder`) |>
  mutate(`First responder type` = "Police") |>
  relocate(`First responder type`)

# Make nationality a single column
nrm_referrals_police_2022_q4 <-
  nrm_referrals_police_2022_q4 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 14: NRM referrals from local authority first responder by exploitation type, age at exploitation, gender and nationality ----
nrm_referrals_la_2022_q4_raw <-
  read_ods(tf, sheet = "Table_14", skip = 5)

nrm_referrals_la_2022_q4 <-
  nrm_referrals_la_2022_q4_raw |>
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
nrm_referrals_la_2022_q4 <-
  nrm_referrals_la_2022_q4 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Combine NRM referrals into a single dataframe ----
nrm_referrals_2022_q4 <-
  bind_rows(
    nrm_referrals_govt_2022_q4,
    nrm_referrals_ngo_2022_q4,
    nrm_referrals_police_2022_q4 |> filter(str_detect(`First responder`, "total")),  # Just take totals for Police
    nrm_referrals_la_2022_q4
  )

# ---- Table 26: DtN reports by nationality ----
nrm_duty_to_notify_2022_q4 <-
  read_ods(tf, sheet = "Table_26", skip = 5) |>
  as_tibble()

# ---- Save output to data/ folder ----
usethis::use_data(nrm_referrals_2022_q4, overwrite = TRUE)
readr::write_csv(nrm_referrals_2022_q4, "data-raw/nrm_referrals_2022_q4.csv")

usethis::use_data(nrm_referrals_govt_2022_q4, overwrite = TRUE)
readr::write_csv(nrm_referrals_govt_2022_q4, "data-raw/nrm_referrals_government_2022_q4.csv")

usethis::use_data(nrm_referrals_ngo_2022_q4, overwrite = TRUE)
readr::write_csv(nrm_referrals_ngo_2022_q4, "data-raw/nrm_referrals_ngo_2022_q4.csv")

usethis::use_data(nrm_referrals_police_2022_q4, overwrite = TRUE)
readr::write_csv(nrm_referrals_police_2022_q4, "data-raw/nrm_referrals_police_2022_q4.csv")

usethis::use_data(nrm_referrals_la_2022_q4, overwrite = TRUE)
readr::write_csv(nrm_referrals_la_2022_q4, "data-raw/nrm_referrals_local-authority_2022_q4.csv")

usethis::use_data(nrm_duty_to_notify_2022_q4, overwrite = TRUE)
readr::write_csv(nrm_duty_to_notify_2022_q4, "data-raw/nrm_duty_to_notify_2022_q4.csv")
