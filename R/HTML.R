#' HTML Wrappers
#'
#' @param id HTML id
#' @param ... Additional parameters passed onto \code{div}
#' @param options List of options see notes
#' @note \url{}
#' @importFrom jsonlite toJSON
#' @export
#'

sfp_fullpage <- function(id, ..., options = NULL) {
  stopifnot(all(vapply(list(...), function(x) {
    x$name == "div" && x$attribs$class == "section"
  }, logical(1))))
  call <- match.call()
  call[[1]] <-  htmltools::div
  shiny::tagList(shiny::tags$script(shiny::HTML(paste0(
    "$(document).ready(function() {",
    "$('#", id, "').fullpage(",
    jsonlite::toJSON(options)
    , ");",
    "})"
  ))),
  eval(call, parent.frame()))
}

#' @rdname sfp_fullpage
#' @export
#'

sfp_section <- function(...) {
  call <- match.call()
  call$class <- c("section", call$class)
  call[[1]] <-  htmltools::div
  eval(call, parent.frame())
}

#' @rdname sfp_fullpage
#' @export
#'

sfp_slide <- function(...) {
  call <- match.call()
  call$class <- c("slide", call$class)
  call[[1]] <-  htmltools::div
  eval(call, parent.frame())
}