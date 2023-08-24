library(tidyverse)
library(lubridate)
library(devtools)
library(readODS)
library(httr)

load_all()

query_url <-
  query_urls |>
  filter(data_set == "asylum_summary") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".ods"))
)

# ---- Cases considered under inadmissibility rules, 1 January 2021 - 30 September 2022 ----
inadmissibility_cases_considered <-
  read_ods(tf, sheet = "Asy_09a", skip = 1)

inadmissibility_cases_considered <-
  inadmissibility_cases_considered |>
  # Only keep relevant rows
  slice(1:5) |>
  as_tibble() |>

  # Reshape the data
  select(-Total) |>
  rename(Stage = Date) |>
  pivot_longer(cols = -Stage, names_to = "Date", values_to = "Cases") |>

  # Separate 'Date' column into separate 'Quarter' and 'Year' columns, then calculate a lubridate Date
  separate_wider_delim(Date, ".", names = c("Quarter", "Year")) |>
  # mutate(Date = yq(paste(Year, Quarter))) |>
  mutate(Date = as.Date(as.yearqtr(paste(Year, Quarter), format = "%Y Q%q"), frac = 1)) |>

  relocate(Date, Quarter, Year) |>

  mutate(Stage = if_else(str_detect(Stage, "Removals"), "Removals", Stage))

# ---- Notices of intent issued, by nationality ----
notices_of_intent <-
  read_ods(tf, sheet = "Asy_09b", skip = 1)

notices_of_intent <-
  notices_of_intent |>
  slice(1:11) |>
  as_tibble()

# ---- Save output to data/ folder ----
usethis::use_data(inadmissibility_cases_considered, overwrite = TRUE)
readr::write_csv(inadmissibility_cases_considered, "data-raw/inadmissibility_cases_considered.csv")

usethis::use_data(notices_of_intent, overwrite = TRUE)
readr::write_csv(notices_of_intent, "data-raw/notices_of_intent.csv")
