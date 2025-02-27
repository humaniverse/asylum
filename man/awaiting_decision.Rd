% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{awaiting_decision}
\alias{awaiting_decision}
\title{Asylum applications awaiting a decision}
\format{
A data frame with 7 variables:
\describe{
  \item{Date}{Date}
  \item{Nationality}{Nationality of people awaiting a decision}
  \item{Region}{World region the nation is in}
  \item{Applicant type}{'Main applicant' or 'Dependant'}
  \item{Application stage}{'Pending initial decision' or 'Pending further review'}
  \item{Duration}{'More than 6 months', '6 months or less', or 'N/A - Further review'}
  \item{Applications}{Number of applications}
  ...
}
}
\source{
\url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
}
\usage{
awaiting_decision
}
\description{
Asylum applications awaiting an initial decision or further review, by
nationality and applicant type.
}
\keyword{datasets}
