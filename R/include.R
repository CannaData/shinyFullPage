#' Include fullPage.js library
#' 
#' @param cdn Boolean indicate whether to pull files from CDN
#' @importFrom shiny singleton tagList includeScript includeCSS
#' @export
#' 

sfp_include <- function(cdn = TRUE) {
  shiny::singleton(
    shiny::tagList(
      shiny::includeScript(
        if (cdn)
          "https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.4/jquery.fullpage.min.js"
        else
          ""
      ),
      shiny::includeCSS(
        if (cdn)
          "https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.4/jquery.fullpage.min.css"
        else
          ""
      )
    )
  )
}

#' @rdname sfp_include
#' @export
#' 

# sfp_lib <- function(cdn = TRUE) {
#   htmltools::htmlDependency(
#     "fullpage.js", "2.9.4", ""
#   )
# }