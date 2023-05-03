#' Asylum seekers in receipt of support
#'
#' Asylum seekers in receipt of support at end of period, by nationality,
#' support type, and UK region.
#'
#' @format A data frame with 56,864 rows and 7 variables:
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
#' @format A data frame with 4,756 rows and 6 variables:
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
#' @format A data frame with 30,891 rows and 7 variables:
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
#' @format A data frame with 65,147 rows and 11 variables:
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
#' @format A data frame with 103,838 rows and 14 variables:
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
#' @format A data frame with 7,286 rows and 7 variables:
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
#' @format A data frame with 13,196 rows and 8 variables:
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
#' @format A data frame with 3,463 rows and 26 variables:
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
#'   \item{Final outcomes: Refused asylum or HP or DL or other leave}{Final outcomes: Refused asylum or HP or DL or other leave}
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
#' @format A data frame with 3,513 rows and 8 variables:
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
#' @format A data frame with 2,105 rows and 10 variables:
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
#' @format A data frame with 7,830 rows and 8 variables:
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
#' @format A data frame with 2,567 rows and 8 variables:
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
#' @format A data frame with 15,456 rows and 8 variables:
#' \describe{
#'   \item{Date}{The date at which the number of people in receipt of support refers to}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Support Type}{Section 95 or Section 4 support?}
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
#' @format A data frame with 11,251 rows and 9 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Region}{UK region}
#'   \item{Local Authority or HSCT (NI)}{Local Authority, or Health & Social Care Trust in Northern Ireland}
#'   \item{Able to participate in the NTS?}{Is this LA/HSCT participating in the National Transfer Scheme?}
#'   \item{Transfers out of Local Authority}{Number of transfers out of LA}
#'   \item{Transfers into Local Authority}{Number of transfers into LA}
#'   \item{Transfers into LA from port/intake unit}{Number of transfers into to LA from port/intake unit}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"nts"

#' Applications for Support Section 4 and Section 95
#'
#' Applications for Support Section 4 and Section 95.
#'
#' @format A data frame with 52 rows and 5 variables:
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
#' @format A data frame with 51 rows and 5 variables:
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

#' Appeal Representation Rates
#'
#' Appeal representation rates.
#'
#' @format A data frame with 44 rows and 7 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{All hearings (\%)}{All hearings}
#'   \item{First Tier (\%)}{First tier}
#'   \item{Upper Tier (\%)}{Upper tier}
#'   \item{Deportation (\%)}{Deportation}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"appeal_representation_rate"

#' Volume of oral hearings represented by the Home Office
#'
#' The volume of oral hearings represented by the Home Office divided by the
#' total number of oral hearing.
#'
#' @format A data frame with 12 rows and 4 variables:
#' \describe{
#'   \item{Financial Year}{Financial year}
#'   \item{Asylum appeals represented at hearing (\%)}{Percent of sylum appeals represented at hearing}
#'   \item{Asylum Oral Hearings}{Number of asylum oral hearings}
#'   \item{Asylum Oral Hearings Represented by HO}{Number of asylum oral hearings represented by the Home Office}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"oral_hearings_volume"

#' Decision Quality
#'
#' The Decision Quality percentage of Decisions Sampled.
#'
#' @format A data frame with 15 rows and 5 variables:
#' \describe{
#'   \item{Financial Year}{Financial year}
#'   \item{Assurance}{First line or second line assurance}
#'   \item{Decision Quality (\%)}{Decision Quality percentage}
#'   \item{Number of Decisions Sampled}{Number of decisions sampled}
#'   \item{Sample Size (\%)}{Sample size}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"decision_quality"

#' Asylum applications processed within 6 months
#'
#' Percentage of Asylum applications processed within 6 months
#'
#' @format A data frame with 33 rows and 16 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Decisions in}{Column just containing a label saying "6 months"}
#'   \item{Total Applications Received}{Total applications received}
#'   \item{Of those Applications received the number completed within six months}{Number of applications completed}
#'   \item{Of those Applications received the percentage completed within six months}{Percent of applications completed}
#'   \item{Total Male Applications Received}{Total applications received for males}
#'   \item{Of those Male Applications received the number completed within six months}{Number of applications completed for males}
#'   \item{Of those Male Applications received the percentage completed within six months}{Percent of applications completed for males}
#'   \item{Total Female Applications Received}{Total applications received for females}
#'   \item{Of those Female Applications received the number completed within six months}{Number of applications completed for females}
#'   \item{Of those Female Applications received the percentage completed within six months}{Percent of applications completed for females}
#'   \item{Total Unknown Applications Received}{Total applications received for people whose sex/gender is unknown}
#'   \item{Of those Unknown Applications received the number completed within six months}{Number of applications completed for people whose gender/sex is unknown}
#'   \item{Of those Unknown Straightforward Applications received the percentage completed within six months}{Percent of applications completed for people whose gender/sex is unknown}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"applications_processed_in_6_months"

