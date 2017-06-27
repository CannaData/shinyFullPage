#' Include fullPage.js library
#'
#' @param cdn Boolean indicate whether to pull files from CDN
#' @importFrom shiny singleton tagList includeScript includeCSS
#' @export
#'

sfp_include <- function(cdn = TRUE) {
  shiny::singleton(shiny::tagList(
    shiny::includeScript(
      if (cdn)
        "https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.4/jquery.fullpage.min.js"
      else
        system.file(
          package = "shinyFullPage",
          "javascript",
          "fullpage.js",
          "jquery.fullpage.min.js"
        )
    ),
    shiny::includeCSS(
      if (cdn)
        "https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.4/jquery.fullpage.min.css"
      else
        system.file(
          package = "shinyFullPage",
          "javascript",
          "fullpage.js",
          "jquery.fullpage.min.css"
        )
    )
  ))
}

#' @rdname sfp_include
#' @export
#'

sfp_lib <- function(cdn = TRUE) {
  src <-
    if (cdn)
      c(href = "https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.4/")
  else
    c(file = system.file(package = "shinyFullPage", "javascript", "fullpage.js"))
  htmltools::htmlDependency("fullpage.js", "2.9.4", src, script = "jquery.fullpage.min.js", stylesheet = "jquery.fullpage.min.css", 
                            all_files = FALSE)
}