
#KMEANS CLUSTERING AGE
Smart_samp <-Smart
Smart_samp$Smart_NAME <-NULL

Smart_samp$Smart_NAME

smart1 <- as.data.frame(subset(Smart$AGE, Smart$AGE>0))
smart1


kmeans_Smart$cluster
smarttab <-table(Smart$NAME, kmeans_Smart$cluster)
smarttab 
plot(Smart_samp[c("AGE")],
     col = kmeans_Smart$cluster)
points(kmeans_Smart$centers[,c("AGE")],
       col = 1:5,pch =8, cex=2)

 #KMEANS CLUSTERING TIME_S
Smart2<-as.data.frame(subset(Smart$TIME_S, Smart$TIME_S>0))
kmeans_Smart2 <- kmeans(Smart2 ,3)
kmeans_Smart2$cluster
table(Smart$NAME, kmeans_Smart2$cluster)
plot(Smart_samp[c("TIME_S")],
  col = kmeans_Smart2$cluster)

#par(mar = c( 7.1, 0, 1))
#plot(Smart_samp[c("TIME_S")],
 #    col = clusters()$cluster,
  #   pch = 10, cex = 3)


#KMEANS CLUSTERING TIME_D
Smart3<-as.data.frame(subset(Smart$TIME_D, Smart$TIME_D>0))
kmeans_Smart3 <- kmeans(Smart3,2)
kmeans_Smart3$cluster
table(Smart$NAME, kmeans_Smart3$cluster)
plot(Smart_samp[c("TIME_D")],
     col = kmeans_Smart2$cluster)









#NAIVEBAYES CLASSIFICATION IN SMARTCARD 


Smart_new<-Smart

Smart_new <-Smart[sample(nrow(Smart)),]

train <- Smart_new[1:12,]
test <-Smart_new[13:24,]
#install.packages("caret")
require(e1071)
require(caret)
library(caTools)

 # split <- sample.split(Smart,SplitRatio = 0.55)
 #  
 #  train <- subset(Smart, split==F)
 #  test<- subset(Smart, split==T)

train$DESTINATION <- as.factor(unlist(train$DESTINATION))
test$DESTINATION <- as.factor(unlist(test$DESTINATION))
train_class <- train[,-9]

model <- naiveBayes(train_class, train$DESTINATION)
summary(model)

pred <- predict(model, test[,-9])

summary(pred)
confusionMatrix(pred, test$DESTINATION)

Smart_table<-table(Smart$DESTINATION)
Smart_table1<-table(Smart$SOURCE)
Smart_table1
Chengalpattu<-subset(Smart,DESTINATION=="Chengalpattu")
Kanchipuram<-subset(Smart,DESTINATION=="Kanchipuram")
Beach<-subset(Smart,SOURCE=="Beach")
Beach
Chengalpattu
Kanchipuram

confusionMat<-table(Smart$DESTINATION)

confusionMat