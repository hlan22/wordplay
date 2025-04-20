#' Plot word length distribution
#'
#' @param data A data frame containing a column of words
#' @param column A character column containing a list of words
#'
#' @returns A ggplot2 bar chart showing the distribution of word lengths
#' @export
#'
#' @examples
#' example_words <- data.frame(my_words = c("alfa", "bravo", "charlie", "delta"))
#' word_length_plot(data = example_words, column = "my_words")
#'
#' @importFrom dplyr mutate %>%
#' @importFrom ggplot2 ggplot aes geom_bar geom_text labs theme_bw after_stat
word_length_plot <- function(data, column = "word") {
  # Input checks
  if (!is.data.frame(data)) {
    stop("`data` must be a data frame.")
  }
  if (!column %in% colnames(data)) {
    stop(paste("Column", column, "does not exist in the data frame."))
  }
  if (!is.character(data[[column]]) && !is.factor(data[[column]])) {
    stop(paste("Column", column, "must be of type character or factor."))
  }

  data <- data %>%
    dplyr::mutate(length = nchar(as.character(.data[[column]])))

  ggplot2::ggplot(data, ggplot2::aes(x = length)) +
    ggplot2::geom_bar(fill = "skyblue") +
    ggplot2::geom_text(stat = "count", ggplot2::aes(label = ggplot2::after_stat(count)), vjust = -0.5) +
    ggplot2::labs(title = "Word Length Distribution", x = "Length", y = "Count") +
    ggplot2::theme_bw()
}
