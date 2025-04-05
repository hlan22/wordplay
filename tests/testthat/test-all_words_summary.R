test_that("all_words_summary returns correct summary", {
  df <- data.frame(word = c("alpha", "beta", "gamma", "delta"))
  result <- all_words_summary(df)

  expect_named(result, c("total_words", "unique_words", "avg_length",
                         "median_length", "sd_length", "longest_word", "shortest_word"))
  expect_equal(result$total_words, 4)
  expect_equal(result$unique_words, 4)
  expect_true(is.numeric(result$avg_length))
})
