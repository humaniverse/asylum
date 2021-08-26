#' Asylum seekers in receipt of support
#'
#' Asylum seekers in receipt of support at end of period, by nationality,
#' support type, and UK region.
#'
#' @format A data frame with 35,597 rows and 7 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Nationality}{Nationality of people receiving support}
#'   \item{Region}{World region the nation is in}
#'   \item{Support Type}{Section 95, Section 98, or Section 4 support}
#'   \item{Support Sub-Type}{'Dispersed Accommodation' or 'Subsistence Only' for Section 95 support}
#'   \item{UK Region}{Where the people are currently living}
#'   \item{People}{Number of people receiving support}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"support_received"

#' Asylum applications awaiting a decision
#'
#' Asylum applications awaiting an initial decision or further review, by
#' nationality and applicant type.
#'
#' @format A data frame with 26,623 rows and 7 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Nationality}{Nationality of people awaiting a decision}
#'   \item{Region}{World region the nation is in}
#'   \item{Applicant Type}{'Main applicant' or 'Dependant'}
#'   \item{Application stage}{'Pending initial decision' or 'Pending further review'}
#'   \item{Duration}{'More than 6 months', '6 months or less', or 'N/A - Further review'}
#'   \item{Applications}{Number of applications}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"awaiting_decision"

#' Asylum applications
#'
#' Asylum applications raised, by nationality, age, sex, UASC, applicant type,
#' and location of application.
#'
#' @format A data frame with 57,482 rows and 11 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality of people applying}
#'   \item{Region}{World region the nation is in}
#'   \item{Age}{Age group of applicants}
#'   \item{Sex}{Gender/sex of applicants}
#'   \item{Applicant Type}{'Main applicant' or 'Dependant'}
#'   \item{UASC}{Are they an unaccompanied asylum-seeking child?}
#'   \item{Location of application}{'At Port' or 'In Country'}
#'   \item{Applications}{Number of applications}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"applications"

#' Initial decisions and resettlement
#'
#' Outcomes of asylum applications at initial decision, and refugees resettled
#' in the UK, by nationality, age, sex, applicant type, and UASC (unaccompanied
#' asylum-seeking children).
#'
#' @format A data frame with 95,179 rows and 14 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality of people applying}
#'   \item{Region}{World region the nation is in}
#'   \item{Case type}{'Asylum Case' or 'Resettlement Case'}
#'   \item{Case outcome group}{'Grant of Other Leave', 'Grant of Protection', 'Refused', or 'Withdrawn'}
#'   \item{Case outcome}{Detailed description of the case outcome}
#'   \item{Age}{Age group of applicants}
#'   \item{Sex}{Gender/sex of applicants}
#'   \item{Applicant Type}{'Main applicant' or 'Dependant'}
#'   \item{UASC}{Are they an unaccompanied asylum-seeking child?}
#'   \item{Host Country}{Host country, in cases of resettlement}
#'   \item{Decisions}{Number of decisions}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"decisions_resettlement"
