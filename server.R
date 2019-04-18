server = function(input,output){
  output$line = select_diversity(input)
  output$summary = renderPrint(summary(dat()[,c("length","rating")]))
}

