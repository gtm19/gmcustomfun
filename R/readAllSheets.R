#' Read all sheets from an xlsx file into R as a list
#'
#' @param filename the path of an \code{xlsx} file
#' @param ... additional arguments passed to read_xlsx
#'
#' @return a list of data frames: one for each sheet in the source file
#' @importFrom readxl excel_sheets read_xlsx
#' @importFrom purrr map
#' @import magrittr
#' @export
#'

readAllSheets <- function(filename, ...) {

  sheets <- readxl::excel_sheets(filename)

  list <-
    sheets %>%
    purrr::map(~{
      readxl::read_xlsx(filename, .x, ...)
    })

  return(list)
}
