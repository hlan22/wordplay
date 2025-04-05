
starting_letter_plot <- function(df, column = "word") {
  all_letters <- tibble(first_letter = letters)

  df_letters <- df %>%
    mutate(first_letter = str_to_lower(str_sub(.data[[column]], 1, 1))) %>%
    count(first_letter) %>%
    filter(!is.na(first_letter))

  full_df <- all_letters %>%
    left_join(df_letters, by = "first_letter") %>%
    mutate(n = coalesce(n, 0),
           first_letter = factor(first_letter, levels = letters))

  ggplot(full_df, aes(x = first_letter, y = n)) +
    geom_col(fill = "coral") +
    geom_text(aes(label = n), vjust = -0.5) +
    labs(title = "Starting Letter Frequencies", x = "Letter", y = "Count") +
    theme_minimal()
}
