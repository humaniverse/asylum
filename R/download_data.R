#' Load latest data on irregular migration
#' @returns A tibble containing the wrangled data
#' @export
fetch_irregular_migration <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Irregular migration to the UK detailed dataset")

  irregular_migration <-
    suppressWarnings(read_excel(data_file, sheet = "Data - Irr_D01", skip = 1))

  # Wrangling
  irregular_migration <-
    irregular_migration |>
    mutate(Date = ceiling_date(yq(Quarter), unit = "quarter") - days(1)) |>
    mutate(Quarter = quarter(Date)) |>
    relocate(Date) |>
    na.omit()

  irregular_migration
}

#' Load latest data on initial decisions
#' @returns A tibble containing the wrangled data
#' @export
fetch_decisions <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Asylum applications, initial decisions and resettlement detailed datasets")

  decisions_resettlement <-
    suppressWarnings(read_excel(data_file, sheet = "Data - Asy_D02", skip = 1))

  # Wrangling
  decisions_resettlement <-
    decisions_resettlement |>
    mutate(Date = ceiling_date(yq(Quarter), unit = "quarter") - days(1)) |>
    relocate(Date) |>

    mutate(
      `Applicant type` = if_else(`Applicant type` == "Dependant", "Dependant", "Main applicant"),
      `Case outcome` = case_when(
        `Case outcome` %in% c("Non-substantiated withdrawal", "Non-Substantiated Withdrawal") ~ "Non-Substantiated Withdrawal",
        `Case outcome` %in% c("Other refusals", "Other Refusals") ~ "Other Refusals",
        `Case outcome` %in% c("Other Withdrawal", "Other withdrawal") ~ "Other Withdrawal",
        TRUE ~ `Case outcome`
      )
    ) |>

    na.omit()

  decisions_resettlement
}

#' Load latest data on people awaiting a decision on their asylum claim
#' @returns A tibble containing the wrangled data
#' @export
fetch_awaiting_decision <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Asylum applications awaiting a decision detailed datasets")

  awaiting_decision <-
    suppressWarnings(read_excel(data_file, sheet = "Data - Asy_D03", skip = 1))

  # Wrangling
  awaiting_decision <-
    awaiting_decision |>
    rename_with(~"Date", starts_with("Date")) |>
    filter(toupper(Date) != "END OF TABLE") |>
    mutate(Date = dmy(Date)) |>

    mutate(
      `Applicant type` = if_else(`Applicant type` == "Dependant", "Dependant", "Main applicant")
    )

  awaiting_decision
}

#' Load latest data on asylum applications
#' @returns A tibble containing the wrangled data
#' @export
fetch_applications <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Asylum applications, initial decisions and resettlement detailed datasets")

  applications <-
    suppressWarnings(read_excel(data_file, sheet = "Data - Asy_D01", skip = 1))

  applications <-
    applications |>
    mutate(Date = ceiling_date(yq(Quarter), unit = "quarter") - days(1)) |>
    relocate(Date) |>
    mutate(`Applicant type` = if_else(`Applicant type` == "Dependant", "Dependant", "Main applicant")) |>
    na.omit()

  applications
}

#' Load latest data on people receiving asylum support
#' @returns A tibble containing the wrangled data
#' @export
fetch_asylum_support <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Asylum seekers in receipt of support detailed datasets")

  support_received <-
    suppressWarnings(read_excel(data_file, sheet = "Data - Asy_D09", skip = 1))

  # Wrangling
  support_received <-
    support_received |>
    rename_with(~"Date", starts_with("Date")) |>
    filter(toupper(Date) != "END OF TABLE") |>
    mutate(Date = dmy(Date)) |>
    select(-starts_with("..."))

  support_received
}

#' Load latest data on family reunion visa grants
#' @returns A tibble containing the wrangled data
#' @export
fetch_reunion <- function() {
  data_file <- download_stats("https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables", "Family reunion visa grants detailed datasets")

  family_reunion <-
    suppressWarnings(read_excel(data_file, sheet = "Data - Fam_D01", skip = 1))

  # Wrangling
  family_reunion <-
    family_reunion |>
    mutate(Date = ceiling_date(yq(Quarter), unit = "quarter") - days(1)) |>
    mutate(Quarter = quarter(Date)) |>
    relocate(Date) |>
    na.omit()

  family_reunion
}
