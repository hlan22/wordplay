#' A high level summary about all the words
#'
#' @param data A data frame containing a column of words
#' @param column A character column containing a list of words
#'
#' @returns A tibble
#' @export
#'
#' @examples
#' example_words <- data.frame(word_column = c("alfa", "bravo", "charlie", "delta"))
#' all_words_summary(data = example_words, column = "word_column")
#'
#' @importFrom dplyr mutate n_distinct %>%
#' @importFrom tibble tibble
#' @importFrom stats median sd
all_words_summary <- function(data, column = "word") {
  # checks for input data types
  if (!is.data.frame(data)) {
    stop("`data` must be a data frame.")
  }
  if (!column %in% colnames(data)) {
    stop(paste("Column", column, "does not exist in the data frame."))
  }
  if (!is.character(data[[column]]) && !is.factor(data[[column]])) {
    stop(paste("Column", column, "must be of type character or factor."))
  }

  df <- data %>%
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
