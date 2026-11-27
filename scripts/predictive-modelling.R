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

heart_data <- read.csv(here("data","heart_clean.csv"))

# Data partitioning

set.seed(123)
train_index<-createDataPartition(heart_data$target,p=0.80,list=FALSE)
train_data<-heart_data[train_index,]
test_data<-heart_data[-train_index,]

# TODO: step 3

# TODO: step 4


