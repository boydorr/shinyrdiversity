server = function(input,output){
  output$line =  renderPlot({select_diversity(input)})
  output$summary = renderPrint(summary(dat()[,c("length","rating")]))
}

