# A run-through of all functions on sample data

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(stringr)
library(forcats)
library(stringi)

# load package
pak::pak("hlan22/wordplay")
library(wordplay)

mywords <- read.csv("~/Downloads/heidis_good_words.txt",
                  header = TRUE)

# take a basic look at data
head(mywords)
str(mywords)
summary(mywords)

# use package functions
all_words_summary(mywords)
summary(word_characteristics(mywords))
word_length_plot(mywords)
top_words_plot(mywords)

# Can also try with a lot of other examples!
dummy_words <- data.frame(word = c("alfa", "bravo", "charlie", "delta"))

nato_alphabet <- data.frame(
  word = c(
    "Alfa", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf",
    "Hotel", "India", "Juliett", "Kilo", "Lima", "Mike", "November",
    "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform",
    "Victor", "Whiskey", "X-ray", "Yankee", "Zulu"))

greek_alphabet <- data.frame(
  word = c(
    "Alpha", "Beta", "Gamma", "Delta", "Epsilon", "Zeta", "Eta", "Theta",
    "Iota", "Kappa", "Lambda", "Mu", "Nu", "Xi", "Omicron", "Pi", "Rho",
    "Sigma", "Tau", "Upsilon", "Phi", "Chi", "Psi", "Omega"))

# And test out the functions :)
all_words_summary(greek_alphabet)
word_characteristics(greek_alphabet)
word_length_plot(greek_alphabet)
top_words_plot(greek_alphabet)
