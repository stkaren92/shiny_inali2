shinyUI(navbarPage(
  theme = shinytheme("flatly"),
  title = "",

    tabPanel('Local leanguage', 
           # Define UI for slider demo application
           shinyUI(fluidPage(
             #Application title
             titlePanel("Maíz en diferentes lenguas de México"),
             width = 1)),
           fluidRow(column(9,
                           htmlOutput("Treeplot1", width = "1000", height = "600"))
                    )),

#Ventana 2.1 Sankeyplot
tabPanel('International leanguage', 
         # Define UI for slider demo application
         shinyUI(fluidPage(
           #Application title
           titlePanel("Aguacate, maíz, calabaza y frijol en el Mundo"),
           sidebarLayout(
             sidebarPanel(
               radioButtons(inputId = 'Especies', label = h6("Especies:"),
                   choices = names(TTabla), selected = names(TTabla)[1])
            
             , width = 2), 
             fluidRow(
                column(9,
               htmlOutput("Treeplot2", width = "1000", height = "600")
             ))
         ))
))
))