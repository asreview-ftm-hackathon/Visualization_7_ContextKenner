library(shiny)
library(shinyjs)
library(readr)
library(ggplot2)

fluidPage(
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "stylesheet.css")
  ),
  
  title="ContextKenner",
  
  fluidRow(
    id="header",
    
    column(12,
      h1("ContextKenner"),
           
      p(id="intro",
      "Deze ContextKenner kan gebruikt worden om de woorden in de Shell files en hun context te doorzoeken.
      Onderstaande tabel rangschikt de Shell files op informatierijkheid.
      Type een woord in de zoekbalk om de belangrijkste stukken met die term te vinden."
      )
    )
    
  ),
  
  fluidRow(
    id="data",
    
    column(12,
        DT::dataTableOutput("raw")
    )
    
  ),
  
  fluidRow(
    id="txt",
    
    column(12,
      verbatimTextOutput('txt')
    )
    
  )
 
)

