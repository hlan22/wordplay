#' An in-depth summary of each word
#'
#' @param df A data frame containing a column of words
#' @param column A character column containing a list of words
#'
#' @returns A data frame
#' @export
#'
#' @examples
#' dummy_words <- data.frame(word = c("alfa", "bravo", "charlie", "delta"))
#' word_characteristics(dummy_words)
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
