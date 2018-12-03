#' Tidy up column names
#'
#' Removes redundant punctuation and whitespace from data frame
#'
#' @param df a data frame
#'
#' @return a (tidied) data frame
#'
#' @importFrom dplyr select_all
#' @importFrom stringr str_to_lower str_replace_all str_remove_all
#' @import magrittr
#'
#' @export

cleanColNames <- function(df) {

  df %>%
    dplyr::select_all(stringr::str_to_lower) %>%  # make lower case
    dplyr::select_all(stringr::str_replace_all, "(-|—|–|:|;|\\(|\\)|\\{|\\}| )+", "_") %>% # replace multiple instances of common separators with single underscore
    dplyr::select_all(stringr::str_remove_all, "[^[a-z0-9_]]|_$")  # remove anything that's not lowercase letter, number, or underscore. Also remove trailing underscores.

}
