#' Save all the asylum and resettlement data in a SQLite database
#' @param db_path Where to save the SQLite database
#' @param db_filename SQLite filename
#' @export
save_sqlite <- function(db_path, db_filename = "asylum.sqlite") {
  db <- file.path(db_path, db_filename)

  con <- RSQLite::dbConnect(RSQLite::SQLite(), db)

  RSQLite::dbWriteTable(con, "applications", asylum::applications, indexes = list("Date", "Year", "Quarter", "Nationality"))
  RSQLite::dbWriteTable(con, "decisions_resettlement", asylum::decisions_resettlement, indexes = list("Date", "Year", "Quarter", "Nationality"))
  RSQLite::dbWriteTable(con, "family_reunion", asylum::family_reunion, indexes = list("Date", "Year", "Quarter", "Nationality"))

  # dplyr::copy_to(con, asylum::applications, "applications", indexes = list("Date", "Year", "Quarter", "Nationality"))
  # dplyr::copy_to(con, asylum::decisions_resettlement, "decisions_resettlement", indexes = list("Date", "Year", "Quarter", "Nationality"))
  # dplyr::copy_to(con, asylum::family_reunion, "family_reunion", indexes = list("Date", "Year", "Quarter", "Nationality"))

  RSQLite::dbDisconnect(con)
}
