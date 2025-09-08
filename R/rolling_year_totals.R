#' Rolling year-ending totals from quarterly data
#'
#' Computes rolling sums over the last 4 quarters (a "year-ending" total) for a
#' value column, optionally within groups. You can choose a computation engine
#' that relies only on base R + dplyr (`"cumsum"` or `"lag"`), or base `stats`
#' (`"stats"`). The function arranges by the date column within each group.
#'
#' @param data A data frame or tibble.
#' @param date_col Column holding quarter-end dates (unquoted).
#' @param value_col Numeric column to sum (unquoted).
#' @param out_col Name for the output column (unquoted). Default: `year_total`.
#' @param .group_vars Optional character vector of columns to group by.
#' @param engine Which computation method to use: one of
#'   \code{"cumsum"}, \code{"lag"}, \code{"stats"}.
#'   \itemize{
#'     \item \strong{"cumsum"}: fast and base-friendly: rolling sum via
#'       cumulative sums (\code{cs - lag(cs, 4)}).
#'     \item \strong{"lag"}: explicit sum of \code{x + lag(x,1..3)}.
#'     \item \strong{"stats"}: uses \code{stats::filter()} convolution.
#'   }
#'   Default is \code{"cumsum"}.
#' @param window Integer window length (default 4 for quarters). You can change
#'   this if you ever need different window sizes.
#' @param .complete Logical; if \code{TRUE} (default) the first \code{window-1}
#'   rows per group are set to \code{NA} so only complete windows are returned.
#'   If \code{FALSE}, partial sums are kept.
#' @param na_rm Logical; if \code{TRUE} (default) treat \code{NA} in the value
#'   column as zeros for the purpose of summation. Set \code{FALSE} to propagate
#'   \code{NA}s into the rolling sum.
#'
#' @return A tibble with an added column named \code{out_col}.
#'
#' @examples
#' df <- tibble::tibble(
#'   Date = seq.Date(as.Date("2023-03-31"), by = "3 months", length.out = 8),
#'   Claims = c(100, 120, 90, 110, 95, 130, 105, 115),
#'   Region = rep(c("North", "South"), each = 4)
#' )
#'
#' # Default (cumsum engine), grouped by Region, custom output name
#' rolling_year_totals(df, Date, Claims, out_col = rolling_yr, .group_vars = "Region")
#'
#' # Using the base stats engine
#' rolling_year_totals(df, Date, Claims, out_col = yr_total, engine = "stats")
#'
#' @export
#' @importFrom dplyr group_by arrange mutate lag ungroup across all_of n
#' @importFrom rlang ensym :=
rolling_year_totals <- function(data,
                                date_col,
                                value_col,
                                out_col = year_total,
                                .group_vars = NULL,
                                engine = c("cumsum", "lag", "stats"),
                                window = 4L,
                                .complete = TRUE,
                                na_rm = TRUE) {
  engine   <- match.arg(engine)
  window   <- as.integer(window)
  stopifnot(window >= 1L)

  date_sym  <- rlang::ensym(date_col)
  value_sym <- rlang::ensym(value_col)
  out_sym   <- rlang::ensym(out_col)

  dplyr::group_by(
    data,
    !!!if (is.null(.group_vars)) rlang::list2() else rlang::syms(.group_vars)
  ) |>
    dplyr::arrange(!!date_sym, .by_group = TRUE) |>
    dplyr::mutate(
      !!out_sym := {
        x <- as.numeric(!!value_sym)

        if (!na_rm && any(is.na(x))) {
          # Preserve NA semantics for lag/cumsum approaches
          if (engine == "stats") {
            y <- as.numeric(stats::filter(x, rep(1, window), sides = 1))
          } else if (engine == "lag") {
            parts <- lapply(0:(window - 1L), function(k) dplyr::lag(x, k))
            y <- Reduce(`+`, parts)
          } else { # cumsum with NA-propagation: fall back to lag engine behavior
            parts <- lapply(0:(window - 1L), function(k) dplyr::lag(x, k))
            y <- Reduce(`+`, parts)
          }
        } else {
          # Replace NA with 0 for summation when na_rm = TRUE
          x0 <- if (na_rm) { x[is.na(x)] <- 0; x } else x

          if (engine == "stats") {
            y <- as.numeric(stats::filter(x0, rep(1, window), sides = 1))
          } else if (engine == "lag") {
            parts <- lapply(0:(window - 1L), function(k) dplyr::lag(x0, k))
            y <- Reduce(`+`, parts)
          } else { # cumsum
            cs <- cumsum(x0)
            y  <- cs - dplyr::lag(cs, window, default = 0)
          }
        }

        # Enforce complete windows if requested
        if (.complete) {
          n_g <- dplyr::n()
          if (n_g > 0L && window > 1L) {
            head_idx <- seq_len(min(window - 1L, n_g))
            y[head_idx] <- NA_real_
          }
        }

        y
      }
    ) |>
    dplyr::ungroup()
}
