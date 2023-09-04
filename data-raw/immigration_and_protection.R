library(tidyverse)
library(lubridate)
library(devtools)
library(readxl)
library(readODS)
library(janitor)
library(httr)
library(zoo)

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
  write_disk(tf <- tempfile(fileext = ".ods"))
)

# ---- Appeal representation rate ----
appeal_representation_rate <-
  read_ods(tf, sheet = "ALAR_01", skip = 3)

names(appeal_representation_rate) <-
  c("Quarters", "All hearings (%)", "First Tier (%)", "Upper Tier (%)", "Deportation (%)")

appeal_representation_rate <-
  appeal_representation_rate |>
  janitor::remove_empty() |>
  as_tibble() |>
  drop_na() |>
  # mutate(Date = yq(Quarters)) |>
  mutate(Date = as.Date(as.yearqtr(Quarters, format = "%Y Q%q"), frac = 1)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter) |>
  select(-Quarters)

# Remove footnotes from column names
# names(appeal_representation_rate) <-
#   str_remove(names(appeal_representation_rate), "[0-9]") |>
#   str_remove(" $")

# ---- Volume of oral hearings represented by the Home Office ----
oral_hearings_volume <-
  read_ods(tf, sheet = "ALAR_01A", skip = 3)

names(oral_hearings_volume) <-
  c("Financial Year", "Asylum appeals represented at hearing (%)", "Asylum Oral Hearings", "Asylum Oral Hearings Represented by HO")

oral_hearings_volume <-
  oral_hearings_volume |>
  janitor::remove_empty() |>
  as_tibble()

# ---- Decision quality ----
decision_quality <-
  read_ods(tf, sheet = "ADQ_01A", skip = 3)

names(decision_quality) <-
  c("Financial Year", "Assurance", "Decision Quality (%)", "Number of Decisions Sampled", "Sample Size (%)")

decision_quality <-
  decision_quality |>
  janitor::remove_empty() |>
  as_tibble() |>
  fill(`Financial Year`, .direction = "down")

# Remove footnotes from column names
# names(decision_quality) <-
#   names(decision_quality) |>
#   str_remove(",") |>
#   str_remove_all("[0-9]") |>
#   str_remove(" $")

# ---- Percentage of Asylum applications processed within 6 months ----
applications_processed_in_6_months <-
  read_ods(tf, sheet = "ASY_01", skip = 2)

names(applications_processed_in_6_months) <-
  c("Quarter Application Received", "Decisions in", "Total Applications Received", "Of those Applications received the number completed within six months",
    "Of those Applications received the percentage completed within six months", "Total Male Applications Received", "Of those Male Applications received the number completed within six months",
    "Of those Male Applications received the percentage completed within six months", "Total Female Applications Received", "Of those Female Applications received the number completed within six months",
    "Of those Female Applications received the percentage completed within six months", "Total Unknown Applications Received",
    "Of those Unknown Applications received the number completed within six months", "Of those Unknown Straightforward Applications received the percentage completed within six months")

applications_processed_in_6_months <-
  applications_processed_in_6_months |>
  janitor::remove_empty() |>
  as_tibble() |>
  # mutate(Date = yq(`Quarter Application Received`)) |>
  mutate(Date = as.Date(as.yearqtr(`Quarter Application Received`, format = "%Y Q%q"), frac = 1)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter) |>
  select(-`Quarter Application Received`)

# Remove footnotes from column names
# names(applications_processed_in_6_months) <-
#   names(applications_processed_in_6_months) |>
#   str_remove(",") |>
#   str_remove(":") |>
#   str_replace("6 Months", "six months") |>
#   str_remove_all("[0-9]+") |>
#   str_trim()

# ---- Age of Asylum Operations Initial Decision Work In Progress ----
age_of_asylum_operations <-
  read_ods(tf, sheet = "ASY_02", skip = 3)

names(age_of_asylum_operations) <-
  c("Quarter", "Total", "Less than 3 months", "3-6 months", "6-12 months", "12 months+")

age_of_asylum_operations <-
  age_of_asylum_operations |>
  janitor::remove_empty() |>
  as_tibble() |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter)

