library(ggplot2)
library(googleVis)
library(RColorBrewer)
library(readxl)
library(reshape)
library(shiny)
library(shinythemes)
library(tidyverse)

TableP <- read_excel("data/INALI.xlsx", sheet = "INALI", col_names = T)

TableP <- TableP %>%
  select(Pais, Estado, Nombre, Lengua) %>%
  mutate(Valor = 1) %>%
  na.omit()

Cafe <- TableP
attach(Cafe)
Cafe1 <- aggregate(Valor~Estado, FUN = sum)
detach(Cafe)

## Create parent variable
total <- data.frame(Valor = sum(Cafe1$Valor), Estado = "MEXICO")
mx.states <- rbind(total, Cafe1)

mx.states$parent <- "MEXICO"
mx.states$parent[mx.states$Estado == "MEXICO"] <- NA

Nombre1 <- paste(TableP$Nombre,"(",TableP$Lengua,")","_",seq(1:nrow(TableP)), sep = "")

TableP1 <- data.frame(TableP$Valor,Nombre1, TableP$Estado)
names(TableP1)[1:3] <- c("Valor", "Estado", "parent")

mx.states1 <- rbind(mx.states, TableP1)


World1 <- read.csv("data/MaizeWorld.csv", head = T, sep = ",")

Food <- World1 %>%
  select(Area, Leanguage) %>%
  mutate(Value = rep(1, nrow(World1)))


TTabla <- World1 %>%
  select(-c(Area, Leanguage, Value))
  
names(TTabla) <- c("Maiz", "Aguacate", "Calabaza", "Frijol")

attach(Food)
Food1 <- aggregate(Value~Area, FUN = sum)
detach(Food)

## Create parent variable
total <- data.frame(Value = sum(Food1$Value), Area = "WORLD")
Wld.states <- rbind(total, Food1)

Wld.states$parent <- "WORLD"
Wld.states$parent[Wld.states$Area == "WORLD"] <- NA