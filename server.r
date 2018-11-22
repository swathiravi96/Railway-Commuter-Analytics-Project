library(shiny)
library(datasets)
function(input, output,session) {
  
  datasetInput <- reactive({
    
    switch(input$confusionMat,
           "Chengalpattu" = Chengalpattu,
           "Kanchipuram" =Kanchipuram)
   
    
  })
  output$summary <- renderPrint({
    confusionMat<- datasetInput()
    
    Smart_table
    
    
  })
  output$view <- renderTable({
    
    head(datasetInput(),
         n= input$obs)
    
  })
  
  
  output$confusionMat<- renderTable({
    
    
    input$confusionMat
    
    confusionMat<-table(test$DESTINATION)
    
    EXTRATRAIN<-subset(Chengalpattu[-which(Chengalpattu$DESTINATION > 10), ])
    if(input$confusionMat=="Chengalpattu")
      
      
     dataset= "EXTRA TRAIN"
    
    
    NORMAL<-subset(Kanchipuram[-which(Kanchipuram$DESTINATION <= 10), ]) 
    if(input$confusionMat=="Kanchipuram")
    dataset="NORMAL"
    #if(input$confusionMat=="Beach")
    #n="ds;lmpo"
    
    dataset
    
    
  })
  
  
  
  

  datasetInput1 <- reactive({

    switch(input$confusionMat1,

           "Beach" = Beach)
  })

  


  output$caption <- renderText({
    input$caption
    
  })
  
  output$caption1 <- renderText({
    input$caption1
    
  })
  output$caption3 <- renderText({
    input$caption3
    
  })
  
  output$summary1<- renderPrint({
    confusionMat1<- datasetInput1()
    
  Smart_table1
    
    
  })
 
 output$view1 <- renderTable({
    head(datasetInput1(),
       n= input$obs)
   
    
  })
  
  
  output$confusionMat1<- renderTable({


    confusionMat1<-table(test$SOURCE)
    EXTRASEATS <- subset(Beach[-which(Beach$SOURCE >  10), ])
    EXTRATICKET <- subset(Beach[-which(Beach$SOURCE > 15), ])
    if(input$confusionMat1=="Beach")
      dataset="EXTRA TRAIN + EXTRA TICKET COUNTER + EXTRA SEATS"

    # n = ifelse(input$confusionMat=="normal","a","b")
     dataset



  })

  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    Smart[, c(input$AGE,input$TIME_S,input$TIME_D)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    
    
    
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
            "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    
    par(mar = c(8.1, 7.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 10, cex = 3)
    points(clusters()$centers, pch = 7, cex = 3, lwd = 4)
  })
  
  
  
}