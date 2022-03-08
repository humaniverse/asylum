# ---- Build data ----
query_urls <-
  tibble::tribble(
    # Column Names
    ~data_set, ~description, ~query_url, ~source,

    # Asylum applications, decisions and resettlement
    "asylum_summary", "Asylum and resettlement summary tables, year ending December 2021", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055845/asylum-summary-dec-2021-tables.ods", "https://www.gov.uk/government/statistical-data-sets/immigration-statistics-data-tables-year-ending-december-2021",
    "applications_decisions_resettlement", "Asylum applications, initial decisions and resettlement", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055175/asylum-applications-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "awaiting_decision", "Asylum applications awaiting a decision", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055177/asylum-applications-awaiting-decision-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "outcomes", "Outcome analysis of asylum applications", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1034047/outcome-analysis-asylum-applications-datasets-sep-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Age disputes
    "age_disputes", "Age disputes", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055178/age-disputes-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Asylum appeals
    "appeals_lodged_determined", "Asylum appeals lodged and determined", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055179/asylum-appeals-lodged-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "appeals_non_suspensive", "Non-suspensive appeals", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055180/non-suspensive-appeals-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Asylum support
    "support_received", "Asylum seekers in receipt of support", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055182/asylum-seekers-receipt-support-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "support_applications", "Applications for section 95 support", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055859/applications-section-95-support-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Dublin regulation
    "dublin_regulation", "Dublin regulation", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/962018/dublin-regulation-datasets-mar-2020.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Family reunion
    "family_reunion", "Family reunion visa grants", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055184/family-reunion-visa-grants-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Local authority data
    "local_authority_resettlement", "Resettlement by local authority", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055185/resettlement-local-authority-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "local_authority_support", "Section 95 support by local authority", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055186/section-95-support-local-authority-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Resettlement, Asylum Support and Integration (RASI) data
    "rasi", "Resettlement, Asylum Support and Integration", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1058193/UKVI_RASI_Q4_2021_Published.ods", "https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration",

    # Immigration and protection data
    "immigration_and_protection", "Immigration and protection data", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1056347/UKVI_IP_Q4_2021_Published.xlsx", "https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration"
  )

usethis::use_data(query_urls, internal = TRUE, overwrite = TRUE)
