server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
        })
        
    points <- eventReactive(input$recalc, {
            cbind(rnorm(40) * 0.25 - 76.2, rnorm(40)*0.3 -9.55)
        }, ignoreNULL = FALSE)
        
    output$mymap <- renderLeaflet({
            leaflet() %>%
                addProviderTiles(providers$Stamen.TonerBackground,
                                 options = providerTileOptions(noWrap =TRUE )
                ) %>%
                addMarkers(data = points())    
    })
}