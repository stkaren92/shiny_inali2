library(tidyverse)
library(readxl)



#For Mac
#setwd("~/Dropbox//Github/Shiny_INALI/")
dir()
#TableP <- read.csv("INALI.csv", head = T, sep = ",")
TableP <- read_excel("data/INALI.xlsx", sheet = "INALI", col_names = T)

TableP <- TableP %>%
  select(Pais, Estado, Nombre, Lengua) %>%
  mutate(Valor = 1) %>%
  na.omit()


#Todo esto en el server
library(reshape)
#library(vegan)
library(googleVis)
#library(mxmaps)
library(RColorBrewer)

head(TableP)
Cafe <- TableP
attach(Cafe)
#Cafe1 <- aggregate(Valor1, list(Raza_primaria, Complejo_racial, Estado, Municipio, Localidad, Altitud, longitude, latitude), FUN = sum)
Cafe1 <- aggregate(Valor~Estado, FUN = sum)

detach(Cafe)
dim(Cafe)
dim(Cafe1)

## Create parent variable
total <- data.frame(Valor = sum(Cafe1$Valor), Estado = "MEXICO")
total
mx.states <- rbind(total, Cafe1)

mx.states
mx.states$parent <- "MEXICO"
mx.states$parent[mx.states$Estado == "MEXICO"] <- NA

head(TableP)
names(TableP)
dim(TableP)
#Nombre1 <- paste(TableP$Nombre,TableP$Lengua, seq(1:nrow(TableP)), sep = " / ")
Nombre1 <- paste(TableP$Nombre,"(",TableP$Lengua,")","_",seq(1:nrow(TableP)), sep = "")

Nombre1
head(TableP)

TableP1 <- data.frame(TableP$Valor,Nombre1, TableP$Estado)
names(TableP1)
names(mx.states)
names(TableP1)[1:3] <- c("Valor", "Estado", "parent")

mx.states1 <- rbind(mx.states, TableP1)



############################
#Poner en el server
#mx.states$state.area.log <- log(mx.states$Val)
#head(mx.states1)
#statesTree <- gvisTreeMap(mx.states1, "Estado", "parent",
#                          "Valor","Valor")
#plot(statesTree)
#head(mx.states1)

#mx.state2 <- mx.states1 %>%
#  select(Estado, parent, Valor) %>%
#  mutate(Valor1 = Valor)
#head(mx.state2)
#dim(mx.state2)
#head(TableP)
#Tree2 <- gvisTreeMap(mx.state2,
#                     options = list(width = 600, height = 500,
#                                  fontSize = 12,
#                                  minColor = '#EDF8FB',
#                                  midColor = '#66C2A4',
#                                  maxColor = '#006D2C',
#                                  headerHeight = 20,
#                                  fontColor = 'black',
#                                  showScale = TRUE
#                                  #generateTooltip: showFullTooltip
#                                  ))
#
#plot(Tree2)


#############################
#Maize of the world
#Todo esto en el server
#library(reshape)
#library(vegan)
#library(googleVis)
#library(mxmaps)
#library(RColorBrewer)


dir()
World1 <- read.csv("data/MaizeWorld.csv", head = T, sep = ",")

#World1 <- read_excel("INALI.xlsx", sheet = "MaizWorld", col_names = T)

names(World1)
head(World1)
dim(World1)

  Food <- World1 %>%
    select(Area, Leanguage) %>%
    mutate(Value = rep(1, nrow(World1)))
Food

  TTabla <- World1 %>%
    select(-c(Area, Leanguage, Value))
  
names(TTabla) <- c("Maiz", "Aguacate", "Calabaza", "Frijol")

  head(Food)
  attach(Food)
  #Food1 <- aggregate(Valor1, list(Raza_primaria, Complejo_racial, Estado, Municipio, Localidad, Altitud, longitude, latitude), FUN = sum)
  Food1 <- aggregate(Value~Area, FUN = sum)
  detach(Food)
  dim(Food)
  dim(Food1)
  
  head(Food1)
  
  ## Create parent variable
  total <- data.frame(Value = sum(Food1$Value), Area = "WORLD")
  Wld.states <- rbind(total, Food1)
  
  Wld.states
  Wld.states$parent <- "WORLD"
  Wld.states$parent[Wld.states$Area == "WORLD"] <- NA

