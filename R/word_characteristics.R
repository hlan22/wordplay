
word_characteristics <- function(df, column = "word") {
  df %>%
    mutate(
      word = .data[[column]],
      word_lower = str_to_lower(word),
      length = nchar(word),
      vowels = str_count(word_lower, "[aeiou]"),
      consonants = str_count(word_lower, "[b-df-hj-np-tv-z]"),
      is_palindrome = word_lower == stri_reverse(word_lower),
      has_repeated_letters = str_detect(word_lower, "(.)\\1")
    ) %>%
    select(word, length, vowels, consonants, is_palindrome, has_repeated_letters)
}
