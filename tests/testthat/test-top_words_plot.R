test_that("top_words_plot returns a ggplot object", {
  df <- data.frame(word = c("apple", "banana", "apple", "carrot", "banana", "banana"))
  p <- top_words_plot(df, top_n = 2)

  expect_s3_class(p, "ggplot")
})
