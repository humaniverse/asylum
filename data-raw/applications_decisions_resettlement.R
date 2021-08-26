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

# Save output to data/ folder
usethis::use_data(applications, overwrite = TRUE)
readr::write_csv(applications, "data-raw/applications.csv")

usethis::use_data(decisions_resettlement, overwrite = TRUE)
readr::write_csv(decisions_resettlement, "data-raw/decisions_resettlement.csv")
