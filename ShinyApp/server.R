library(shiny)
library(shinyjs)

function(input, output, session) {
  # choose columns to display
  # diamonds2 = diamonds[sample(nrow(diamonds), 1000), ]
  data <- read.csv("../data.csv")
  
  output$raw <- DT::renderDataTable({
    DT::datatable(
      data[,c('type', 'date', 'betterDate', 'title', 'norm_info_score', 'abstract')],
      plugins = "ellipsis",
      options = list(
        columnDefs = list(list(
          targets=c(4,6),
          render = DT::JS("$.fn.dataTable.render.ellipsis(50, false )")
        ))
      ),
      filter='top',
      colnames = c('Type', 'Datum', 'Exacte Datum', 'Titel', 'Belangrijkheid (0-1)', 'Inhoud'),
      )
  })
  
  output$txt = renderPrint({
    cat(data[c(input$raw_rows_selected),c('abstract')])
  })
  
  output$bel = renderPrint({
    cat("[score hier]")
  })
  
  output$context <- renderPlot({
    
    # Render a barplot
    barplot(diamonds2$carat)
  })
  
}