#' @title Read all sheets from an xlsx or xls file into R as a list
#'
#' @description Simple function which reads all sheets from an \code{xlsx} or \code{xls} file into a list
#'
#' @param filename the path of an \code{xlsx} or \code{xls} file.
#' @param ... additional arguments to be passed to \link[readxl]{read_xlsx}.
#'
#' @return a list of data frames: one for each sheet in the source file
#' @importFrom readxl excel_sheets read_xlsx read_xls
#' @importFrom stringr str_extract str_to_lower
#' @importFrom purrr map
#' @import magrittr
#' @export
#'

readAllSheets <- function(filename, ...) {

  variables <-
    list(...)

  extension <-
    str_extract(filename, "(?<=\\.).{3,4}$") %>%
    str_to_lower()

  if (extension != "xls" & extension != "xlsx") {
    stop("Filename must have either xlsx or xls extension")
  }

  sheets <- readxl::excel_sheets(filename)

  if (extension == "xlsx") {
    list <-
      sheets %>%
      purrr::map(~{
        if(length(variables) == 0) readxl::read_xlsx(filename, sheet = .x) else readxl::read_xlsx(filename, sheet = .x, ...)
      })
  }

  if (extension == "xls") {
    list <-
      sheets %>%
      purrr::map(~{
        if(length(variables) == 0) readxl::read_xls(filename, sheet = .x) else readxl::read_xls(filename, sheet = .x, ...)
      })
  }

  names(list) <- sheets

  return(list)
}
