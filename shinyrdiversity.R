#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(reshape2)
library(vegan)
library(ggplot2)
library(rdiversity)
library(ggrdiversity)
data(BCI)

ui = navbarPage("Using navbar",
                tabPanel("Plot",
                         # each tab can have it's own layout
                         sidebarLayout(
                           sidebarPanel(
                             radioButtons("level",
                                          label = "Level",
                                          c("Subcommunity", "Metacommunity")),
                             radioButtons("measure",
                                          label = "Measure",
                                          c("Normalised alpha",
                                            "Raw alpha",
                                            "Normalised beta",
                                            "Raw beta",
                                            "Normalised rho",
                                            "Raw rho",
                                            "Gamma"))
                           ),
                           mainPanel(plotOutput("line"))
                         )
                ),
                tabPanel("Summary",verbatimTextOutput("summary"))
                #,
               # tabPanel("3",verbatimTextOutput("summary"))
)






server = function(input,output){

  output$line = renderPlot({
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

    # ggplot(res)
    ggplot() + geom_line(aes(x = q,
                             y = diversity,
                             group = partition_name,
                             colour = partition_name), res)

  })
  output$summary = renderPrint(summary(dat()[,c("length","rating")]))
}


# Run the application
shinyApp(ui = ui, server = server)

