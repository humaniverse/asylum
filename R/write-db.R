#' Save all the asylum and resettlement data in a SQLite database
#' @param db_path Where to save the SQLite database
#' @param db_filename SQLite filename
#' @export
save_sqlite <- function(db_path = ".", db_filename = "asylum.db") {
  db <- file.path(db_path, db_filename)

  con <- RSQLite::dbConnect(RSQLite::SQLite(), db)

  applications <- asylum::applications |> dplyr::rename_with(~ gsub(" ", "_", .x, fixed = TRUE))
  decisions_resettlement <- asylum::decisions_resettlement |> dplyr::rename_with(~ gsub(" ", "_", .x, fixed = TRUE))
  family_reunion <- asylum::family_reunion |> dplyr::rename_with(~ gsub(" ", "_", .x, fixed = TRUE))
  awaiting_decision <- asylum::awaiting_decision |> dplyr::rename_with(~ gsub(" ", "_", .x, fixed = TRUE))
  irregular_migration <- asylum::irregular_migration |> dplyr::rename_with(~ gsub(" ", "_", .x, fixed = TRUE))

  RSQLite::dbWriteTable(con, "applications", applications, indexes = list("Date", "Year", "Quarter", "Nationality"))
  RSQLite::dbWriteTable(con, "decisions_resettlement", decisions_resettlement, indexes = list("Date", "Year", "Quarter", "Nationality"))
  RSQLite::dbWriteTable(con, "family_reunion", family_reunion, indexes = list("Date", "Year", "Quarter", "Nationality"))
  RSQLite::dbWriteTable(con, "awaiting_decision", awaiting_decision, indexes = list("Date", "Nationality"))
  RSQLite::dbWriteTable(con, "irregular_migration", irregular_migration, indexes = list("Date", "Year", "Quarter", "Nationality"))

  RSQLite::dbDisconnect(con)
}
