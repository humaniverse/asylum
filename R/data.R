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

#' Applications for section 95 support
#'
#' Applications for section 95 support, by nationality, support type granted,
#' and group type.
#'
#' @format A data frame with 3,837 rows and 6 variables:
#' \describe{
#'   \item{Year}{Year}
#'   \item{Nationality}{Nationality of people receiving support}
#'   \item{Region}{World region the nation is in}
#'   \item{Support type granted}{'Accommodation', 'Closed / Invalid', or 'Subsistence Only'}
#'   \item{Group type}{'Single adult', 'Family', or 'Unknown'}
#'   \item{Applications}{Number of applications}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"support_applications"

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
#'   \item{`Final outcomes: Grants of HP/DL and other`}{Final outcomes: Grants of HP/DL and other}
#'   \item{`Final outcomes: Refused asylum, HP, DL or other leave`}{Final outcomes: Refused asylum, HP, DL or other leave}
#'   \item{Final outcome: Withdrawn application}{Final outcome: Withdrawn application}
#'   \item{Final outcome: Cases with final outcome not yet known}{Final outcome: Cases with final outcome not yet known}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"outcomes"

#' Age disputes
#'
#' Age disputes raised and outcomes of age disputes.
#'
#' @format A data frame with 3,061 rows and 8 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality of people applying}
#'   \item{Region}{World region the nation is in}
#'   \item{Raised or resolved}{'Raised' or 'Resolved'}
#'   \item{Raised type / Resolved outcome}{'Existing asylum application', 'Asylum application raised in quarter', 'Less than 18', or '18+'}
#'   \item{Age disputes}{Number of age disputes}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"age_disputes"

#' Non-suspensive appeals
#'
#' Initial decisions on asylum applications eligible for non-suspensive appeal, by nationality
#'
#' @format A data frame with 2,035 rows and 10 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality of people applying}
#'   \item{Region}{World region the nation is in}
#'   \item{Initial decisions from designated states}{Initial decisions from designated states}
#'   \item{Refusals from designated states}{Refusals from designated states}
#'   \item{Clearly unfounded refusals (designated states)}{Clearly unfounded refusals (designated states)}
#'   \item{Clearly unfounded refusals (non-designated states)}{Clearly unfounded refusals (non-designated states)}
#'   \item{Total eligible for the NSA process}{Total eligible for the NSA process}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"appeals_non_suspensive"

#' Dublin regulation
#'
#' Transfers and requests for transfer under the Dublin regulation, by EU
#' member state and article.
#'
#' @format A data frame with 3,508 rows and 8 variables:
#' \describe{
#'   \item{Date}{The period in which the request or transfer of an asylum applicant under the Dublin Regulation was made}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Member State}{As applicable, the EU Member State which either raises, or receives, a request or transfer of an asylum applicant under the Dublin Regulation}
#'   \item{In / Out}{The direction of a request or transfer: either into, or out of, the UK}
#'   \item{Request / Transfer}{Whether the case is a request for transfer, or a transfer, of an asylum applicant}
#'   \item{Article}{The Article (rule) of the Dublin Regulation under which the request or transfer is carried out}
#'   \item{Count}{The number of transfers, or requests to transfer under the Dublin Regulation}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"dublin_regulation"

#' Family reunion visa grants
#'
#' Family reunion visas granted to family members of refugees, by nationality,
#' sex and age.
#'
#' @format A data frame with 6,853 rows and 8 variables:
#' \describe{
#'   \item{Date}{The period in which the Family Reunion visa was granted}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality of the visa recipient}
#'   \item{Region}{World region of the country of nationality for the visa recipient}
#'   \item{Sex}{The sex of the individual}
#'   \item{Age}{Age of individual at time of visa grant}
#'   \item{Visas granted}{The number of family reunion visas granted}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"family_reunion"

#' Resettlement by local authority
#'
#' Refugees resettled by resettlement scheme and local authority.
#'
#' @format A data frame with 2,243 rows and 8 variables:
#' \describe{
#'   \item{Date}{The period in which the refugee arrived in the UK}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{UK Region}{Region of the UK in which the refugee was initially resettled}
#'   \item{LAD Code}{Local Authority (district) code as supplied by ONS}
#'   \item{Local Authority}{The Local Authority in which the refugee was initially resettled}
#'   \item{Resettlement Scheme}{The scheme under which the refugee was resettled}
#'   \item{Persons}{The number of refugees resettled}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"local_authority_resettlement"

#' Section 95 support by local authority
#'
#' Asylum seekers in receipt of section 95 support by local authority.
#'
#' @format A data frame with 9,929 rows and 8 variables:
#' \describe{
#'   \item{Date}{The date at which the number of people in receipt of support refers to}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{UK Region}{The UK region of the individual's registered address}
#'   \item{Local Authority}{The Local Authority of the individual's registered address}
#'   \item{LAD Code}{Local Authority (district) code as supplied by ONS}
#'   \item{Support sub-type}{Whether the support provided is subsistence only, or includes provision of accommodation}
#'   \item{People}{Number of people in receipt of section 95 support}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"local_authority_support"

#' Aspen Cards in use
#'
#' The number of Aspen Cards in use.
#'
#' @format A data frame with 17 rows and 4 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Aspen Cards in use}{Number of Aspen Cards in use}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"aspen"

#' Aspen Card-related support
#'
#' The number of Aspen Card-related support enquiries received by the Home
#' Office, Sodexo and Migrant Help.
#'
#' @format A data frame with 17 rows and 6 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Home Office}{NUmber of support enquiries received by the Home Office}
#'   \item{Sodexo}{enquiries received by Sodexo}
#'   \item{Migrant Help}{enquiries received by Migrant Help}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"aspen_support"

#' National Transfer Scheme
#'
#' Number of individuals transferred between local authorities under the
#' National Transfer Scheme for unaccompanied asylum seeking children.
#'
#' @format A data frame with 8,612 rows and 9 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Region}{UK region}
#'   \item{Local Authority or HSCT (NI)}{Local Authority, or Health & Social Care Trust in Northern Ireland}
#'   \item{Able to participate in the NTS?}{Is this LA/HSCT participating in the National Transfer Scheme?}
#'   \item{Transfers out of Local Authority}{Number of transfers out of LA}
#'   \item{Transfers into Local Authority}{Number of transfers into LA}
#'   \item{Transfers into to LA from port/intake unit}{Number of transfers into to LA from port/intake unit}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"nts"

#' Applications for Support Section 4 and Section 95
#'
#' Applications for Support Section 4 and Section 95.
#'
#' @format A data frame with 46 rows and 5 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Section 4}{Number of applications for Section 4 support}
#'   \item{Section 95}{Number of applications for Section 95 support}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"support_applications_rasi"

#' Travel documents
#'
#' Travel documents, applications raised and despatched.
#'
#' @format A data frame with 46 rows and 5 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{TD Raised}{Number of travel document applications raised}
#'   \item{TD Despatched}{Number of travel documents despatched}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"travel_documents"
