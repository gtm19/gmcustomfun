#' Create typical project subfolders
#'
#' @param location where to create the subfolders. Defaults to working directory
#' @param folders vector of strings specifying the names of folders to create
#'
#' @return logical vector confirming whether folder was created or not
#' @export
createSubstructure <- function(location = getwd(), folders = c("analysis", "src", "data", "output", "doc", "ext")) {

    sapply(paste(location, folders, sep = "/"), dir.create)

}


