library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "local_authority_resettlement") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

local_authority_resettlement <-
  read_excel(tf, sheet = "Data - Res_D01", skip = 1)

# Wrangling
local_authority_resettlement <-
  local_authority_resettlement |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(local_authority_resettlement, overwrite = TRUE)
readr::write_csv(local_authority_resettlement, "data-raw/local_authority_resettlement.csv")
