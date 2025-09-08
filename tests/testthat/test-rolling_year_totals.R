test_that("engines produce identical results on basic data", {
  skip_on_cran()

  df <- tibble::tibble(
    Date = seq.Date(as.Date("2023-03-31"), by = "3 months", length.out = 8),
    Claims = c(100, 120, 90, 110, 95, 130, 105, 115)
  )

  r_csum  <- rolling_year_totals(df, Date, Claims, out_col = yr, engine = "cumsum")
  r_lag   <- rolling_year_totals(df, Date, Claims, out_col = yr, engine = "lag")
  r_stats <- rolling_year_totals(df, Date, Claims, out_col = yr, engine = "stats")

  expect_equal(r_csum$yr, r_lag$yr)
  expect_equal(r_csum$yr, r_stats$yr)
})

test_that("grouping respected and .complete controls leading NAs", {
  skip_on_cran()

  df <- tibble::tibble(
    Date = rep(seq.Date(as.Date("2023-03-31"), by = "3 months", length.out = 6), 2),
    Claims = c(10, 20, 30, 40, 50, 60,   1, 2, 3, 4, 5, 6),
    Region = rep(c("North", "South"), each = 6)
  )

  # .complete = TRUE (default): first 3 rows per group should be NA for window=4
  res_true <- rolling_year_totals(df, Date, Claims, out_col = yr, .group_vars = "Region")
  by_grp <- split(res_true, res_true$Region)

  expect_true(all(is.na(by_grp$North$yr[1:3])))
  expect_true(all(is.na(by_grp$South$yr[1:3])))

  # Check a known value (North group, 4th row)
  # North Claims: 10 + 20 + 30 + 40 = 100 at 4th row
  expect_equal(by_grp$North$yr[4], 100)

  # .complete = FALSE: partial sums retained
  res_false <- rolling_year_totals(df, Date, Claims, out_col = yr,
                                   .group_vars = "Region", .complete = FALSE)

  # North first 4 rows should be: 10, 30, 60, 100
  expect_equal(res_false$yr[res_false$Region == "North"][1:4], c(10, 30, 60, 100))
})

test_that("NA handling: na_rm = TRUE treats NA as 0; na_rm = FALSE propagates NA", {
  skip_on_cran()

  df <- tibble::tibble(
    Date = seq.Date(as.Date("2023-03-31"), by = "3 months", length.out = 6),
    Claims = c(5, NA, 7, 8, 9, 10) # one NA in window
  )

  # With na_rm = TRUE, NA treated as 0 → at 4th row: 5 + 0 + 7 + 8 = 20
  res_true <- rolling_year_totals(df, Date, Claims, out_col = yr,
                                  engine = "cumsum", na_rm = TRUE)
  expect_equal(res_true$yr[4], 20)

  # With na_rm = FALSE, any NA in window ⇒ result NA at 4th row
  res_false <- rolling_year_totals(df, Date, Claims, out_col = yr,
                                   engine = "lag", na_rm = FALSE)
  expect_true(is.na(res_false$yr[4]))

  # Engines should agree under the same NA policy
  res_true_lag <- rolling_year_totals(df, Date, Claims, out_col = yr,
                                      engine = "lag", na_rm = TRUE)
  expect_equal(res_true$yr, res_true_lag$yr)
})
