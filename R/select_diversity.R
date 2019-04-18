#' select_diversity
#'
#' @export
#'
select_diversity <- function(input) {

    if(input$level == "Subcommunity") {
      if(input$measure == "Normalised alpha") {
        calc <- "norm_sub_alpha"
      } else if(input$measure == "Raw alpha") {
        calc <- "raw_sub_alpha"
      }else if(input$measure == "Normalised beta") {
        calc <- "norm_sub_beta"
      }else if(input$measure == "Raw beta") {
        calc <- "raw_sub_beta"
      }else if(input$measure == "Normalised rho") {
        calc <- "norm_sub_rho"
      }else if(input$measure == "Raw rho") {
        calc <- "raw_sub_rho"
      } else if(input$measure == "Gamma") {
        calc <- "sub_gamma"
      }
    }else if(input$level == "Metacommunity") {
      if(input$measure == "Normalised alpha") {
        calc <- "norm_meta_alpha"
      } else if(input$measure == "Raw alpha") {
        calc <- "raw_meta_alpha"
      }else if(input$measure == "Normalised beta") {
        calc <- "norm_meta_beta"
      }else if(input$measure == "Raw beta") {
        calc <- "raw_meta_beta"
      }else if(input$measure == "Normalised rho") {
        calc <- "norm_meta_rho"
      }else if(input$measure == "Raw rho") {
        calc <- "raw_meta_rho"
      } else if(input$measure == "Gamma") {
        calc <- "meta_gamma"
      }
    }
    dat <- BCI[1:10,1:50]
    dat <- t(dat)
    meta <- metacommunity(dat)
    # res <- get(calc)(meta, 0:2)
    qs <-  c(.1, .25, .5, .75, 1, 2, 10, 20, 50, 100, Inf)
    # qs <- c(0:2, Inf)
    res <- get(calc)(meta, qs)

    ggplot() + geom_line(aes(x = q,
                             y = diversity,
                             group = partition_name,
                             colour = partition_name), res)


}
