test_that("word_characteristics adds correct columns", {
  df <- data.frame(word = c("radar", "hello", "book", "sky"))
  result <- word_characteristics(df)

  expect_named(result, c("word", "length", "vowels", "consonants", "is_palindrome", "has_repeated_letters"))
  expect_equal(result$is_palindrome[1], TRUE)
  expect_equal(result$has_repeated_letters[3], TRUE)  # "book"
})
