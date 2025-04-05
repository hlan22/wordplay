#' See word length distribution
#'
#' @param df A data frame containing a column of words
#' @param column A character column containing a list of words
#'
#' @returns A word length plot
#' @export
#'
#' @examples
#' dummy_words <- data.frame(word = c("alfa", "bravo", "charlie", "delta"))
#' word_length_plot(dummy_words)
word_length_plot <- function(df, column = "word") {
  df <- df %>% mutate(length = nchar(.data[[column]]))

  ggplot(df, aes(x = length)) +
    geom_bar(fill = "skyblue") +
    geom_text(stat = "count", aes(label = after_stat(count)), vjust = -0.5) +
    labs(title = "Word Length Distribution", x = "Length", y = "Count") +
    theme_minimal()
}
