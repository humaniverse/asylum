# ---- Build data ----
query_urls <-
  tibble::tribble(
    # Column Names
    ~data_set, ~description, ~query_url, ~source,

    # Main URLs to use:
    # - https://www.gov.uk/government/collections/migration-statistics
    # - https://www.gov.uk/government/collections/immigration-statistics-quarterly-release
    # - https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets
    # - https://www.gov.uk/government/statistical-data-sets/managed-migration-datasets
    # - https://www.gov.uk/government/collections/migration-transparency-data#immigration-enforcement

    # Asylum applications, decisions and resettlement
    "asylum_summary", "Asylum and resettlement summary tables", "https://assets.publishing.service.gov.uk/media/65d8843e6efa830011dcc575/asylum-summary-dec-2023-tables.ods", "https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables",
    "applications_decisions_resettlement", "Asylum applications, initial decisions and resettlement", "https://assets.publishing.service.gov.uk/media/65d884a387005a001a80f8bf/asylum-applications-datasets-dec-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables",
    "awaiting_decision", "Asylum applications awaiting a decision", "https://assets.publishing.service.gov.uk/media/66befebe0a079b65ea323eef/asylum-applications-awaiting-decision-datasets-jun-24.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "outcomes", "Outcome analysis of asylum applications", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098062/outcome-analysis-asylum-applications-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Age disputes
    "age_disputes", "Age disputes", "https://assets.publishing.service.gov.uk/media/655badd1544aea0019fb30e1/age-disputes-datasets-sep-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables",

    # Asylum appeals
    "appeals_lodged_determined", "Asylum appeals lodged and determined", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1156822/asylum-appeals-lodged-datasets-mar-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables",
    # "appeals_non_suspensive", "Non-suspensive appeals", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1098066/non-suspensive-appeals-datasets-jun-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "claims_certified_section_94", "Asylum claims certified under Section 94", "https://assets.publishing.service.gov.uk/media/655badef544aea000dfb30fb/asylum-claims-certified-section-94-datasets-sep-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Asylum support
    "support_received", "Asylum seekers in receipt of support", "https://assets.publishing.service.gov.uk/media/65df594bf1cab36b60fc4737/asylum-seekers-receipt-support-datasets-dec-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables",
    "support_applications", "Applications for section 95 support", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1136760/applications-section-95-support-datasets-dec-2022.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Dublin regulation
    "dublin_regulation", "Dublin regulation", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/962018/dublin-regulation-datasets-mar-2020.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Family reunion
    "family_reunion", "Family reunion visa grants", "https://assets.publishing.service.gov.uk/media/65d885c36efa83001ddcc587/family-reunion-visa-grants-datasets-dec-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables",

    # Local authority data
    "local_authority_resettlement", "Resettlement by local authority", "https://assets.publishing.service.gov.uk/media/655bae44d03a8d001207fd17/resettlement-local-authority-datasets-sep-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",
    "local_authority_support", "Section 95 support by local authority", "https://assets.publishing.service.gov.uk/media/655bae5a046ed400148b9c8d/support-local-authority-datasets-sep-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets",

    # Detention
    "detention_summary", "Detention summary tables", "https://assets.publishing.service.gov.uk/media/65563340544aea0019fb2ea5/detention-summary-sep-2023-tables.ods", "https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables#detention",
    "immigration_detention", "Immigration detention", "https://assets.publishing.service.gov.uk/media/65d8891554f1e7001116591b/detention-datasets-dec-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables",

    # Returns
    "returns_summary", "Returns summary table", "https://assets.publishing.service.gov.uk/media/65d888b36efa83001ddcc595/returns-summary-dec-2023-tables.ods", "https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables#returns",
    "returns", "Returns", "https://assets.publishing.service.gov.uk/media/65d888d16efa83001ddcc596/returns-datasets-dec-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables#returns",

    # Irregular migration
    "irrgular_migration", "Irregular migration detailed dataset", "https://assets.publishing.service.gov.uk/media/65d63f15188d77001603886b/irregular-migration-to-the-UK-detailed-dataset-year-ending-dec-2023.xlsx", "https://www.gov.uk/government/statistical-data-sets/irregular-migration-detailed-dataset-and-summary-tables#detailed-datasets",

    # Resettlement, Asylum Support and Integration (RASI) data
    "rasi", "Resettlement, Asylum Support and Integration", "https://assets.publishing.service.gov.uk/media/655f30094d0864000dd039ba/UKVI_RASI_Q3_2023_Background_Published.ods", "https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration",

    # Immigration and protection data
    "immigration_and_protection", "Immigration and protection data", "https://assets.publishing.service.gov.uk/media/65dc6f2f529bfa001ce95507/UKVI_IP_Q4_2023.xlsx", "https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration",

    # Immigration enforcement
    "immigration_enforcement", "Immigration Enforcement data", "https://assets.publishing.service.gov.uk/media/65dc7944529bfa001ce9551b/IE__Q4_2023_Background_Published.ods", "https://www.gov.uk/government/collections/migration-transparency-data#immigration-enforcement",

    # National Referral Mechanism (NRM)
    "nrm_2023_q4", "Modern Slavery: National Referral Mechanism and Duty to Notify statistics UK, October to December 2023", "https://assets.publishing.service.gov.uk/media/65e1cea32f2b3b001c7cd840/national-referral-mechanism-statistics-uk-quarter-4-2023-oct-to-dec-tables.ods", "https://www.gov.uk/government/collections/national-referral-mechanism-statistics",
    "nrm_2023_q3", "Modern Slavery: National Referral Mechanism and Duty to Notify statistics UK, July to September 2023", "https://assets.publishing.service.gov.uk/media/65451bbe9c3709000d14677e/national-referral-mechanism-statistics-uk-quarter-3-2023-jul-to-sep-tables.ods", "https://www.gov.uk/government/collections/national-referral-mechanism-statistics",
    "nrm_2023_q2", "Modern Slavery: National Referral Mechanism and Duty to Notify statistics UK, April to June 2023", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1176468/national-referral-mechanism-statistics-uk-quarter-2-2023-april-to-june-tables.ods", "https://www.gov.uk/government/collections/national-referral-mechanism-statistics",
    "nrm_2023_q1", "Modern Slavery: National Referral Mechanism and Duty to Notify statistics UK, January to March 2023", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1154119/modern-slavery-national-referral-mechanism-statistics-uk-quarter-1-2023-january-to-march-tables.ods", "https://www.gov.uk/government/collections/national-referral-mechanism-statistics",
    "nrm_2022_q4", "Modern Slavery: National Referral Mechanism and Duty to Notify statistics UK, October to December 2022", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1139166/national-referral-mechanism-statistics-uk-quarter-4-2022-october-to-december-tables.ods", "https://www.gov.uk/government/collections/national-referral-mechanism-statistics",
    "nrm_2022_q3", "Modern Slavery: National Referral Mechanism and Duty to Notify statistics UK, July to September 2022", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1114337/national-referral-mechanism-statistics-uk-quarter-3-2022-july-to-september-tables.ods", "https://www.gov.uk/government/collections/national-referral-mechanism-statistics",
    "nrm_2022_q2", "Modern Slavery: National Referral Mechanism and Duty to Notify statistics UK, April to June 2022", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1096415/national-referral-mechanism-statistics-uk-quarter-2-2022-april-to-june-tables.ods", "https://www.gov.uk/government/collections/national-referral-mechanism-statistics"
  )

usethis::use_data(query_urls, internal = TRUE, overwrite = TRUE)
