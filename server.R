server = function(input,output,session){

  # Tab 1 - Custom

  values <- reactiveValues()
  values$editted <- bigtoy

  output$toydata <- renderRHandsontable({
    rhandsontable(bigtoy)
  })

  observeEvent(input$runButton, {
    values$editted <- hot_to_r(input$toydata)
  })

  output$customPlot =  renderPlot({
    dat <- values$editted
    select_diversity(dat, input$measure, input$level)
  })


  # Tab 2 - Plot
  output$linePlot =  renderPlot({
    dat <- switch(input$dat,
                  "BCI" = t(BCI),
                  "toy" = toy)
    select_diversity(dat, input$measure, input$level)
  })

  # Tab 3 - What is diversity?
  output$whatisdiv = renderPrint(whatisdiv(input))

  # Tab 4 - What is q?
  output$whatisq = renderPrint(whatisq())

  # Tab 5 - Datasets
  output$diversityPlot = renderPlot({

    #warnings suppressed for tidier output
    nora <- suppressWarnings(norm_sub_alpha(metacommunity(datasetInput()), qvals))

    ggplot() + geom_line(aes(x = q,
                             y = diversity,
                             group = partition_name,
                             colour = partition_name), nora)

  })

  datasetInput <- eventReactive(input$update, {
    switch(input$dataset,
           "true"=tree.pop,
           "one"=one.pop,
           "uneven"=uneven.pop,
           "mixed"=mixed.pop,
           "even"=even.pop,
           "random"=rand.pop,
           "random50"=rand50.pop)},
    ignoreNULL = FALSE)

}
