# ---- Build data ----
query_urls <-
  tibble::tribble(
    # Column Names
    ~data_set, ~description, ~query_url, ~source,

    # Asylum applications, decisions and resettlement
    "asylum_summary", "Asylum and resettlement summary tables, year ending June 2021", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011628/asylum-summary-jun-2021-tables.ods", "https://www.gov.uk/government/statistical-data-sets/immigration-statistics-data-tables-year-ending-june-2021",
    "applications_decisions_resettlement", "Asylum applications, initial decisions and resettlement", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011720/asylum-applications-datasets-jun-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "awaiting_decision", "Asylum applications awaiting a decision", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011721/asylum-applications-awaiting-decision-datasets-jun-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "outcomes", "Outcome analysis of asylum applications", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011723/outcome-analysis-asylum-applications-datasets-jun-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Age disputes
    "age_disputes", "Age disputes", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011724/age-disputes-datasets-jun-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Asylum appeals
    "appeals_lodged_determined", "Asylum appeals lodged and determined", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011725/asylum-appeals-lodged-datasets-jun-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "appeals_non_suspensive", "Non-suspensive appeals", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011726/non-suspensive-appeals-datasets-jun-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Asylum support
    "support_received", "Asylum seekers in receipt of support", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011727/asylum-seekers-receipt-support-datasets-jun-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "support_applications", "Applications for section 95 support", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/962016/applications-section-95-support-datasets-dec-2020.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Dublin regulation
    "dublin_regulation", "Dublin regulation", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/962018/dublin-regulation-datasets-mar-2020.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Family reunion
    "family_reunion", "Family reunion visa grants", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011729/family-reunion-visa-grants-datasets-jun-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Local authority data
    "local_authority_resettlement", "Resettlement by local authority", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011730/resettlement-local-authority-datasets-jun-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "local_authority_support", "Section 95 support by local authority", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1011731/section-95-support-local-authority-datasets-jun-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Resettlement, Asylum Support and Integration (RASI) data
    "rasi", "Resettlement, Asylum Support and Integration", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1013502/UKVI_RASI_Q2_2021_Published.ods", "https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration",

    # Immigration and protection data
    "immigration_and_protection", "Immigration and protection data", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1013501/UKVI_IP_Q2_2021_Published.ods", "https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration"
  )

usethis::use_data(query_urls, internal = TRUE, overwrite = TRUE)
