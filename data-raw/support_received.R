library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "support_received") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

support_received <-
  read_excel(tf, sheet = "Data - Asy_D09", skip = 1)

# Wrangling
support_received <-
  support_received |>
  rename(Date = `Date (as at…)`) |>
  filter(toupper(Date) != "END OF TABLE") |>
  mutate(Date = dmy(Date)) |>
  select(-starts_with("..."))

# Save output to data/ folder
usethis::use_data(support_received, overwrite = TRUE)
readr::write_csv(support_received, "data-raw/support_received.csv")
