library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "support_applications") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

support_applications <-
  read_excel(tf, sheet = "Data - Asy_D10", skip = 1)

# Wrangling
support_applications <-
  support_applications |>
  mutate(`Group type` = if_else(tolower(`Group type`) == "single adult", "Single adult", `Group type`)) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(support_applications, overwrite = TRUE)
readr::write_csv(support_applications, "data-raw/support_applications.csv")
