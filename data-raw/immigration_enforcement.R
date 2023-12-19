library(tidyverse)
library(lubridate)
library(devtools)
library(readODS)
library(janitor)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "immigration_enforcement") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".ods"))
)

# ---- Number of pregnant women detained in the immigration detention estate ----
detention_pregnant_women <-
  read_ods(tf, sheet = "PWD_01", skip = 5)

detention_pregnant_women <-
  detention_pregnant_women |>
  as_tibble() |>
  remove_empty() |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Year = year(Date)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date, Year) |>
  drop_na()

names(detention_pregnant_women)[4] <- "Number of pregnant women detained in the immigration detention estate"

# ---- Average cost per day to hold an individual in immigration detention ----
detention_cost_per_day <-
  read_ods(tf, sheet = "DT_02", skip = 3)

detention_cost_per_day <-
  detention_cost_per_day |>
  as_tibble() |>
  remove_empty() |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(Year = year(Date)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date, Year) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(detention_pregnant_women, overwrite = TRUE)
readr::write_csv(detention_pregnant_women, "data-raw/detention_pregnant_women.csv")

usethis::use_data(detention_cost_per_day, overwrite = TRUE)
readr::write_csv(detention_cost_per_day, "data-raw/detention_cost_per_day.csv")
