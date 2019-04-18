#' select_diversity
#'
#' @export
#'
select_diversity <- function(input) {

  if(input$measure == "Normalised alpha") {
    calc <- "norm_alpha"
  } else if(input$measure == "Raw alpha") {
    calc <- "raw_alpha"
  }else if(input$measure == "Normalised beta") {
    calc <- "norm_beta"
  }else if(input$measure == "Raw beta") {
    calc <- "raw_beta"
  }else if(input$measure == "Normalised rho") {
    calc <- "norm_rho"
  }else if(input$measure == "Raw rho") {
    calc <- "raw_rho"
  } else if(input$measure == "Gamma") {
    calc <- "raw_gamma"
  }


  dat <- BCI[1:10,1:50]
  dat <- t(dat)
  meta <- rdiversity::metacommunity(dat)
  qs <-  c(0,.1, .25, .5, .75, 1, 2, 10, 20, 50, 100, Inf)
  # qs <- c(0:2, Inf)
  sp_res <- get(calc)(meta)

  if(input$level == "Subcommunity") res <- rdiversity::subdiv(sp_res, qs)
  if(input$level == "Metacommunity") res <- rdiversity::metadiv(sp_res, qs)
  if(input$level == "Both") {
    sub_res <- rdiversity::subdiv(sp_res, qs)
    meta_res <- rdiversity::metadiv(sp_res, qs)
    res <- rdiversity::rdiv(list(sub_res, meta_res))
  }

  res$partition_name <- as.factor(res$partition_name)

  # ggplot() + theme_bw() + labs(colour = "Partition") +
  #   geom_line(aes(x = q,
  #                 y = diversity,
  #                 group = partition_name,
  #                 colour = partition_name), res)
  ggplot(res)


}
