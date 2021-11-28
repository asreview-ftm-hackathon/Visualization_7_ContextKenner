library(shiny)
library(shinyjs)

function(input, output, session) {
  data <- read.csv("data/data.csv")
  
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
  
}