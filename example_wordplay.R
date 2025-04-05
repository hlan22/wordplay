# here is a run through of all functions on sample data

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(stringr)
library(forcats)
library(stringi)
# library(tidyr)



words_file <- read.csv("~/Downloads/heidis_list_of_good_words.txt",
                  header = FALSE,
                  col.names = c("word", "extra")
                  )
words <- words_file %>%
  select(-c(extra))

# take a basic look at data
head(words)
summary(words)

all_words_summary(words)
summary(word_characteristics(words))
word_length_plot(words)
starting_letter_plot(words)
top_words_plot(words)


dummy_words <- data.frame(word = c("alfa", "bravo", "charlie", "delta"))

nato_alphabet <- data.frame(word = c(
  "Alfa", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot",
  "Golf", "Hotel", "India", "Juliett", "Kilo", "Lima",
  "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo",
  "Sierra", "Tango", "Uniform", "Victor", "Whiskey",
  "X-ray", "Yankee", "Zulu"
))

greek_alphabet <- data.frame(
  word = c(
    "Alpha", "Beta", "Gamma", "Delta", "Epsilon", "Zeta", "Eta", "Theta",
    "Iota", "Kappa", "Lambda", "Mu", "Nu", "Xi", "Omicron", "Pi", "Rho",
    "Sigma", "Tau", "Upsilon", "Phi", "Chi", "Psi", "Omega"
  ))







plot_word_stats <- function(df, column = "word", top_n_words = 15) {
  df <- df %>%
    mutate(
      word = .data[[column]],
      word_length = nchar(word),
      first_letter = str_sub(word, 1, 1),
      first_letter = str_to_lower(first_letter)
    )

  # Histogram of word lengths
  p1 <- ggplot(df, aes(x = word_length)) +
    geom_histogram(binwidth = 1, fill = "skyblue", color = "white") +
    labs(title = "Distribution of Word Lengths", x = "Length", y = "Count") +
    theme_minimal()

  # Bar plot of starting letters
  p2 <- df %>%
    count(first_letter, sort = TRUE) %>%
    ggplot(aes(x = fct_reorder(first_letter, n), y = n)) +
    geom_col(fill = "coral") +
    coord_flip() +
    labs(title = "Frequency of Starting Letters", x = "Starting Letter", y = "Count") +
    theme_minimal()

  # Most common words
  p3 <- df %>%
    count(word, sort = TRUE) %>%
    slice_head(n = top_n_words) %>%
    ggplot(aes(x = fct_reorder(word, n), y = n)) +
    geom_col(fill = "darkseagreen") +
    coord_flip() +
    labs(title = paste("Top", top_n_words, "Most Common Words"), x = "Word", y = "Count") +
    theme_minimal()

  # Optional: Word length by starting letter
  p4 <- df %>%
    group_by(first_letter) %>%
    summarize(avg_length = mean(word_length), .groups = "drop") %>%
    ggplot(aes(x = fct_reorder(first_letter, avg_length), y = avg_length)) +
    geom_col(fill = "mediumpurple") +
    coord_flip() +
    labs(title = "Average Word Length by Starting Letter", x = "Starting Letter", y = "Avg Length") +
    theme_minimal()

  list(
    word_length_histogram = p1,
    starting_letters_plot = p2,
    top_words_plot = p3,
    length_by_letter_plot = p4
  )
}


plots <- plot_word_stats(words)

# Display all plots (one at a time)
print(plots$word_length_histogram)
print(plots$starting_letters_plot)
print(plots$top_words_plot)
print(plots$length_by_letter_plot)



summarize_words <- function(df, column = "word") {
  vowels <- c("a", "e", "i", "o", "u")

  df <- df %>%
    mutate(
      word = .data[[column]],
      word_lower = str_to_lower(word),
      word_length = nchar(word),
      num_vowels = str_count(word_lower, "[aeiou]"),
      num_consonants = str_count(word_lower, "[b-df-hj-np-tv-z]"),
      is_upper = str_detect(word, "^[A-Z]+$"),
      is_lower = str_detect(word, "^[a-z]+$"),
      has_number = str_detect(word, "\\d"),
      has_punctuation = str_detect(word, "[[:punct:]]"),
      is_palindrome = word_lower == str_reverse(word_lower),
      has_repeated_letters = str_detect(word_lower, "(.)\\1")
    )

  df %>%
    summarize(
      total_words = n(),
      unique_words = n_distinct(word),
      avg_length = mean(word_length),
      median_length = median(word_length),
      sd_length = sd(word_length),
      avg_vowels = mean(num_vowels),
      avg_consonants = mean(num_consonants),
      longest_word = word[which.max(word_length)],
      shortest_word = word[which.min(word_length)],
      num_all_upper = sum(is_upper),
      num_all_lower = sum(is_lower),
      num_with_numbers = sum(has_number),
      num_with_punct = sum(has_punctuation),
      num_palindromes = sum(is_palindrome),
      num_with_repeats = sum(has_repeated_letters)
    )
}



plot_word_stats <- function(df, column = "word", top_n_words = 15) {
  df <- df %>%
    mutate(
      word = .data[[column]],
      word_length = nchar(word),
      first_letter = str_sub(word, 1, 1),
      first_letter = str_to_lower(first_letter)
    )

  # Word length histogram
  p1 <- ggplot(df, aes(x = word_length)) +
    geom_bar(fill = "skyblue", color = "white") +
    geom_text(stat = "count", aes(label = ..count..), vjust = -0.5) +
    labs(title = "Distribution of Word Lengths", x = "Length", y = "Count") +
    theme_minimal()

  # Starting letters bar plot (alphabetical order)
  p2 <- df %>%
    count(first_letter) %>%
    filter(!is.na(first_letter)) %>%
    mutate(first_letter = factor(first_letter, levels = letters)) %>%
    ggplot(aes(x = first_letter, y = n)) +
    geom_col(fill = "coral") +
    geom_text(aes(label = n), vjust = -0.5) +
    labs(title = "Frequency of Starting Letters", x = "Starting Letter", y = "Count") +
    theme_minimal()

  # Top N words
  p3 <- df %>%
    count(word, sort = TRUE) %>%
    slice_head(n = top_n_words) %>%
    ggplot(aes(x = fct_reorder(word, n), y = n)) +
    geom_col(fill = "darkseagreen") +
    geom_text(aes(label = n), hjust = -0.2) +
    coord_flip() +
    labs(title = paste("Top", top_n_words, "Most Common Words"), x = "Word", y = "Count") +
    theme_minimal()

  # Word length by starting letter
  p4 <- df %>%
    group_by(first_letter) %>%
    summarize(avg_length = mean(word_length), .groups = "drop") %>%
    mutate(first_letter = factor(first_letter, levels = letters)) %>%
    ggplot(aes(x = first_letter, y = avg_length)) +
    geom_col(fill = "mediumpurple") +
    geom_text(aes(label = round(avg_length, 1)), vjust = -0.5) +
    labs(title = "Average Word Length by Starting Letter", x = "Starting Letter", y = "Avg Length") +
    theme_minimal()

  list(
    word_length_histogram = p1,
    starting_letters_plot = p2,
    top_words_plot = p3,
    length_by_letter_plot = p4
  )
}

summary_stats <- summarize_words(words)
print(summary_stats)

plots <- plot_word_stats(words)
print(plots$word_length_histogram)
print(plots$starting_letters_plot)
print(plots$top_words_plot)
print(plots$length_by_letter_plot)
