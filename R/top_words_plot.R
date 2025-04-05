
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
