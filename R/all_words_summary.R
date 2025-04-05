
all_words_summary <- function(df, column = "word") {
  df <- df %>%
    mutate(
      word_temp = .data[[column]],
      length = nchar(word_temp)
    )

  tibble(
    total_words = nrow(df),
    unique_words = n_distinct(df$word_temp),
    avg_length = mean(df$length),
    median_length = median(df$length),
    sd_length = sd(df$length),
    longest_word = df$word_temp[which.max(df$length)],
    shortest_word = df$word_temp[which.min(df$length)]
  )
}

