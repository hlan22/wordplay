#' Plot the most common words in a column of a dataframe.
#'
#' @param data A data frame containing a column of words
#' @param column A character column containing a list of words
#' @param top_n An integer that specifies how many words you want in the plot
#'
#' @returns A ggplot2 bar chart of the most common words
#' @export
#'
#' @examples
#' example_words <- data.frame(word_column = c("alfa", "bravo", "charlie", "delta", "alfa"))
#' top_words_plot(example_words, column = "word_column", top_n = 4)
#'
#' @importFrom dplyr slice_head %>% count
#' @importFrom ggplot2 ggplot aes geom_col geom_text labs theme_bw coord_flip
#' @importFrom forcats fct_reorder
top_words_plot <- function(data, column = "word", top_n = 6) {
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
  if (!is.numeric(top_n) || length(top_n) != 1 || top_n < 1) {
    stop("`top_n` must be a single positive integer.")
  }

  data %>%
    dplyr::count(word = .data[[column]], sort = TRUE) %>%
    dplyr::slice_head(n = top_n) %>%
    ggplot2::ggplot(ggplot2::aes(x = forcats::fct_reorder(word, .data$n), y = .data$n)) +
    ggplot2::geom_col(fill = "darkseagreen") +
    ggplot2::geom_text(ggplot2::aes(label = .data$n), hjust = -0.2) +
    ggplot2::coord_flip() +
    ggplot2::labs(
      title = paste("Top", top_n, ifelse(top_n == 1, "Word", "Words")),
      x = "Word", y = "Count"
    ) +
    ggplot2::theme_bw()
}



