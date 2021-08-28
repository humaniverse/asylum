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
#'   \item{Applicant type}{'Main applicant' or 'Dependant'}
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
#'   \item{Applicant type}{'Main applicant' or 'Dependant'}
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
#'   \item{Applicant type}{'Main applicant' or 'Dependant'}
#'   \item{UASC}{Are they an unaccompanied asylum-seeking child?}
#'   \item{Host Country}{Host country, in cases of resettlement}
#'   \item{Decisions}{Number of decisions}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"decisions_resettlement"

#' Asylum appeals lodged
#'
#' Asylum appeals raised at the First-Tier Tribunal, by nationality and sex.
#'
#' @format A data frame with 6,621 rows and 7 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality of people applying}
#'   \item{Region}{World region the nation is in}
#'   \item{Sex}{Gender/sex of applicants}
#'   \item{Appeals lodged}{Number of appeals lodged}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"appeals_lodged"

#' Asylum appeals determined
#'
#' Outcomes of asylum appeals raised at the First-Tier Tribunal, by nationality
#' and sex.
#'
#' @format A data frame with 11,973 rows and 8 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality of people applying}
#'   \item{Region}{World region the nation is in}
#'   \item{Outcome}{'Allowed', 'Dismissed', or 'Withdrawn'}
#'   \item{Sex}{Gender/sex of applicants}
#'   \item{Appeals determined}{Number of appeals determined}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"appeals_determined"

#' Outcome analysis of asylum applications
#'
#' The initial decision and final outcome of all asylum applications raised in
#' a period, by nationality.
#'
#' @format A data frame with 3,216 rows and 26 variables:
#' \describe{
#'   \item{Year of application}{Year of application}
#'   \item{Geographical region}{Geographical region}
#'   \item{Nationality}{Nationality}
#'   \item{Applications}{Applications}
#'   \item{Initial decisions}{Initial decisions}
#'   \item{Granted asylum}{Granted asylum}
#'   \item{Granted HP/DL}{Granted HP/DL}
#'   \item{Other grants}{Other grants}
#'   \item{Refused}{Refused}
#'   \item{Applications withdrawn}{Applications withdrawn}
#'   \item{Initial decisions not yet known}{Initial decisions not yet known}
#'   \item{Appeals lodged}{Appeals lodged}
#'   \item{Allowed appeals}{Allowed appeals}
#'   \item{Dismissed appeals}{Dismissed appeals}
#'   \item{Withdrawn appeals}{Withdrawn appeals}
#'   \item{Appeal outcome not yet known}{Appeal outcome not yet known}
#'   \item{Enforced returns}{Enforced returns}
#'   \item{Voluntary returns}{Voluntary returns}
#'   \item{Assisted returns (Subset of Voluntary returns)}{Assisted returns (Subset of Voluntary returns)}
#'   \item{Controlled returns (Subset of Voluntary returns)}{Controlled returns (Subset of Voluntary returns)}
#'   \item{Other verified returns (Subset of Voluntary returns)}{Other verified returns (Subset of Voluntary returns)}
#'   \item{Final outcome: Grants of asylum}{Final outcome: Grants of asylum}
#'   \item{Final outcomes: Grants of HP/DL and other}{Final outcomes: Grants of HP/DL and other}
#'   \item{Final outcomes: Refused asylum, HP, DL or other leave}{Final outcomes: Refused asylum, HP, DL or other leave}
#'   \item{Final outcome: Withdrawn application}{Final outcome: Withdrawn application}
#'   \item{Final outcome: Cases with final outcome not yet known}{Final outcome: Cases with final outcome not yet known}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"outcomes"
