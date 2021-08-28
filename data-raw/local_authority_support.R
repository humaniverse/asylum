library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "local_authority_support") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

local_authority_support <-
  read_excel(tf, sheet = "Data - Asy_D11", skip = 1)

# Wrangling
local_authority_support <-
  local_authority_support |>
  rename(Date = `Date (as at…)`) |>
  filter(Date != "End of table") |>
  mutate(Date = dmy(Date)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(local_authority_support, overwrite = TRUE)
readr::write_csv(local_authority_support, "data-raw/local_authority_support.csv")
