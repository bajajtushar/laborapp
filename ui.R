library(shiny)
library(shinydashboard)
library(ggplot2)
library(magrittr)
library(dplyr)
library(shiny)
library(rlang)
library(viridis)
library(ggrepel)
library(tidyr)

source("plotgis.R",local = TRUE)
options(scipen = 9999)
b=readRDS("data/b.rds") #migration data
ui <- dashboardPage(
  dashboardHeader(title="Labour in India"),
  dashboardSidebar(
    menuItem("Migration",tabName = "Migration",icon = icon("dashboard")) 
  ),
  dashboardBody(tabItems(tabItem(tabName = "Migration",     #migration tab
    fluidRow(
      tabBox( id="migtab1",
              tabPanel("GIS",plotOutput(outputId="migrantgis")),
              tabPanel("Plot","underconstruction"),
              tabPanel("Model",textOutput(outputId="text"))),
      column(2,h5("Select Parameters"),
             radioButtons(inputId="sector",label = "Destination area type",choices = unique(b$sector),selected = "Rural")),
      column(2,br(),br(),
             radioButtons(inputId="lastres",label = "Source area type",choices = unique(b$sectoroflastresidence),selected = "Urban")),
      column(2,br(),br(),radioButtons(inputId="gender",label = "Gender",choices = unique(b$Gender),selected = "Total")),
      column(3, selectInput("duration",h6("Duration of residence"),choices = unique(b$durationofresidence),selected = "All durations of residence",selectize = F),
             selectInput("reason",h6("Reason for Migration"),choices = unique(b$reason),selected = "Work",selectize = F),actionButton("go","submit"))
    )
  )
)))



