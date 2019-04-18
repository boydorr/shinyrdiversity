
#'@name whatisdiv
#'
#'@export

whatisdiv <- function(input)

{
  if(input$divtype == "Alpha")
    {
      divdesc <- "<p> <b>Reminder</b>: A population consists of individuals of a single species, while a community consists of multiple populations (i.e. multiple species).
                  <br>
                  Alpha diversity is a measure of diversity of a single community defined by e.g. spatial constraint or habitat.
                  At the subcommunity level, it measures the diversity of each subcommunity (this can be calculated without reference to the whole metacommunity).
                  At the metacommunity level, the alpha diversity measure considers multiple subcommunities as a single one. </p>"
    }

  if(input$divtype == "Beta")
    {
      divdesc <- "raw_sub_alpha"
    }

  if(input$divtype == "Gamma")
    {
      divdesc <- "raw_sub_alpha"
    }


  return(divdesc)
}