# ---- Asylum work in progress ----
asylum_work_in_progress <-
  read_ods(tf, sheet = "ASY_03", skip = 3)

names(asylum_work_in_progress) <-
  c("Quarter", "Total Work In Progress", "Awaiting Initial Asylum Decision", "Post Decision", "Asylum Appeal Outstanding", "Subject to Removal Action", "On Hold", "Further Leave Application Outstanding",
    "Case Age: 0:12 Months", "Case Age: 12:24 Months", "Case Age: 24:36 Months", "Case Age: 36+ Months", "Gender: Male", "Gender: Female", "Gender: Unknown")

asylum_work_in_progress <-
  asylum_work_in_progress |>
  janitor::remove_empty() |>
  as_tibble() |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter)

# Remove footnotes from column names
# names(asylum_work_in_progress) <-
#   names(asylum_work_in_progress) |>
#   str_remove("[0-9]+$") |>
#   str_remove("[0-9]+,$") |>
#   str_remove(" $")

# ---- Breakdown of Asylum costs and productivity ----
asylum_costs_and_productivity <-
  read_ods(tf, sheet = "ASY_04", skip = 3)

asylum_costs_and_productivity <-
  asylum_costs_and_productivity |>
  janitor::remove_empty() |>
  select(-2)

names(asylum_costs_and_productivity) <-
  c("Financial Year", "Total Asylum Costs", "Asylum WIP (new method)", "Asylum WIP (old method)", "Unit Cost",
    "Total Conclusion", "Average Conclusions Per Month", "Conclusions Productivity", "Total Principal Stages Completed",
    "Average Principal Stages Completed Per Month", "Asylum Caseworking Staff", "Productivity")

asylum_costs_and_productivity <-
  asylum_costs_and_productivity |>
  # janitor::remove_empty() |>
  # select(-2) |>
  as_tibble() |>
  mutate(across(!`Financial Year`, as.numeric))

# Remove footnotes from column names
# names(asylum_costs_and_productivity) <-
#   names(asylum_costs_and_productivity) |>
#   str_remove("[0-9]+$") |>
#   str_remove("[0-9]+,$") |>
#   str_remove(" $")

# ---- Breakdown of Asylum Productivity ----
asylum_productivity_breakdown <-
  read_ods(tf, sheet = "ASY_05(M)", skip = 3)

"C:/Users/040026704/Downloads/Immigration_and_protection_Q2_2023.ods"

asylum_productivity_breakdown <-
  asylum_productivity_breakdown |>
  janitor::remove_empty()

names(asylum_productivity_breakdown) <-
  c("Month", "Initial Decisions", "Substantive Interviews", "Total Principal Stages Completed", "Asylum Caseworking Staff", "Productivity")

asylum_productivity_breakdown <-
  asylum_productivity_breakdown |>
  mutate(Date = as.Date(as.yearmon(Month, format = "%b-%y"), frac = 1)) |>
  relocate(Date) |>
  select(-Month)

# ---- NFRP - Destitution Change of Conditions Applications and Outcomes ----
nrpf_change_of_conditions_decisions <-
  read_ods(tf, sheet = "CoC_01", skip = 2)

names(nrpf_change_of_conditions_decisions) <-
  c("Quarter", "Applications Received", "Of which: Pending", "Decisions", "Of which: Accepted",
    "Of which: Rejected", "Average Days to Decision", "Acceptance Rate")

nrpf_change_of_conditions_decisions <-
  nrpf_change_of_conditions_decisions |>
  janitor::remove_empty() |>
  as_tibble() |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter) |>
  # Convert to proportion
  mutate(`Acceptance Rate` = convert_to_percent(`Acceptance Rate`))

# Remove footnotes from column names
# names(nrpf_change_of_conditions_decisions) <-
#   names(nrpf_change_of_conditions_decisions) |>
#   str_remove("[0-9]+$") |>
#   str_remove("[0-9]+,$")

# ---- NRPF - Destitution Change of Conditions Application by Age Group ----
nrpf_change_of_conditions_age <-
  read_ods(tf, sheet = "CoC_02", skip = 3)