#' Age of asylum operations
#'
#' Age of Asylum Operations Initial Decision Work In Progress - applications
#' made from 1st Oct 2006.
#'
#' @format A data frame with 25 rows and 8 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Total}{Total awaiting initial asylum decision}
#'   \item{Less than 3 months}{Number waiting less than three months}
#'   \item{3-6 months}{Number waiting 3-6 months}
#'   \item{6-12 months}{Number waiting 6-12 months}
#'   \item{12 months+}{Number waiting more than a year}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"age_of_asylum_operations"

#' Asylum work in progress
#'
#' Asylum work in progress.
#'
#' @format A data frame with 12 rows and 17 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Total Work In Progress}{Number of cases that are not concluded at the given point in time}
#'   \item{Awaiting Initial Asylum Decision}{Number waiting an initial decision}
#'   \item{Post Decision}{The 'Post Decision' sub-category includes cases that have had a decision but have not appealed, are not appeal rights exhausted, and have not been removed}
#'   \item{Asylum Appeal Outstanding}{Number with appeals outstanding}
#'   \item{Subject to Removal Action}{Number of cases in the work in progress caseload have been processed through the initial stages of the asylum operations system and are now 'subject to removal action'}
#'   \item{On Hold}{'On Hold' sub-category includes pre- and post-decision absconders}
#'   \item{Further Leave Application Outstanding}{Further Leave applications from former Unaccompanied Asylum Seeking Children given Discretionary Leave}
#'   \item{Case Age: 0:12 Months}{Age of the case}
#'   \item{Case Age: 12:24 Months}{Age of the case}
#'   \item{Case Age: 24:36 Months}{Age of the case}
#'   \item{Case Age: 36+ Months}{Age of the case}
#'   \item{Gender: Male}{Number of males}
#'   \item{Gender: Female}{Number of females}
#'   \item{Gender: Unknown}{Number of people whose gender/sex is unknown}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"asylum_work_in_progress"

#' Breakdown of Asylum costs and productivity
#'
#' Breakdown of Asylum costs and productivity.
#'
#' @format A data frame with 12 rows and 12 variables:
#' \describe{
#'   \item{Financial Year}{Financial year}
#'   \item{Total Asylum Costs}{The costs of managing an asylum operations claim include a) costs associated with deciding a case (screening clients, interviews and issuing a decision), b) managing any related appeal, c) the cost of all asylum operations support (S4, S95 & S98) d) detention costs where detention has been used and e) enforcement costs (escorting and assisted voluntary returns). Also included are the costs of department staff and buildings and the proportionate costs of the Home Office building and managerial costs}
#'   \item{Asylum WIP (new method)}{Number of work in progress claims (new method)}
#'   \item{Asylum WIP (old method)}{Number of work in progress claims (old method)}
#'   \item{Unit Cost}{Unit Costs - This is based on the Work in Progress figure. The costs of an asylum operations case will vary considerably dependent on the type of case (single, dependents) as well as barriers to documentation, legal challenges and logistical and practical challenges}
#'   \item{Total Conclusion}{Total conclusions}
#'   \item{Average Conclusions Per Month}{Average conclusions per month}
#'   \item{Conclusions Productivity}{Conclusions producitivity}
#'   \item{Total Principal Stages Completed}{Total principal stages completed}
#'   \item{Average Principal Stages Completed Per Month}{Average principal stages completed per month}
#'   \item{Asylum Caseworking Staff}{Number of asylum caseworking staff}
#'   \item{Productivity}{Productivity of staff}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"asylum_costs_and_productivity"

