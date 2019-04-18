#' plot_diversity
#'
plot_diversity <- function() {

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
  )

}
