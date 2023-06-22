library(tidyverse)
library(lubridate)
library(devtools)
library(readODS)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "nrm_2022_q3") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

# ---- Table 10 - Details of NRM referrals by governmental first responder ----
nrm_referrals_govt_2022_q3_raw <-
  read_ods(tf, sheet = "Table_10", skip = 3)

nrm_referrals_govt_2022_q3 <-
  nrm_referrals_govt_2022_q3_raw |>
  as_tibble() |>

  select(-Var.1) |>
  rename(
    `Government agency first responder` = `First responder (government agencies)`,
    `Exploitation type` = `Claimed exploitation type`,
    `Age at exploitation` = `Age group at exploitation`
  ) |>

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
nrm_referrals_govt_2022_q3 <-
  nrm_referrals_govt_2022_q3 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 11 - Details of NRM referrals by NGO first responders ----
nrm_referrals_ngo_2022_q3_raw <-
  read_ods(tf, sheet = "Table_11", skip = 3)

nrm_referrals_ngo_2022_q3 <-
  nrm_referrals_ngo_2022_q3_raw |>
  as_tibble() |>

  select(-Var.1) |>
  rename(
    `NGO and third sector first responder` = `First Responder (NGO and Third Sector)`,
    `Exploitation type` = `Claimed exploitation type`,
    `Age at exploitation` = `Age group at exploitation`
  ) |>

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
nrm_referrals_ngo_2022_q3 <-
  nrm_referrals_ngo_2022_q3 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 12 - Details of NRM referrals by police first responders ----
nrm_referrals_police_2022_q3_raw <-
  read_ods(tf, sheet = "Table_12", skip = 3)

nrm_referrals_police_2022_q3 <-
  nrm_referrals_police_2022_q3_raw |>
  as_tibble() |>

  select(-Var.1) |>
  rename(
    `Police and ROCUs first responder` = `First responder (Police)`,
    `Exploitation type` = `Claimed exploitation type`,
    `Age at exploitation` = `Age group at exploitation`
  ) |>

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
nrm_referrals_police_2022_q3 <-
  nrm_referrals_police_2022_q3 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Table 13 - Details of NRM referrals by local authorities ----
nrm_referrals_la_2022_q3_raw <-
  read_ods(tf, sheet = "Table_13", skip = 3)

nrm_referrals_la_2022_q3 <-
  nrm_referrals_la_2022_q3_raw |>
  as_tibble() |>

  select(-Var.1) |>
  rename(
    `Exploitation type` = `Claimed exploitation type`,
    `Age at exploitation` = `Age group at exploitation`
  ) |>

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
nrm_referrals_la_2022_q3 <-
  nrm_referrals_la_2022_q3 |>
  pivot_longer(cols = -c(`First responder type`:Gender), names_to = "Nationality", values_to = "People")

# ---- Combine NRM referrals into a single dataframe ----
nrm_referrals_2022_q3 <-
  bind_rows(
    nrm_referrals_govt_2022_q3,
    nrm_referrals_ngo_2022_q3,
    nrm_referrals_police_2022_q3 |> filter(str_detect(`First responder`, "total")),  # Just take totals for Police
    nrm_referrals_la_2022_q3
  )

# ---- Table 25: DtN reports by nationality ----
nrm_duty_to_notify_2022_q3 <-
  read_ods(tf, sheet = "Table_25", skip = 3) |>
  as_tibble() |>
  select(-Var.1)

# ---- Save output to data/ folder ----
usethis::use_data(nrm_referrals_2022_q3, overwrite = TRUE)
readr::write_csv(nrm_referrals_2022_q3, "data-raw/nrm_referrals_2022_q3.csv")

usethis::use_data(nrm_referrals_govt_2022_q3, overwrite = TRUE)
readr::write_csv(nrm_referrals_govt_2022_q3, "data-raw/nrm_referrals_government_2022_q3.csv")

usethis::use_data(nrm_referrals_ngo_2022_q3, overwrite = TRUE)
readr::write_csv(nrm_referrals_ngo_2022_q3, "data-raw/nrm_referrals_ngo_2022_q3.csv")

usethis::use_data(nrm_referrals_police_2022_q3, overwrite = TRUE)
readr::write_csv(nrm_referrals_police_2022_q3, "data-raw/nrm_referrals_police_2022_q3.csv")

usethis::use_data(nrm_referrals_la_2022_q3, overwrite = TRUE)
readr::write_csv(nrm_referrals_la_2022_q3, "data-raw/nrm_referrals_local-authority_2022_q3.csv")

usethis::use_data(nrm_duty_to_notify_2022_q3, overwrite = TRUE)
readr::write_csv(nrm_duty_to_notify_2022_q3, "data-raw/nrm_duty_to_notify_2022_q3.csv")
