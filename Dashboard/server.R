server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
        })
        
    points <- eventReactive(input$recalc, {
            cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
        }, ignoreNULL = FALSE)
        
    output$mymap <- renderLeaflet({
            leaflet() %>%
                addProviderTiles(providers$Stamen.TonerLite,
                                 options = providerTileOptions(noWrap = TRUE)
                ) %>%
                addMarkers(data = points())    
    })
}