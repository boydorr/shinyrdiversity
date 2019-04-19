ui =  navbarPage("Using rdiversity",
                 # Tab 1 - Custom
                 tabPanel("Custom",
                          sidebarLayout(
                            sidebarPanel(
                              radioButtons("customLevel",
                                           label = "Level",
                                           c("Subcommunity", "Metacommunity", "Both")),
                              radioButtons("customMeasure",
                                           label = "Measure",
                                           c("Normalised alpha",
                                             "Raw alpha",
                                             "Normalised beta",
                                             "Raw beta",
                                             "Normalised rho",
                                             "Raw rho",
                                             "Gamma"))
                              , width = 3),
                            mainPanel(
                              plotOutput("customPlot"),
                              rHandsontableOutput('toydata'),
                              actionButton("customButton","Refresh plot")
                            )
                          )),

                 # Tab 2 - Plot
                 tabPanel("Plot",
                          sidebarLayout(
                            sidebarPanel(
                              helpText("Select a dataset."),
                              selectInput("plotDat", "Choose a population:",
                                          choices = c("toy",
                                                      "BCI"),
                                          selected = "toy"),
                              radioButtons("plotLevel",
                                           label = "Level",
                                           c("Subcommunity", "Metacommunity", "Both")),
                              radioButtons("plotMeasure",
                                           label = "Measure",
                                           c("Normalised alpha",
                                             "Raw alpha",
                                             "Normalised beta",
                                             "Raw beta",
                                             "Normalised rho",
                                             "Raw rho",
                                             "Gamma"))
                              , width = 3),
                            mainPanel(
                              textOutput("selected_var"),
                              plotOutput("linePlot")
                            )
                          )),

                 # Tab 3 - What is diversity?
                 tabPanel("What is diversity?",
                          sidebarLayout(position="left",
                                        sidebarPanel(
                                          radioButtons("divtype",
                                                       label = "divtype",
                                                       c("Alpha", "Beta", "Gamma"))),
                                        mainPanel(htmlOutput("whatisdiv")))
                 ),

                 # Tab 4 - What is q?
                 tabPanel("What is q?", mainPanel(verbatimTextOutput("whatisq"))),

                 # Tab 5 - Datasets
                 tabPanel("Datasets",
                          # each tab can have it's own layout
                          sidebarLayout(
                            sidebarPanel(
                              selectInput("dataset", "Choose a population:",
                                          choices = c("true",
                                                      "one",
                                                      "uneven",
                                                      "mixed",
                                                      "even",
                                                      "random",
                                                      "random 50")),
                              actionButton("update", "Update View")
                            ),

                            # Show a plot of the generated distribution
                            mainPanel(
                              plotOutput("diversityPlot")
                            )
                          )
                 )
)

