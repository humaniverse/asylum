library(tidyverse)
library(lubridate)
library(devtools)
library(readODS)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "detention_summary") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

detention_summary_flow <-
  read_ods(tf, sheet = "Det_01", skip = 1)

children_entering_detention <-
  read_ods(tf, sheet = "Det_02b", skip = 1)

detentions_deaths_and_absconds <-
  read_ods(tf, sheet = "Det_05a", skip = 1)

detentions_deaths_details <-
  read_ods(tf, sheet = "Det_05b", skip = 1)

# People entering, leaving and in detention by asylum and non-asylum
names(detention_summary_flow) <-
  str_remove(names(detention_summary_flow), " \\[.*\\]| \\[.*\\)")

detention_summary_flow <-
  detention_summary_flow |>
  as_tibble() |>
  mutate(Date = as.integer(Date)) |>
  drop_na()

# Children entering detention
children_entering_detention <-
  children_entering_detention |>
  as_tibble() |>
  mutate(`Date of entry to detention` = as.integer(`Date of entry to detention`)) |>
  drop_na()

# Deaths of persons detained under Immigration Act Powers and absconds from detention
names(detentions_deaths_and_absconds) <-
  str_remove(names(detentions_deaths_and_absconds), " \\[.*\\]| \\[.*\\)")

detentions_deaths_and_absconds <-
  detentions_deaths_and_absconds |>
  as_tibble() |>
  mutate(Year = as.integer(Year)) |>
  drop_na()

# Deaths of persons detained under Immigration Act Powers
names(detentions_deaths_details) <-
  str_remove(names(detentions_deaths_details), " \\[.*\\]| \\[.*\\)")

detentions_deaths_details <-
  detentions_deaths_details |>
  as_tibble() |>
  mutate(Year = as.integer(Year)) |>
  drop_na()

# Save output to data/ folder
usethis::use_data(detention_summary_flow, overwrite = TRUE)
readr::write_csv(detention_summary_flow, "data-raw/detention_summary_flow.csv")

usethis::use_data(children_entering_detention, overwrite = TRUE)
readr::write_csv(children_entering_detention, "data-raw/children_entering_detention.csv")

usethis::use_data(detentions_deaths_and_absconds, overwrite = TRUE)
readr::write_csv(detentions_deaths_and_absconds, "data-raw/detentions_deaths_and_absconds.csv")

usethis::use_data(detentions_deaths_details, overwrite = TRUE)
readr::write_csv(detentions_deaths_details, "data-raw/detentions_deaths_details.csv")
