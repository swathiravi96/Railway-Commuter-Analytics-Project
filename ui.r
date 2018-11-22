 library(shiny)
library(ggplot2)

 require(e1071)
 require(caret)
 library(caTools)

Chengalpattu<-subset(Smart,DESTINATION=="Chengalpattu")
Kanchipuram<-subset(Smart,DESTINATION=="Kanchipuram")
Beach<-subset(Smart,SOURCE=="Beach")

pageWithSidebar(
  headerPanel('SMARTCARD k-means clustering and Classification'),
  sidebarPanel(
    textInput("caption3", "Caption:", "k-means clustering"),
    selectInput('AGE', 'AGE Variable', choices = c("AGE","Id")),
    selectInput('TIME_S', 'TIME_S', choices = c("AGE","Id","TIME_S","TIME_D")),
    selectInput('TIME_D', 'TIME_D Variable',choices = c("AGE","Id","TIME_S","TIME_D"),
                
                selected=names(Smart)[[1]]),
    
    numericInput("clusters", "Cluster count", 3,
                 min = 1, max = 9),
    textInput("caption", "Caption:", "DESTINATION"),
    textInput("caption1", "Caption:", "SOURCE"),
    selectInput("confusionMat", "Choose a dataset:DEST", 
                choices =  (Smart$DESTINATION)),
    selectInput("confusionMat1", "Choose a dataset:SOUR", 
              choices =  (Smart$SOURCE)),
    
    numericInput("obs", "Number of observations to view:", 3)
    
    
    
  ),
  mainPanel(
    h3(textOutput("caption1")),
    tableOutput("confusionMat1"),
    verbatimTextOutput("summary1"),
    tableOutput("view1"),
    h3(textOutput("caption")),
    tableOutput("confusionMat"),
    verbatimTextOutput("summary"), 
    tableOutput("view"),
    h3(textOutput("caption3")),
     plotOutput('plot1')
    
  )
)