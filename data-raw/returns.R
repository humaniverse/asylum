library(tidyverse)
library(lubridate)
library(devtools)
library(readODS)
library(readxl)
library(httr)

load_all()

# ---- Returns - summary data ----
query_url <-
  query_urls |>
  filter(data_set == "returns_summary") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

returns_asylum <-
  read_ods(tf, sheet = "Ret_04", skip = 1)

returns_asylum <-
  returns_asylum |>
  as_tibble() |>
  filter(!is.na(`Asylum-related nationality`))

# Split into asylum-related and non-asylum returns
returns_asylum_asy <-
  returns_asylum |>
  select(starts_with("Asylum")) |>
  mutate(Category = "Asylum-related") |>
  relocate(Category)

names(returns_asylum_asy) <- c("Category", "Nationality", "Enforced returns", "Voluntary returns", "Refused entry at port and subsequently departed")

returns_asylum_non <-
  returns_asylum |>
  select(starts_with("Non")) |>
  mutate(Category = "Non asylum-related") |>
  relocate(Category)

names(returns_asylum_non) <- c("Category", "Nationality", "Enforced returns", "Voluntary returns", "Refused entry at port and subsequently departed")

returns_asylum <-
  bind_rows(returns_asylum_asy, returns_asylum_non) |>
  filter(Nationality != "Total") |>
  mutate(Nationality = if_else(str_detect(Nationality, "^Other"), "Other", Nationality))

# ---- Details returns data ----
query_url <-
  query_urls |>
  filter(data_set == "returns") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

returns <-
  read_excel(tf, sheet = "Data - Ret_D01", skip = 1)

returns_by_destination <-
  read_excel(tf, sheet = "Data - Ret_D02", skip = 1)

returns_offenders_by_nationality <-
  read_excel(tf, sheet = "Data - Ret_D03", skip = 1)

returns_offenders_by_destination <-
  read_excel(tf, sheet = "Data - Ret_D04", skip = 1)

# Wrangling
returns <-
  returns |>
  drop_na() |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

returns_by_destination <-
  returns_by_destination |>
  drop_na() |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

returns_offenders_by_nationality <-
  returns_offenders_by_nationality |>
  drop_na() |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

returns_offenders_by_destination <-
  returns_offenders_by_destination |>
  drop_na() |>
  mutate(Date = yq(Quarter)) |>
  mutate(Quarter = quarter(Date)) |>
  relocate(Date)

# ---- Save output to data/ folder ----
usethis::use_data(returns_asylum, overwrite = TRUE)
readr::write_csv(returns_asylum, "data-raw/returns_asylum.csv")

usethis::use_data(returns, overwrite = TRUE)
readr::write_csv(returns, "data-raw/returns.csv")

usethis::use_data(returns_by_destination, overwrite = TRUE)
readr::write_csv(returns_by_destination, "data-raw/returns_by_destination.csv")

usethis::use_data(returns_offenders_by_nationality, overwrite = TRUE)
readr::write_csv(returns_offenders_by_nationality, "data-raw/returns_offenders_by_nationality.csv")

usethis::use_data(returns_offenders_by_destination, overwrite = TRUE)
readr::write_csv(returns_offenders_by_destination, "data-raw/returns_offenders_by_destination.csv")
