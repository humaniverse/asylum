library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(janitor)
library(httr)

# Helper function
convert_to_percent <- function(x) {
  x <- str_remove(x, "%")
  x <- as.integer(x)
  x <- x / 100
  x
}

load_all()

query_url <-
  query_urls |>
  filter(data_set == "immigration_and_protection") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile())
)

# ---- Appeal representation rate ----
appeal_representation_rate <-
  read_excel(tf, sheet = "ALAR_01", skip = 3)

appeal_representation_rate <-
  appeal_representation_rate |>
  janitor::remove_empty() |>
  as_tibble() |>
  drop_na() |>
  mutate(Date = yq(Quarters)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter) |>
  select(-Quarters)

# Remove footnotes from column names
names(appeal_representation_rate) <-
  str_remove(names(appeal_representation_rate), "[0-9]") |>
  str_remove(" $")

# ---- Volume of oral hearings represented by the Home Office ----
oral_hearings_volume <-
  read_excel(tf, sheet = "ALAR_01A", skip = 3)

oral_hearings_volume <-
  oral_hearings_volume |>
  janitor::remove_empty() |>
  as_tibble()

# ---- Decision quality ----
decision_quality <-
  read_excel(tf, sheet = "ADQ_01A", skip = 3)

names(decision_quality)[2] = "Assurance"

decision_quality <-
  decision_quality |>
  janitor::remove_empty() |>
  as_tibble() |>
  fill(`Financial Year`, .direction = "down")

# Remove footnotes from column names
names(decision_quality) <-
  names(decision_quality) |>
  str_remove(",") |>
  str_remove_all("[0-9]") |>
  str_remove(" $")

# ---- Percentage of Asylum applications processed within 6 months ----
applications_proccessed_in_6_months <-
  read_excel(tf, sheet = "Asy_01", skip = 3)

applications_proccessed_in_6_months <-
  applications_proccessed_in_6_months |>
  janitor::remove_empty() |>
  as_tibble() |>
  mutate(Date = yq(`Quarter Application Received`)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter) |>
  select(-`Quarter Application Received`)

# Remove footnotes from column names
names(applications_proccessed_in_6_months) <-
  names(applications_proccessed_in_6_months) |>
  str_remove(",") |>
  str_remove(":") |>
  str_replace("6 Months", "six months") |>
  str_remove_all("[0-9]+") |>
  str_remove(" $")

# ---- Age of Asylum Operations Initial Decision Work In Progress ----
age_of_asylum_operations <-
  read_excel(tf, sheet = "ASY_02", skip = 4)

age_of_asylum_operations <-
  age_of_asylum_operations |>
  janitor::remove_empty() |>
  as_tibble() |>
  mutate(Date = yq(Quarter)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter)

# ---- Asylum work in progress ----
asylum_work_in_progress <-
  read_excel(tf, sheet = "Asy_03", skip = 3)

asylum_work_in_progress <-
  asylum_work_in_progress |>
  janitor::remove_empty() |>
  as_tibble() |>
  mutate(Date = yq(Quarter)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter)

# Remove footnotes from column names
names(asylum_work_in_progress) <-
  names(asylum_work_in_progress) |>
  str_remove("[0-9]+$") |>
  str_remove("[0-9]+,$") |>
  str_remove(" $")

# ---- Breakdown of Asylum costs and productivity ----
asylum_costs_and_productivity <-
  read_excel(tf, sheet = "Asy_04", skip = 3)

asylum_costs_and_productivity <-
  asylum_costs_and_productivity |>
  janitor::remove_empty() |>
  select(-2) |>
  as_tibble() |>
  mutate(across(!`Financial Year`, as.numeric))

# Remove footnotes from column names
names(asylum_costs_and_productivity) <-
  names(asylum_costs_and_productivity) |>
  str_remove("[0-9]+$") |>
  str_remove("[0-9]+,$") |>
  str_remove(" $")

