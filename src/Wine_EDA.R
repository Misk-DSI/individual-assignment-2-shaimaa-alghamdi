
install.packages("tidyr")#in order to simplifying the process of creating tidy data.
library(tidyr)
install.packages("janitor") # use this library in order to clean up the names in the data set.
library(janitor)
install.packages("here") #In order to create paths relative to the top-level directory. 
library(here)
install.packages("readxl") #In order to create paths relative to the top-level directory. 
library(readxl)
library(tidyverse); library(GGally)
install.packages('corrplot') #to show the correlation between features.
library(corrplot)
install.packages("ggplot2") # creating graphics, on The Grammar of Graphics.
library(ggplot2)



# To get the data 
myData <- read_csv(here("data/winequality-red.csv"))
#to show the number of rows and columns 
glimpse(myData)

#To deal with the 'pH' column and adding the underscore names 
names(myData)[9] <- "ph" 
wine <- myData %>%
+     clean_names() 




# remove the duplicated 
wine <- distinct(wine)

summary(wine)

#EDA
#Scatterplot Matrix of Variables
plot(myData)

# Corrilation
corrplot(cor(myData))


ggplot(myData,aes(x=quality))+geom_bar(stat = "count",position = "dodge")+
  +     scale_x_continuous(breaks = seq(3,8,1))+
  +     ggtitle("The Quality Ratings of Red Wine")+
  +     theme_classic()




