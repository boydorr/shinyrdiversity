ui = navbarPage("Using navbar",
                # plot_diversity(),

                tabPanel("What is q?", mainPanel(verbatimTextOutput("whatisq"))),

                tabPanel("What is diversity?",
                          sidebarLayout(position="left",
                                         sidebarPanel(
                                           radioButtons("divtype",
                                                         label = "divtype",
                                                         c("Alpha", "Beta", "Gamma"))),
                         mainPanel(htmlOutput("whatisdiv")))
                         ),

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

)
