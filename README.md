
<!-- README.md is generated from README.Rmd. Please edit that file -->

# asylum

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![CRAN
status](https://www.r-pkg.org/badges/version/asylum)](https://cran.r-project.org/package=asylum)
<!-- badges: end -->

The `asylum` package provides easy access to asylum and resettlement
datasets for the UK, published by the Home Office.

## Installation

Install the released version of `asylum` from
[CRAN](https://cran.r-project.org/package=asylum):

``` r
install.packages("asylum")
```

Alternatively, you can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("britishredcrosssociety/asylum")
```

## Example

To calculate the number of applications from Afghanistan awaiting a
decision, as of the latest quarter:

``` r
library(asylum)
library(dplyr)

asylum::awaiting_decision |> 
  filter(Nationality == "Afghanistan" & Date == max(Date)) |> 
  summarise(`Total applications awaiting a decision` = sum(Applications))
#> # A tibble: 1 x 1
#>   `Total applications awaiting a decision`
#>                                      <dbl>
#> 1                                     3213
```

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on
[GitHub](https://github.com/britishredcrosssociety/asylum/issues).

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of
Conduct](https://www.contributor-covenant.org/version/2/0/code_of_conduct/).
By participating in this project you agree to abide by its terms.
