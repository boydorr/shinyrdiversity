server = function(input,output){
  output$line =  renderPlot({select_diversity(input)})

  output$summary = renderPrint(summary(dat()[,c("length","rating")]))

  output$whatisdiv = renderPrint(whatisdiv(input))

  output$whatisq = renderPrint(whatisq())

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
           "mixed"=mixed.pop, "even"=even.pop, "random"=rand.pop, "random50"=rand50.pop)
  }, ignoreNULL = FALSE)

}
