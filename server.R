shinyServer(function(input, output, session) {
  
  
  output$Treeplot1 <- renderGvis({
    
    Feynmann1 <- mx.states1 %>%
      select(Estado, parent, Valor) %>%
      mutate(Valor1 = Valor)
    
    Treeplot11 <- gvisTreeMap(
      Feynmann1, idvar = "Estado", parentvar = "parent",
      sizevar = "Valor", colorvar = "Valor1",
      options = list(width = 1000, height = 700,
                     textStyle = "{fontSize:18, fontColor:['black', 'black', 'white']}",
                     minColor = '#ffffb2',
                     midColor = '#fd8d3c',
                     maxColor = '#bd0026',
                     headerHeight = 20,
                     showScale = F))
    
    return(Treeplot11)
    
  })
 
  Bread <- reactive({
    input$update
    TableL1 <- TTabla[,input$Especies]    
  })
 
  
  output$Treeplot2 <- renderGvis({
    Feynmann2 <- Bread()
    World2 <- World1$Leanguage

  Nombre3 <- paste(World2,Feynmann2, sep = " / ")

  World11 <- data.frame(Food$Value,Nombre3, World1$Area)

  names(World11)[1:3] <- c("Value", "Area", "parent")
  Wld.states1 <- Wld.states
  Wld.states2 <- rbind(Wld.states1, World11)

    TreePlot22 <- gvisTreeMap(Wld.states2,  idvar = "Area", parentvar = "parent",
                              sizevar = "Value",colorvar = "Value",
                         options = list(width = 800, height = 700,
                                        textStyle = "{fontSize:18, fontColor:['black', 'black', 'white']}",
                                        minColor = '#F7FBFF',
                                        midColor = '#FD8D3C',
                                        maxColor = '#800026',
                                        headerHeight = 20,
                                        showScale = F))
    return(TreePlot22)
    
  })
  })