names(nrpf_change_of_conditions_age) <-
  c("Quarter", "Under 18", "18 to 25", "26 to 30", "31 to 40", "41 to 50", "51 to 60", "61 to 70", "71 to 80", "Over 80")

nrpf_change_of_conditions_age <-
  nrpf_change_of_conditions_age |>
  janitor::remove_empty() |>
  as_tibble() |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter)

# ---- NRPF - Destitution Change of Conditions Nationality of Applicants ----
nrpf_change_of_conditions_nationality <-
  read_ods(tf, sheet = "CoC_03", skip = 3)

nrpf_change_of_conditions_nationality <-
  nrpf_change_of_conditions_nationality |>
  janitor::remove_empty() |>
  as_tibble()

names(nrpf_change_of_conditions_nationality)[1] <- "Nationality"
names(nrpf_change_of_conditions_nationality) <-
  names(nrpf_change_of_conditions_nationality) |>
  str_remove("X") |>
  str_replace("\\.", " ")

# ---- NRPF - Destitution Change of Conditions Gender of Applicants ----
nrpf_change_of_conditions_gender <-
  read_ods(tf, sheet = "CoC_04", skip = 3)

nrpf_change_of_conditions_gender <-
  nrpf_change_of_conditions_gender |>
  janitor::remove_empty() |>
  as_tibble() |>
  # mutate(Date = yq(Quarter)) |>
  mutate(Date = as.Date(as.yearqtr(Quarter, format = "%Y Q%q"), frac = 1)) |>
  mutate(
    Year = year(Date),
    Quarter = quarter(Date)
  ) |>
  relocate(Date, Year, Quarter) |>
  rename(`Recorded as Unknown` = Recorded.as.Unknown)

# ---- Save output to data/ folder ----
usethis::use_data(appeal_representation_rate, overwrite = TRUE)
readr::write_csv(appeal_representation_rate, "data-raw/appeal_representation_rate.csv")

usethis::use_data(oral_hearings_volume, overwrite = TRUE)
readr::write_csv(oral_hearings_volume, "data-raw/oral_hearings_volume.csv")

usethis::use_data(decision_quality, overwrite = TRUE)
readr::write_csv(decision_quality, "data-raw/decision_quality.csv")

usethis::use_data(applications_processed_in_6_months, overwrite = TRUE)
readr::write_csv(applications_processed_in_6_months, "data-raw/applications_processed_in_6_months.csv")

usethis::use_data(age_of_asylum_operations, overwrite = TRUE)
readr::write_csv(age_of_asylum_operations, "data-raw/age_of_asylum_operations.csv")

usethis::use_data(asylum_work_in_progress, overwrite = TRUE)
readr::write_csv(asylum_work_in_progress, "data-raw/asylum_work_in_progress.csv")

usethis::use_data(asylum_costs_and_productivity, overwrite = TRUE)
readr::write_csv(asylum_costs_and_productivity, "data-raw/asylum_costs_and_productivity.csv")

usethis::use_data(asylum_productivity_breakdown, overwrite = TRUE)
readr::write_csv(asylum_productivity_breakdown, "data-raw/asylum_productivity_breakdown.csv")

usethis::use_data(nrpf_change_of_conditions_decisions, overwrite = TRUE)
readr::write_csv(nrpf_change_of_conditions_decisions, "data-raw/nrpf_change_of_conditions_decisions.csv")

usethis::use_data(nrpf_change_of_conditions_age, overwrite = TRUE)
readr::write_csv(nrpf_change_of_conditions_age, "data-raw/nrpf_change_of_conditions_age.csv")

usethis::use_data(nrpf_change_of_conditions_nationality, overwrite = TRUE)
readr::write_csv(nrpf_change_of_conditions_nationality, "data-raw/nrpf_change_of_conditions_nationality.csv")

usethis::use_data(nrpf_change_of_conditions_gender, overwrite = TRUE)
readr::write_csv(nrpf_change_of_conditions_gender, "data-raw/nrpf_change_of_conditions_gender.csv")
