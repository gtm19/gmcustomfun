#' Tidy up column names
#'
#' Removes redundant punctuation and whitespace from data frame
#'
#' @param df a data frame
#'
#' @return a (tidied) data frame
#'
#'
#'
#' @export
#' @import dplyr stringr

cleanColNames <- function(df) {
  require(dplyr)
  require(stringr)

  df %>%
    select_all(str_to_lower) %>%  # make lower case
    select_all(str_replace_all, "(-|—|–|:|;|\\(|\\)|\\{|\\}| )+", "_") %>% # replace multiple instances of common separators with single underscore
    select_all(str_remove_all, "[^[a-z0-9_]]|_$")  # remove anything that's not lowercase letter, number, or underscore. Also remove trailing underscores.

}
