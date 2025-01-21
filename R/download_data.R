fetch_irregular_migration <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Irregular migration to the UK detailed dataset")

  irregular_migration <-
    suppressWarnings(readxl::read_excel(data_file, sheet = "Data - Irr_D01", skip = 1))

  # Wrangling
  irregular_migration <-
    irregular_migration |>
    dplyr::mutate(Date = lubridate::ceiling_date(lubridate::yq(Quarter), unit = "quarter") - lubridate::days(1)) |>
    dplyr::mutate(Quarter = lubridate::quarter(Date)) |>
    dplyr::relocate(Date) |>
    na.omit()

  irregular_migration
}

fetch_grant_rates <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Asylum applications, initial decisions and resettlement detailed datasets")

  decisions_resettlement <-
    suppressWarnings(readxl::read_excel(data_file, sheet = "Data - Asy_D02", skip = 1))

  # Wrangling
  decisions_resettlement <-
    decisions_resettlement |>
    dplyr::mutate(Date = lubridate::ceiling_date(lubridate::yq(Quarter), unit = "quarter") - lubridate::days(1)) |>
    dplyr::relocate(Date) |>

    dplyr::mutate(
      `Applicant type` = dplyr::if_else(`Applicant type` == "Dependant", "Dependant", "Main applicant"),
      `Case outcome` = dplyr::case_when(
        `Case outcome` %in% c("Non-substantiated withdrawal", "Non-Substantiated Withdrawal") ~ "Non-Substantiated Withdrawal",
        `Case outcome` %in% c("Other refusals", "Other Refusals") ~ "Other Refusals",
        `Case outcome` %in% c("Other Withdrawal", "Other withdrawal") ~ "Other Withdrawal",
        TRUE ~ `Case outcome`
      )
    ) |>

    na.omit()

  decisions_resettlement
}

fetch_awaiting_decision <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Asylum applications awaiting a decision detailed datasets")

  awaiting_decision <-
    suppressWarnings(readxl::read_excel(data_file, sheet = "Data - Asy_D03", skip = 1))

  # Wrangling
  awaiting_decision <-
    awaiting_decision |>
    dplyr::rename_with(~"Date", dplyr::starts_with("Date")) |>
    dplyr::filter(toupper(Date) != "END OF TABLE") |>
    dplyr::mutate(Date = lubridate::dmy(Date)) |>

    dplyr::mutate(
      `Applicant type` = dplyr::if_else(`Applicant type` == "Dependant", "Dependant", "Main applicant")
    )

  awaiting_decision
}

fetch_applications <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Asylum applications, initial decisions and resettlement detailed datasets")

  applications <-
    suppressWarnings(readxl::read_excel(data_file, sheet = "Data - Asy_D01", skip = 1))

  applications <-
    applications |>
    dplyr::mutate(Date = lubridate::ceiling_date(lubridate::yq(Quarter), unit = "quarter") - lubridate::days(1)) |>
    dplyr::relocate(Date) |>
    dplyr::mutate(`Applicant type` = dplyr::if_else(`Applicant type` == "Dependant", "Dependant", "Main applicant")) |>
    na.omit()

  applications
}

fetch_asylum_support <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Asylum seekers in receipt of support detailed datasets")

  support_received <-
    suppressWarnings(readxl::read_excel(data_file, sheet = "Data - Asy_D09", skip = 1))

  # Wrangling
  support_received <-
    support_received |>
    dplyr::rename_with(~"Date", dplyr::starts_with("Date")) |>
    dplyr::filter(toupper(Date) != "END OF TABLE") |>
    dplyr::mutate(Date = lubridate::dmy(Date)) |>
    dplyr::select(-dplyr::starts_with("..."))

  support_received
}

fetch_reunion <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Family reunion visa grants detailed datasets")

  family_reunion <-
    suppressWarnings(readxl::read_excel(data_file, sheet = "Data - Fam_D01", skip = 1))

  # Wrangling
  family_reunion <-
    family_reunion |>
    dplyr::mutate(Date = lubridate::ceiling_date(lubridate::yq(Quarter), unit = "quarter") - lubridate::days(1)) |>
    dplyr::mutate(Quarter = lubridate::quarter(Date)) |>
    dplyr::relocate(Date) |>
    na.omit()

  family_reunion
}
