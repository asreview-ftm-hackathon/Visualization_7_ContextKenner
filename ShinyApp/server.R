library(shiny)
library(shinyjs)

function(input, output, session) {
  # choose columns to display
  # diamonds2 = diamonds[sample(nrow(diamonds), 1000), ]
  output$raw <- DT::renderDataTable({
    DT::datatable(diamonds[, input$show_vars, drop = FALSE])
  })
  
  output$bel = renderPrint({
    cat('Het woord', input$raw_search, 'krijgt een belangrijkheidsscore van:\n\n')
    cat("[score hier]")
  })
  
  output$loc = renderPrint({
    cat('Het woord', input$raw_search, 'komt in deze stukken voor:\n\n')
    cat(input$raw_rows_all, sep = ', ')
    cat('\n\nSelected rows:\n\n')
    cat(input$raw_rows_selected, sep = ', ')
  })
  
  output$ctxt = renderPrint({
    cat('Het woord', input$raw_search, 'komt in deze context vaak voor:\n\n')
  })
  
  output$context <- renderPlot({
    
    # Render a barplot
    barplot(diamonds2$carat)
  })
  
}