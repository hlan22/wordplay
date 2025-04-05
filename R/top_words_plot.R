#' Top words bar plot
#'
#' See most common words in a column of a dataframe.
#'
#' @param df A data frame containing a column of words
#' @param column A character column containing a list of words
#' @param top_n An integer that specifies how many words you want in the plot
#'
#' @returns A ggplot2 bar chart of the most common words
#' @export
#'
#' @examples
#' dummy_words <- data.frame(word = c("alfa", "bravo", "charlie", "delta"))
#' top_words_plot(dummy_words)
#' @importFrom dplyr slice_head %>% count
#' @importFrom ggplot2 ggplot aes geom_col geom_text labs theme_minimal coord_flip
#' @importFrom forcats fct_reorder
top_words_plot <- function(df, column = "word", top_n = 6) {
  df %>%
    dplyr::count(word = .data[[column]], sort = TRUE) %>%
    dplyr::slice_head(n = top_n) %>%
    ggplot2::ggplot(aes(x = forcats::fct_reorder(word, n), y = n)) +
    geom_col(fill = "darkseagreen") +
    geom_text(aes(label = n), hjust = -0.2) +
    coord_flip() +
    labs(title = paste("Top", top_n, "Words"),
         x = "Word", y = "Count") +
    theme_minimal()
}
