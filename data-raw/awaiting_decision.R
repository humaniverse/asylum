library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)
library(zoo)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "awaiting_decision") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

awaiting_decision <-
  read_excel(tf, sheet = "Data - Asy_D03", skip = 1)

# Wrangling
awaiting_decision <-
  awaiting_decision |>
  rename_with(~"Date", starts_with("Date")) |>
  # rename(Date = `Date (as at…)`) |>
  filter(toupper(Date) != "END OF TABLE") |>
  mutate(Date = dmy(Date)) |>

  mutate(
    `Applicant type` = if_else(`Applicant type` == "Dependant", "Dependant", "Main applicant")
  )

# Save output to data/ folder
usethis::use_data(awaiting_decision, overwrite = TRUE)
readr::write_csv(awaiting_decision, "data-raw/awaiting_decision.csv")
