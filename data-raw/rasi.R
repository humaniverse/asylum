library(tidyverse)
library(lubridate)
library(devtools)
library(readODS)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "rasi") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

# No longer included in published data
# aspen <-
#   read_ods(tf, sheet = "AC_01", skip = 2)
#
# aspen_support <-
#   read_ods(tf, sheet = "AC_02", skip = 3)

nts <-
  read_ods(tf, sheet = "NTS_01", skip = 3)

support_applications_rasi <-
  read_ods(tf, sheet = "AS_01", skip = 3)

travel_documents <-
  read_ods(tf, sheet = "TD_01", skip = 3)

# Wrangling
# aspen <-
#   aspen |>
#   select(Quarter, `Aspen Cards in use`) |>
#   as_tibble() |>
#   drop_na() |>
#   mutate(Date = yq(Quarter)) |>
#   mutate(
#     Year = year(Date),
#     Quarter = quarter(Date)
#   ) |>
#   mutate(`Aspen Cards in use` = as.integer(`Aspen Cards in use`)) |>
#   relocate(Date, Year, Quarter)
#
# aspen_support <-
#   aspen_support |>
#   select(Quarter, `Home Office`, Sodexo, `Migrant Help`) |>
#   as_tibble() |>
#   drop_na() |>
#   mutate(Date = yq(Quarter)) |>
#   mutate(
#     Year = year(Date),
#     Quarter = quarter(Date)
#   ) |>
#   mutate(across(where(is.character), as.integer)) |>
#   relocate(Date, Year, Quarter)

nts <-
  nts |>
  select(Quarter:`Transfers into LA from port/intake unit`) |>
  as_tibble() |>
  drop_na() |>
  mutate(Date = yq(Quarter)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter) |>
  rename(`Able to participate in the NTS?` = `Able to participate in the NTS2`)

support_applications_rasi <-
  support_applications_rasi |>
  select(Quarter:`Section 95 (2)`) |>
  as_tibble() |>
  drop_na() |>
  mutate(Date = yq(Quarter)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter) |>
  # Remove footnote numbers from column names
  rename(
    `Section 4` = `Section 4  (1)`,
    `Section 95` = `Section 95 (2)`
  )

travel_documents <-
  travel_documents |>
  select(Quarter, `TD Raised`, `TD Despatched` = `TD Despatched 5`) |>
  as_tibble() |>
  drop_na() |>
  mutate(Quarter = if_else(Quarter == "2020 Q2  3", "2020 Q2", Quarter)) |>
  mutate(Date = yq(Quarter)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter)

# Save output to data/ folder
# usethis::use_data(aspen, overwrite = TRUE)
# readr::write_csv(aspen, "data-raw/aspen.csv")
#
# usethis::use_data(aspen_support, overwrite = TRUE)
# readr::write_csv(aspen_support, "data-raw/aspen_support.csv")

usethis::use_data(nts, overwrite = TRUE)
readr::write_csv(nts, "data-raw/nts.csv")

usethis::use_data(support_applications_rasi, overwrite = TRUE)
readr::write_csv(support_applications_rasi, "data-raw/support_applications_rasi.csv")

usethis::use_data(travel_documents, overwrite = TRUE)
readr::write_csv(travel_documents, "data-raw/travel_documents.csv")
