library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "applications_decisions_resettlement") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

applications <-
  read_excel(tf, sheet = "Data - Asy_D01", skip = 1)

decisions_resettlement <-
  read_excel(tf, sheet = "Data - Asy_D02", skip = 1)

# Wrangling
applications <-
  applications |>
  mutate(Date = yq(Quarter)) |>
  relocate(Date) |>

  mutate(
    `Applicant type` = if_else(`Applicant type` == "Dependant", "Dependant", "Main applicant")
  ) |>

  drop_na()

decisions_resettlement <-
  decisions_resettlement |>
  mutate(Date = yq(Quarter)) |>
  relocate(Date) |>

  mutate(
    `Applicant type` = if_else(`Applicant type` == "Dependant", "Dependant", "Main applicant"),
    `Case outcome` = case_when(
      `Case outcome` %in% c("Non-substantiated withdrawal", "Non-Substantiated Withdrawal") ~ "Non-Substantiated Withdrawal",
      `Case outcome` %in% c("Other refusals", "Other Refusals") ~ "Other Refusals",
      TRUE ~ `Case outcome`
    )
  ) |>

  drop_na()

# ---- Grant rates ----
# Calculate initial grant rates by nationality, year and quarter
grant_rates_initial_quarterly <-
  decisions_resettlement |>

  filter(`Case type` == "Asylum Case", `Applicant type` == "Main applicant", `Case outcome group` != "Withdrawn") |>
  mutate(`Case outcome group` = if_else(str_detect(`Case outcome group`, "Grant"), "Grant", `Case outcome group`)) |>

  group_by(Date, Year, Quarter, Nationality, Region, `Case outcome group`) |>
  summarise(Decisions = sum(Decisions)) |>
  ungroup() |>

  pivot_wider(names_from = `Case outcome group`, values_from = Decisions) |>
  mutate(`Initial grant rate` = Grant / (Grant + Refused))

# Calculate initial grant rates by nationality and year
grant_rates_initial_annual <-
  grant_rates_initial_quarterly |>
  group_by(Year, Nationality, Region) |>
  summarise(
    Grant = sum(Grant, na.rm = TRUE),
    Refused = sum(Refused, na.rm = TRUE)
  ) |>
  ungroup() |>
  mutate(`Initial grant rate` = Grant / (Grant + Refused))

# ---- Save output to data/ folder ----
usethis::use_data(applications, overwrite = TRUE)
readr::write_csv(applications, "data-raw/applications.csv")

usethis::use_data(decisions_resettlement, overwrite = TRUE)
readr::write_csv(decisions_resettlement, "data-raw/decisions_resettlement.csv")

usethis::use_data(grant_rates_initial_quarterly, overwrite = TRUE)
readr::write_csv(grant_rates_initial_quarterly, "data-raw/grant_rates_initial_quarterly.csv")

usethis::use_data(grant_rates_initial_annual, overwrite = TRUE)
readr::write_csv(grant_rates_initial_annual, "data-raw/grant_rates_initial_annual.csv")
