library(shiny)
library(shinythemes)
#library(leaflet)
library(knitr)
#library(plotly)
#library(ggplot2)
#library(googleVis)

#runApp(system.file("shiny/", package = "googleVis"))
#library(ggplot2movies)

shinyUI(navbarPage(
  theme = shinytheme("flatly"),
  title = "",

    tabPanel('Local leanguage', 
           # Define UI for slider demo application
           shinyUI(fluidPage(
             #Application title
             titlePanel("Maíz en diferentes lenguas de México"),
             #h4("Razas de maíces"),
             
               #h6("comentarios: aponce@conabio.gob.mx"),
                # br(),
                # h5("Github:"),
                # tags$a(href = "https://github.com/APonce73/Conabio-PGMaices", "Conabio-Maíces"),
                 width = 1)),
           
               fluidRow(
                 column(9,
                        htmlOutput("Treeplot1", width = "1000", height = "600"))
               )),
           


#Ventana 2.1 Sankeyplot

tabPanel('International leanguage', 
         # Define UI for slider demo application
         shinyUI(fluidPage(
           #Application title
           titlePanel("Aguacate, maíz, calabaza y frijol en el Mundo"),
           #h4(),
           sidebarLayout(
             sidebarPanel(
               
               #Seleccionar la Especie
               #checkboxGroupInput(inputId = "Especies",
              #             label = h6("Species of Agrodiversity:"),
              #             c(names(TTabla)[1], names(TTabla)[-1]))
               
               
               
        radioButtons(inputId = 'Especies', label = h6("Especies:"),
                   choices = names(TTabla), selected = names(TTabla)[1])
            
             , width = 2), 
             fluidRow(
                column(9,
               htmlOutput("Treeplot2", width = "1000", height = "600")
             ))
#             #leafletOutput("mymap", width = "100%", height = "100%")
#           
         
         ))
))
##
#
))
