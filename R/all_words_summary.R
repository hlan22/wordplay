#' A high level summary about all the words
#'
#' @param df A data frame containing a column of words
#' @param column A character column containing a list of words
#'
#' @returns A tibble
#' @export
#'
#' @examples
#' dummy_words <- data.frame(word = c("alfa", "bravo", "charlie", "delta"))
#' all_words_summary(dummy_words)
#' @importFrom dplyr mutate n_distinct %>%
#' @importFrom tibble tibble
#' @importFrom stats median sd
all_words_summary <- function(df, column = "word") {
  df <- df %>%
    dplyr::mutate(
      word_temp = .data[[column]],
      length = nchar(word_temp))

  tibble::tibble(
    total_words = nrow(df),
    unique_words = dplyr::n_distinct(df$word_temp),
    avg_length = mean(df$length),
    median_length = stats::median(df$length),
    sd_length = stats::sd(df$length),
    longest_word = df$word_temp[which.max(df$length)],
    shortest_word = df$word_temp[which.min(df$length)]
  )
}