#' NFRP - Destitution Change of Conditions Applications and Outcomes
#'
#' NFRP - Destitution Change of Conditions Applications and Outcomes. Data
#' relating to people who are on a Family or Human Rights route and apply to
#' have the No Recourse to Public Funds (NRPF) condition lifted. A factsheet
#' relating to NRPF can be found here:
#' https://homeofficemedia.blog.gov.uk/2020/05/05/no-recourse-to-public-funds-nrpf/
#'
#' @format A data frame with 22 rows and 10 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Applications Received}{Number of applications received}
#'   \item{Of which: Pending}{Number of applications pending}
#'   \item{Decisions}{Number of decisions made}
#'   \item{Of which: Accepted}{Decisions that were accepted}
#'   \item{Of which: Rejected}{Decisions that were rejected}
#'   \item{Average Days to Decision}{Average days taken to reach a decision}
#'   \item{Acceptance Rate}{Rate of acceptance}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"nrpf_change_of_conditions_decisions"

#' NRPF - Destitution Change of Conditions Application by Age Group
#'
#' NFRP - Destitution Change of Conditions Applications by Age Group. Data
#' relating to people who are on a Family or Human Rights route and apply to
#' have the No Recourse to Public Funds (NRPF) condition lifted. A factsheet
#' relating to NRPF can be found here:
#' https://homeofficemedia.blog.gov.uk/2020/05/05/no-recourse-to-public-funds-nrpf/
#'
#' @format A data frame with 22 rows and 12 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Under 18}{Number of applicants under 18}
#'   \item{18 to 25}{Number of applicants aged 18-25}
#'   \item{26 to 30}{Number of applicants aged 26-30}
#'   \item{31 to 40}{Number of applicants aged 31-40}
#'   \item{41 to 50}{Number of applicants aged 41-50}
#'   \item{51 to 60}{Number of applicants aged 51-60}
#'   \item{61 to 70}{Number of applicants aged 61-70}
#'   \item{71 to 80}{Number of applicants aged 71-80}
#'   \item{Over 80}{Number of applicants aged over 80}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"nrpf_change_of_conditions_age"

#' NRPF - Destitution Change of Conditions Application by Nationality
#'
#' NFRP - Destitution Change of Conditions Applications by Nationality. Data
#' relating to people who are on a Family or Human Rights route and apply to
#' have the No Recourse to Public Funds (NRPF) condition lifted. A factsheet
#' relating to NRPF can be found here:
#' https://homeofficemedia.blog.gov.uk/2020/05/05/no-recourse-to-public-funds-nrpf/
#'
#' @format A data frame with 155 rows and 23 variables:
#' \describe{
#'   \item{Nationality}{Nationality}
#'   \item{2017 Q3}{2017 Q3}
#'   \item{2017 Q4}{2017 Q4}
#'   \item{2018 Q1}{2018 Q1}
#'   \item{2018 Q2}{2018 Q2}
#'   \item{2018 Q3}{2018 Q3}
#'   \item{2018 Q4}{2018 Q4}
#'   \item{2019 Q1}{2019 Q1}
#'   \item{2019 Q2}{2019 Q2}
#'   \item{2019 Q3}{2019 Q3}
#'   \item{2019 Q4}{2019 Q4}
#'   \item{2020 Q1}{2020 Q1}
#'   \item{2020 Q2}{2020 Q2}
#'   \item{2020 Q3}{2020 Q3}
#'   \item{2020 Q4}{2020 Q4}
#'   \item{2021 Q1}{2021 Q1}
#'   \item{2021 Q2}{2021 Q2}
#'   \item{2021 Q3}{2021 Q3}
#'   \item{2021 Q4}{2021 Q4}
#'   \item{2022 Q1}{2022 Q1}
#'   \item{2022 Q2}{2022 Q2}
#'   \item{2022 Q3}{2022 Q3}
#'   \item{2022 Q4}{2022 Q4}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"nrpf_change_of_conditions_nationality"

#' NFRP - Destitution Change of Conditions Applications by Gender
#'
#' NFRP - Destitution Change of Conditions Applications by Gender. Data
#' relating to people who are on a Family or Human Rights route and apply to
#' have the No Recourse to Public Funds (NRPF) condition lifted. A factsheet
#' relating to NRPF can be found here:
#' https://homeofficemedia.blog.gov.uk/2020/05/05/no-recourse-to-public-funds-nrpf/
#'
#' @format A data frame with 22 rows and 6 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Male}{Number of applications from males}
#'   \item{Female}{Number of applications from females}
#'   \item{Recorded as Unknown}{Number of applications from people whose sex/gender is unknown}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/collections/migration-transparency-data#uk-visas-and-immigration}
"nrpf_change_of_conditions_gender"

