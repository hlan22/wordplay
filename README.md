
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wordplay

<!-- badges: start -->
<!-- badges: end -->

The goal of wordplay is to learn more about your favorite list of words!

## Installation

You can install the development version of wordplay from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("hlan22/wordplay")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(wordplay)
greek_alphabet <- data.frame(
  word = c(
    "Alpha", "Beta", "Gamma", "Delta", "Epsilon", "Zeta", "Eta", "Theta",
    "Iota", "Kappa", "Lambda", "Mu", "Nu", "Xi", "Omicron", "Pi", "Rho",
    "Sigma", "Tau", "Upsilon", "Phi", "Chi", "Psi", "Omega"
  ))
all_words_summary(greek_alphabet)
#> # A tibble: 1 × 7
#>   total_words unique_words avg_length median_length sd_length longest_word
#>         <int>        <int>      <dbl>         <dbl>     <dbl> <chr>       
#> 1          24           24       4.17             4      1.61 Epsilon     
#> # ℹ 1 more variable: shortest_word <chr>
word_characteristics(greek_alphabet)
#>       word length vowels consonants is_palindrome has_repeated_letters
#> 1    Alpha      5      2          3         FALSE                FALSE
#> 2     Beta      4      2          2         FALSE                FALSE
#> 3    Gamma      5      2          3         FALSE                 TRUE
#> 4    Delta      5      2          3         FALSE                FALSE
#> 5  Epsilon      7      3          4         FALSE                FALSE
#> 6     Zeta      4      2          2         FALSE                FALSE
#> 7      Eta      3      2          1         FALSE                FALSE
#> 8    Theta      5      2          3         FALSE                FALSE
#> 9     Iota      4      3          1         FALSE                FALSE
#> 10   Kappa      5      2          3         FALSE                 TRUE
#> 11  Lambda      6      2          4         FALSE                FALSE
#> 12      Mu      2      1          1         FALSE                FALSE
#> 13      Nu      2      1          1         FALSE                FALSE
#> 14      Xi      2      1          1         FALSE                FALSE
#> 15 Omicron      7      3          4         FALSE                FALSE
#> 16      Pi      2      1          1         FALSE                FALSE
#> 17     Rho      3      1          2         FALSE                FALSE
#> 18   Sigma      5      2          3         FALSE                FALSE
#> 19     Tau      3      2          1         FALSE                FALSE
#> 20 Upsilon      7      3          4         FALSE                FALSE
#> 21     Phi      3      1          2         FALSE                FALSE
#> 22     Chi      3      1          2         FALSE                FALSE
#> 23     Psi      3      1          2         FALSE                FALSE
#> 24   Omega      5      3          2         FALSE                FALSE
word_length_plot(greek_alphabet)
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r
top_words_plot(greek_alphabet)
```

<img src="man/figures/README-example-2.png" width="100%" />
