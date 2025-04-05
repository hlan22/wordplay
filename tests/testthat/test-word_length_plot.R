test_that("word_length_plot returns a ggplot object", {
  df <- data.frame(word = c("a", "aa", "aaa", "aaaa"))
  p <- word_length_plot(df)

  expect_s3_class(p, "ggplot")
})
