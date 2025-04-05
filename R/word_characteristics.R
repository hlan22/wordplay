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
#' @importFrom dplyr mutate select %>%
#' @importFrom stringr str_to_lower str_count str_detect
#' @importFrom stringi stri_reverse
word_characteristics <- function(df, column = "word") {
  df %>%
    dplyr::mutate(
      word = .data[[column]],
      word_lower = stringr::str_to_lower(word),
      length = nchar(word),
      vowels = stringr::str_count(word_lower, "[aeiou]"),
      consonants = stringr::str_count(word_lower, "[b-df-hj-np-tv-z]"),
      is_palindrome = word_lower == stringi::stri_reverse(word_lower),
      has_repeated_letters = stringr::str_detect(word_lower, "(.)\\1")
    ) %>%
    dplyr::select(word, length, vowels, consonants,
           is_palindrome, has_repeated_letters)
}
