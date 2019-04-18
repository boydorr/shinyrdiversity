ui = navbarPage("Using navbar",
                tabPanel("Plot",
                         # each tab can have it's own layout
                         sidebarLayout(
                           sidebarPanel(
                             radioButtons("level",
                                          label = "Level",
                                          c("Subcommunity", "Metacommunity", "Both")),
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
                         )),
                tabPanel("What is diversity?",
                         sidebarLayout(position="left",
                                       sidebarPanel(
                                         radioButtons("divtype",
                                                      label = "divtype",
                                                      c("Alpha", "Beta", "Gamma"))),
                                       mainPanel(htmlOutput("whatisdiv")))
                ),
                tabPanel("What is q?", mainPanel(verbatimTextOutput("whatisq"))),
                tabPanel("Datasets",
                         # each tab can have it's own layout
                         sidebarLayout(
                           sidebarPanel(
                             selectInput("dataset", "Choose a population:",
                                         choices = c("true", "one", "uneven", "mixed", "even", "random", "random 50")),
                             actionButton("update", "Update View")
                           ),

                           # Show a plot of the generated distribution
                           mainPanel(
                             plotOutput("diversityPlot")
                           )
                         )
                )
)
