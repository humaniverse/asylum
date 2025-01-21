#' Try to download a statistics data file from the Home Office website.
#'
#' @param url A URL with a set of links to datasets
#' @param name_of_file Text of the link to the file
#'
download_stats <- function(url, name_of_file) {

  doc <-
    httr2::request(url) |>
    httr2::req_perform() |>
    httr2::resp_body_html()

  # Helper function to extract the URL based on 'text_to_find'
  extract_url <- function(doc, text_to_find) {
    doc |>
      rvest::html_nodes(xpath = stringr::str_glue("//*//a[contains(text(), '{text_to_find}')]//@href")) |>
      rvest::html_text() |>
      stringr::str_trim()
  }

  # Extract the URL for this file
  data_url <-
    doc |>
    extract_url(name_of_file)

  # On the irregular migration page, there are two "Detailed datasets" links, but only one leads to a file - extract it
  if (is.vector(data_url)) {
    data_url <- data_url[ grepl("https", data_url) ]
  }

  # Download the data file and return it
  data_file_ext <- paste0(".", tools::file_ext(data_url))
  temp_path <- tempfile(fileext = data_file_ext)
  httr2::req_perform(httr2::request(data_url), path = temp_path)
  return(temp_path)
}
