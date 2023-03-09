# ---- Build data ----
query_urls <-
  tibble::tribble(
    # Column Names
    ~data_set, ~description, ~query_url, ~source,

    # Asylum applications, decisions and resettlement
    "asylum_summary", "Asylum and resettlement summary tables, year ending June 2022", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1099021/asylum-summary-jun-2022-tables.ods", "https://www.gov.uk/government/statistical-data-sets/immigration-statistics-data-tables-year-ending-june-2022",
    "applications_decisions_resettlement", "Asylum applications, initial decisions and resettlement", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1137286/asylum-applications-datasets-dec-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "awaiting_decision", "Asylum applications awaiting a decision", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1136447/asylum-applications-awaiting-decision-datasets-dec-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "outcomes", "Outcome analysis of asylum applications", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098062/outcome-analysis-asylum-applications-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Age disputes
    "age_disputes", "Age disputes", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098063/age-disputes-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Asylum appeals
    "appeals_lodged_determined", "Asylum appeals lodged and determined", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098064/asylum-appeals-lodged-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "appeals_non_suspensive", "Non-suspensive appeals", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098066/non-suspensive-appeals-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Asylum support
    "support_received", "Asylum seekers in receipt of support", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098067/asylum-seekers-receipt-support-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "support_applications", "Applications for section 95 support", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1055859/applications-section-95-support-datasets-dec-2021.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Dublin regulation
    "dublin_regulation", "Dublin regulation", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/962018/dublin-regulation-datasets-mar-2020.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Family reunion
    "family_reunion", "Family reunion visa grants", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1136450/family-reunion-visa-grants-datasets-dec-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Local authority data
    "local_authority_resettlement", "Resettlement by local authority", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098069/resettlement-local-authority-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "local_authority_support", "Section 95 support by local authority", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098070/section-95-support-local-authority-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Resettlement, Asylum Support and Integration (RASI) data
    "rasi", "Resettlement, Asylum Support and Integration", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1100316/UKVI_RASI_Q2_2022_Published.ods", "https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration",

    # Immigration and protection data
    "immigration_and_protection", "Immigration and protection data", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1100313/UKVI_I_P_Q2_2022_Published.ods", "https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration",

    # Detention
    "detention_summary", "Detention summary tables, year ending June 2022", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098047/detention-summary-jun-2022-tables.ods", "https://www.gov.uk/government/statistical-data-sets/immigration-statistics-data-tables-year-ending-june-2022#detention",
    "immigration_detention", "Immigration detention", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098088/detention-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/returns-and-detention-datasets",
    "returns", "Returns", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098089/returns-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/returns-and-detention-datasets",

    # Irregular migration
    "irrgular_migration", "Irregular migration detailed dataset", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1137078/irregular-migration-to-the-UK-detailed-dataset-year-ending-December-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/irregular-migration-detailed-dataset-and-summary-tables"
  )

usethis::use_data(query_urls, internal = TRUE, overwrite = TRUE)
