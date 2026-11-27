#Cleaning Data

library(tidyverse)

# 1. Load the dataset
heart_data <- read_csv("heart.csv")

# 2. Check for missing values and remove duplicate rows
sum(is.na(heart_data))
heart_clean <- heart_data %>%
  distinct()

# 3. Convert target and categorical columns into factors one by one
heart_clean <- heart_clean %>%
  mutate(
    target = factor(target, levels = c(0, 1), labels = c("No_Disease", "Disease")),
    sex = as.factor(sex),
    cp = as.factor(cp),
    fbs = as.factor(fbs),
    restecg = as.factor(restecg),
    exang = as.factor(exang),
    slope = as.factor(slope),
    ca = as.factor(ca),
    thal = as.factor(thal)
  )

# 4. Check the cleaned data
glimpse(heart_clean)