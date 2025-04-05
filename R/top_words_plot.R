#' See most common words in list
#'
#' @param df A data frame containing a column of words
#' @param column A character column containing a list of words
#' @param top_n An integer that specifies how many words you want in the plot
#'
#' @returns A top words plot
#' @export
#'
#' @examples
#' dummy_words <- data.frame(word = c("alfa", "bravo", "charlie", "delta"))
#' top_words_plot(dummy_words)
top_words_plot <- function(df, column = "word", top_n = 6) {
  df %>%
    count(word = .data[[column]], sort = TRUE) %>%
    slice_head(n = top_n) %>%
    ggplot(aes(x = fct_reorder(word, n), y = n)) +
    geom_col(fill = "darkseagreen") +
    geom_text(aes(label = n), hjust = -0.2) +
    coord_flip() +
    labs(title = paste("Top", top_n, "Words"), x = "Word", y = "Count") +
    theme_minimal()
}