#' Asylum claims certified under Section 94
#'
#' Initial decisions on asylum applications certified under Section 94, by
#' nationality
#'
#' @format A data frame with 2,142 rows and 10 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality}
#'   \item{Region}{Region}
#'   \item{Initial decisions from designated states}{Initial decisions from designated states}
#'   \item{Refusals from designated states}{Refusals from designated states}
#'   \item{Clearly unfounded refusals (designated states)}{Clearly unfounded refusals (designated states)}
#'   \item{Clearly unfounded refusals (non-designated states)}{Clearly unfounded refusals (non-designated states)}
#'   \item{Total clearly unfounded refusals}{Total clearly unfounded refusals}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/asylum-and-resettlement-datasets}
"claims_certified_section_94"

#' Number of entries into immigration detention
#'
#' Number of entries into immigration detention by nationality, age, sex and
#' initial place of detention.
#'
#' @format A data frame with 70,342 rows and 9 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality}
#'   \item{Region}{Region}
#'   \item{Sex}{Sex}
#'   \item{Age}{Age}
#'   \item{First place of detention}{First place of detention}
#'   \item{Entering}{Entering}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/returns-and-detention-datasets}
"people_entering_detention"

#' Number of people in immigration detention
#'
#' Number of people in immigration detention at the end of each quarter by
#' nationality, age, sex, current place of detention and length of detention.
#'
#' @format A data frame with 77,146 rows and 10 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality}
#'   \item{Region}{Region}
#'   \item{Sex}{Sex}
#'   \item{Age}{Age}
#'   \item{Current place of detention}{Current place of detention}
#'   \item{Length of detention}{Length of detention}
#'   \item{People}{Number of people in detention}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/returns-and-detention-datasets}
"people_in_detention"

#' Number of occurrences of people leaving detention
#'
#' Number of occurrences of people leaving detention by nationality, age, sex,
#' reason for leaving detention and length of detention
#'
#' @format A data frame with 100,886 rows and 10 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality}
#'   \item{Region}{Region}
#'   \item{Sex}{Sex}
#'   \item{Age}{Age}
#'   \item{Reason for leaving detention}{Reason for leaving detention}
#'   \item{Length of detention}{Length of detention}
#'   \item{Leaving}{Number of people leaving detention}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/returns-and-detention-datasets}
"people_leaving_detention"

#' Number of returns from the UK
#'
#' Number of returns from the UK, by nationality, age, sex, type of return and
#' return destination group
#'
#' @format A data frame with 227,607 rows and 11 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality}
#'   \item{Region}{Region}
#'   \item{Return type group}{Return type group}
#'   \item{Return type}{Return type}
#'   \item{Age}{Age}
#'   \item{Sex}{Sex}
#'   \item{Return destination group}{Return destination group}
#'   \item{Number of returns}{Number of returns}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/returns-and-detention-datasets}
"returns"

#' Number of returns from the UK, by destination
#'
#' Number of returns from the UK, by type of return and country of destination
#'
#' @format A data frame with 41,500 rows and 8 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Return type group}{Return type group}
#'   \item{Return type}{Return type}
#'   \item{Return destination}{Return destination}
#'   \item{Return destination region}{Return destination region}
#'   \item{Number of returns}{Number of returns}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/returns-and-detention-datasets}
"returns_by_destination"

#' Number of foreign national offender returns from the UK, by nationality
#'
#' Number of foreign national offender returns from the UK, by nationality and
#' return destination group.
#'
#' @format A data frame with 6,217 rows and 7 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality}
#'   \item{Region}{Region}
#'   \item{Return destination group}{Return destination group}
#'   \item{Number of foreign national offender returns}{Number of foreign national offender returns}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/returns-and-detention-datasets}
"returns_offenders_by_nationality"

#' Number of foreign national offender returns from the UK, by destination
#'
#' Number of foreign national offender returns from the UK, by destination.
#'
#' @format A data frame with 4,412 rows and 6 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Return destination}{Return destination}
#'   \item{Return destination region}{Return destination region}
#'   \item{Number of foreign national offender returns}{Number of foreign national offender returns}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/returns-and-detention-datasets}
"returns_offenders_by_destination"

