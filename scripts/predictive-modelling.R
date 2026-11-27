# =======================================
# name: babys first R script
# created by / date: angelica / 11/18/2026
# 
# -----PLS UPDATE BELOW EVERY TIME CHANGE IS MADE------- 
# modified last by / data:
#========================================

library(caret)
library(rpart)
library(tidyverse)
library(rpart.plot)
library(here)

# loading data

heart_data <- read.csv(here("data","heart_cleaned.csv"))

# Data partitioning

set.seed(123)
train_index<-createDataPartition(heart_data$target,p=0.80,list=FALSE)
train_data<-heart_data[train_index,]
test_data<-heart_data[-train_index,]

# TODO: store train and test data as csv files

# 10-Fold Cross-Validation

cv_settings<-trainControl(method="cv",number=10)
tuned_tree<-train(target~.,data=train_data,method="rpart",trControl=cv_settings,
                  tuneLength=10)
plot(tuned_tree,main="Cross-Validation Acuracy vs. Complexity Parameter(CP)")


# Unseen Predictions and Matrix Table Evaluation

predictions<-predict(tuned_tree,newdata = test_data)
confusion_table<-table(Actual=test_data$target,Predicted=predictions)
print("---Test Set Confusion Matrix Table---")
print(confusion_table)

correct_counts<-sum(diag(confusion_table))
total_counts<-sum(confusion_table)
test_accuracy<-correct_counts/total_counts

cat("\nFinal Calculated Test Accuracy Rate:",round(test_accuracy*100,2), "%\n")



