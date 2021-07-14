## ui.R ##
library(shinydashboard)

dashboardPage(skin = "red",
    dashboardHeader(title = "Dashboard basicón de la DREM",
                    titleWidth = 320,
                    
    dropdownMenu(type = "messages",
                 messageItem(
                     from = "Sub direción de energía",
                     message = "Ya sale el presupuesto para 12 localidades."
                 ),
                 messageItem(
                     from = "Practicante",
                     message = "A que hora se almuerza?",
                     icon = icon("question"),
                     time = "13:45"
                 ),
                 messageItem(
                     from = "Administración",
                     message = "Acerquence ala sede a recoger su presente.",
                     icon = icon("life-ring"),
                     time = "2021-07-11"
                 )
             ),
    dropdownMenu(type = "notifications",
                 notificationItem(
                     text = "5 administrados atendidos hoy",
                     icon("users")
                 ),
                 notificationItem(
                     text = "12 notificaciones entregadas",
                     icon("truck"),
                     status = "success"
                 ),
                 notificationItem(
                     text = "Actualización del TUPA al 86%",
                     icon = icon("exclamation-triangle"),
                     status = "warning"
                 )
            ),
    dropdownMenu(type = "tasks", badgeStatus = "success",
                 taskItem(value = 90, color = "green",
                          "Documentación"
                 ),
                 taskItem(value = 17, color = "aqua",
                          "expediente 5 provincias"
                 ),
                 taskItem(value = 75, color = "yellow",
                          "Planefa"
                 ),
                 taskItem(value = 80, color = "red",
                          "Ejecución presupestal"
                 )
            )
    ),
    
    ## Sidebar content
    dashboardSidebar(
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
            menuItem("Widgets", tabName = "widgets", icon = icon("th"))
        )
    ),
    
    ## Body content
    dashboardBody(
        tabItems(
            # First tab content
            tabItem(tabName = "dashboard",
                    fluidRow(
                        box(plotOutput("plot1", height = 250)),
                        
                        box(
                            title = "Controles",
                            sliderInput("slider", "Número de observaciones:", 1, 100, 50)
                        )
                    )
            ),
            
            # Second tab content
            tabItem(tabName = "widgets",
                    h2("Contenido del tab: Widgets"),
                   
                    box(leafletOutput("mymap"),
                            p(),
                            actionButton("recalc", "New points"))
                        
                    )
                    
            )
        )
    )