#' People entering, leaving and in detention by asylum and non-asylum
#'
#' People entering, leaving and in detention by asylum and non-asylum, 2010 to 2022.
#'
#' @format A data frame with 13 rows and 10 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Entering detention}{Entering detention}
#'   \item{Entering detention Asylum}{Entering detention Asylum}
#'   \item{Entering detention Non-asylum}{Entering detention Non-asylum}
#'   \item{Leaving detention}{Leaving detention}
#'   \item{Leaving detention Asylum}{Leaving detention Asylum}
#'   \item{Leaving detention Non-asylum}{Leaving detention Non-asylum}
#'   \item{In detention (at end of period)}{In detention (at end of period)}
#'   \item{In detention Asylum}{In detention Asylum}
#'   \item{In detentionNon-asylum}{In detention Non-asylum}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables-year-ending-december-2022#detention}
"detention_summary_flow"

#' Children entering detention
#'
#' Number of occurrences of children entering detention, 2010 to 2022
#'
#' @format A data frame with 13 rows and 7 variables:
#' \describe{
#'   \item{Date of entry to detention}{Date of entry to detention}
#'   \item{Total children}{Total children}
#'   \item{Children Under 5 yrs}{Children Under 5 yrs}
#'   \item{Children 5-11 yrs}{Children 5-11 yrs}
#'   \item{Children 12-16 yrs}{Children 12-16 yrs}
#'   \item{Children 17 yrs}{Children 17 yrs}
#'   \item{Total adults (18+)}{Total adults (18+)}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables-year-ending-december-2022#detention}
"children_entering_detention"

#' Deaths of persons detained under Immigration Act Powers and absconds from
#' detention, 2017 to 2021
#'
#' @format A data frame with 5 rows and 4 variables:
#' \describe{
#'   \item{Year}{Year}
#'   \item{Deaths of persons detained under Immigration Powers}{Deaths of persons detained under Immigration Powers}
#'   \item{Of which occurred in the detention estate}{Of which occurred in the detention estate}
#'   \item{Absconds from detention}{Absconds from detention}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables-year-ending-december-2022#detention}
"detentions_deaths_and_absconds"

#' Deaths of persons detained under Immigration Act Powers, 2017 to 2021
#'
#' @format A data frame with 10 rows and 8 variables:
#' \describe{
#'   \item{Year}{Year}
#'   \item{Number}{Number identifying a person within each year}
#'   \item{Sex}{Sex}
#'   \item{Age}{Age}
#'   \item{Nationality}{Nationality}
#'   \item{Cause of death}{Cause of death}
#'   \item{Place of incident}{Place of incident}
#'   \item{Place of death}{Place of death}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables-year-ending-december-2022#detention}
"detentions_deaths_details"

#' Irregular migration to the UK
#'
#' Number of detected attempts to enter the UK irregularly by method of entry,
#' nationality, region, sex and age group.
#'
#' @format A data frame with 6,503 rows and 9 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Method of entry}{Method of entry}
#'   \item{Nationality}{Nationality}
#'   \item{Region}{Region}
#'   \item{Sex}{Sex}
#'   \item{Age Group}{Age Group}
#'   \item{Number of detections}{Number of detections}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables-year-ending-december-2022#detention}
"irregular_migration"

#' Grant rates at initial decision (quarterly)
#'
#' Grant rate is the proportion of initial decisions which resulted in a grant
#' of protection or other leave.
#'
#' @format A data frame with 9,768 rows and 8 variables:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Quarter}{Quarter}
#'   \item{Nationality}{Nationality}
#'   \item{Region}{Region}
#'   \item{Grant}{Total number of grants at initial decision}
#'   \item{Refused}{Total number of refusals at initial decision}
#'   \item{Initial grant rate}{Initial grant rate - percentage}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables-year-ending-december-2022}
"grant_rates_initial_quarterly"

#' Grant rates at initial decision (annual)
#'
#' Grant rate is the proportion of initial decisions which resulted in a grant
#' of protection or other leave.
#'
#' @format A data frame with 3,182 rows and 6 variables:
#' \describe{
#'   \item{Year}{Year}
#'   \item{Nationality}{Nationality}
#'   \item{Region}{Region}
#'   \item{Grant}{Total number of grants at initial decision}
#'   \item{Refused}{Total number of refusals at initial decision}
#'   \item{Initial grant rate}{Initial grant rate - percentage}
#'   ...
#' }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/immigration-system-statistics-data-tables-year-ending-december-2022}
"grant_rates_initial_annual"
