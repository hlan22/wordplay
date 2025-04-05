# all code run in Rstudio terminal to get package working

library(devtools)
#> Loading required package: usethis

packageVersion("devtools")

create_package("~/git/wordplay")

library(devtools)

use_git()
#> ✔ Initialising Git repo.
#> ✔ Adding ".Rhistory", ".Rdata", ".httr-oauth", ".DS_Store", and
#>   ".quarto" to '.gitignore'.


use_r("all_words_summary")
use_r("starting_letter_plot")
use_r("top_words_plot")
use_r("word_characteristics")
use_r("word_length_plot")

load_all()

exists("all_words_summary", where = globalenv(), inherits = FALSE)
#> [1] FALSE

# (in terminal)
# git remote add origin https://github.com/hlan22/wordplay.git
# git remove -v # verifies your push/fetch connection

check()

use_mit_license()

# updated .Rbuildignore

check()

document()

?word_length_plot