# ---- NFRP - Destitution Change of Conditions Applications and Outcomes ----
nrpf_change_of_conditions_decisions <-
  read_excel(tf, sheet = "CoC_01", skip = 2)

nrpf_change_of_conditions_decisions <-
  nrpf_change_of_conditions_decisions |>
  janitor::remove_empty() |>
  as_tibble() |>
  mutate(Date = yq(Quarter)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter) |>
  # Convert to proportion
  mutate(`Acceptance Rate5` = convert_to_percent(`Acceptance Rate5`))

# Remove footnotes from column names
names(nrpf_change_of_conditions_decisions) <-
  names(nrpf_change_of_conditions_decisions) |>
  str_remove("[0-9]+$") |>
  str_remove("[0-9]+,$")

# ---- NRPF - Destitution Change of Conditions Application by Age Group ----
nrpf_change_of_conditions_age <-
  read_excel(tf, sheet = "CoC_02", skip = 3)

nrpf_change_of_conditions_age <-
  nrpf_change_of_conditions_age |>
  janitor::remove_empty() |>
  as_tibble() |>
  mutate(Date = yq(Quarter)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter)

# ---- NRPF - Destitution Change of Conditions Nationality of Applicants ----
nrpf_change_of_conditions_nationality <-
  read_excel(tf, sheet = "CoC_03", skip = 3)

nrpf_change_of_conditions_nationality <-
  nrpf_change_of_conditions_nationality |>
  janitor::remove_empty() |>
  as_tibble()

# ---- NRPF - Destitution Change of Conditions Gender of Applicants ----
nrpf_change_of_conditions_gender <-
  read_excel(tf, sheet = "CoC_04", skip = 3)

nrpf_change_of_conditions_gender <-
  nrpf_change_of_conditions_gender |>
  janitor::remove_empty() |>
  as_tibble() |>
  mutate(Date = yq(Quarter)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter)

# ---- Save output to data/ folder ----
usethis::use_data(appeal_representation_rate, overwrite = TRUE)
readr::write_csv(appeal_representation_rate, "data-raw/appeal_representation_rate.csv")

usethis::use_data(oral_hearings_volume, overwrite = TRUE)
readr::write_csv(oral_hearings_volume, "data-raw/oral_hearings_volume.csv")

usethis::use_data(decision_quality, overwrite = TRUE)
readr::write_csv(decision_quality, "data-raw/decision_quality.csv")

usethis::use_data(applications_proccessed_in_6_months, overwrite = TRUE)
readr::write_csv(applications_proccessed_in_6_months, "data-raw/applications_proccessed_in_6_months.csv")

usethis::use_data(age_of_asylum_operations, overwrite = TRUE)
readr::write_csv(age_of_asylum_operations, "data-raw/age_of_asylum_operations.csv")

usethis::use_data(asylum_work_in_progress, overwrite = TRUE)
readr::write_csv(asylum_work_in_progress, "data-raw/asylum_work_in_progress.csv")

usethis::use_data(asylum_costs_and_productivity, overwrite = TRUE)
readr::write_csv(asylum_costs_and_productivity, "data-raw/asylum_costs_and_productivity.csv")

usethis::use_data(nrpf_change_of_conditions_decisions, overwrite = TRUE)
readr::write_csv(nrpf_change_of_conditions_decisions, "data-raw/nrpf_change_of_conditions_decisions.csv")

usethis::use_data(nrpf_change_of_conditions_age, overwrite = TRUE)
readr::write_csv(nrpf_change_of_conditions_age, "data-raw/nrpf_change_of_conditions_age.csv")

usethis::use_data(nrpf_change_of_conditions_nationality, overwrite = TRUE)
readr::write_csv(nrpf_change_of_conditions_nationality, "data-raw/nrpf_change_of_conditions_nationality.csv")

usethis::use_data(nrpf_change_of_conditions_gender, overwrite = TRUE)
readr::write_csv(nrpf_change_of_conditions_gender, "data-raw/nrpf_change_of_conditions_gender.csv")
