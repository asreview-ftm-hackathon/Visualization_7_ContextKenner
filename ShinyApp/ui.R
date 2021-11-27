library(shiny)
library(shinyjs)
library(readr)
library(ggplot2)

fluidPage(
  
  # tags$head(
  #   tags$link(rel = "stylesheet", type = "text/css", href = "stylesheet.css")
  # ),
  
  title="ContextKenner",
  
  fluidRow(
    id="header",
    
    h1("ContextKenner"),
    
    p(
      id="intro",
      "Deze ContextKenner kan gebruikt worden om de woorden in de Shell files en hun context te doorzoeken. 
      Type een woord in de Search bar om te beginnen."
    )
    
  ),
  
  fluidRow(
    id="raw",
    
    column(4,
        checkboxGroupInput("show_vars", "Columns:",
                              names(diamonds), selected = names(diamonds))
    ),
    
    column(8,
        DT::dataTableOutput("raw")
    )
    
  ),
  
  fluidRow(
    id = "freq",
    
    column(6,
      h2("Belangrijk?"),
      verbatimTextOutput('bel')
    ),
    
    column(6,
      h2("Locatie"),
      verbatimTextOutput('loc')
    ),    
    
  ),
  
  fluidRow(
    id = "context",
    
    h2("Context"),
    verbatimTextOutput('ctxt'),
    
    plotOutput("context")
    
  )
 
)

