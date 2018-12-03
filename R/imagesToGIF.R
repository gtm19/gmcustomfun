#' Convert a directory of images to .gif using \code{magick}
#'
#' @param image_directory directory including images whose filenames, when sorted, are in order. Opens dialog if left \code{NULL}.
#' @param output_filename name of output file. Opens dialog if left \code{NULL}.
#' @param scale specify size (in pixels) of longest dimension of image
#' @param filetype filetype of image file. Defaults to \code{png}
#' @param ... additional arguments to be passed to \code{image_animate}
#'
#' @return returns nothing in the environment - but creates gif of images externally
#' @import magick
#' @importFrom utils choose.dir
#' @export
#'

imagesToGIF <- function(image_directory = NULL, output_filename = NULL, scale = NULL, filetype = "png", ...){

  if (is.null(image_directory)) {
    image_directory <- choose.dir(caption = "Select directory containing image files")
  }

  frames <-
    dir(image_directory, full.names = TRUE, pattern = filetype, ignore.case = TRUE) %>%
    sort()

  images <-
    magick::image_read(frames) %>%
    magick::image_scale(geometry = if(is.null(scale)) NULL else as.character(scale))

  animation <-
   if(length(list(...)) == 0) magick::image_animate(images) else magick::image_animate(images, ...)

  if (is.null(output_filename)) {
    output_filename <- file.choose(new = TRUE)
  }

  magick::image_write(animation, output_filename)

}
