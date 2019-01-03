#' @title A simple function to prefix a character vector with \code{ymd_hms}
#'
#' @param character a character vector
#'
#' @return a character vector, prefixed with a timestamp
#' @export
#'

dateTimeStamp <- function(character) {

  time <- Sys.time()

  paste0(format(time, "%y%m%d_%H%M%S_"), character)

}
