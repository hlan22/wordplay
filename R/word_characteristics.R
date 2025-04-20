#' An in-depth summary of each word
#'
#' @param data A data frame containing a column of words
#' @param column A character column containing a list of words
#'
#' @returns A data frame
#' @export
#'
#' @examples
#' example_words <- data.frame(word_column = c("alfa", "bravo", "charlie", "delta", "civic"))
#' word_characteristics(data = example_words, column = "word_column")
#'
#' @importFrom dplyr mutate select %>%
#' @importFrom stringr str_to_lower str_count str_detect
#' @importFrom stringi stri_reverse
word_characteristics <- function(data, column = "word") {
  # Input checks
  if (!is.data.frame(data)) {
    stop("`data` must be a data frame.")
  }
  if (!column %in% colnames(data)) {
    stop(paste("Column", column, "does not exist in the data frame."))
  }
  if (!is.character(data[[column]]) && !is.factor(data[[column]])) {
    stop(paste("Column", column, "must be of type character or factor."))
  }

  data %>%
    dplyr::mutate(
      word = as.character(.data[[column]]),
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
