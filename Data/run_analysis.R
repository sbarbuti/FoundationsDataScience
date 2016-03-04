#import data
#Merges the training and the test sets to create one data set.
#Extracts columns containing mean and standard deviation for each measurement 
#(Hint: Since some feature/column names are repeated, you may need to use the make.names() function in R)
#Creates variables called ActivityLabel and ActivityName that label all observations with the corresponding activity labels and names respectively
#From the data set in step 3, creates a second, independent tidy data set with the average of each variable for each activity and each subject.library(plyr)

setwd("C:/Users/Sandra/Documents/DataScienceCert/Data")
library(plyr)
library(dplyr)
paths <- dir(path = "C:/Users/Sandra/Documents/DataScienceCert/Data", pattern = "\\.csv")
names(paths) <- basename(paths)
tennisdata <- ldply(paths, read.csv)
list.files(paths)
glimpse(tennisdata)

dim(tennisdata)  
#test
tennisdata <- rename(tennisdata, tournamentname=.id)
tennisdata %>% select(.id) %>% distinct

regexpr('-', tournamentname)
sub(".*:", "", string)

# of records by file
tennisdata %>% 
  group_by(.id) %>% 
  summarise(count = n())

#rename id var

#account for missing vars -- recode?


#mean sd

tennisdata %>% 
  #group_by(paths) %>% 
  summarise_each(funs(mean(., na.rm=TRUE)))

ausopen <- read.csv("AusOpen-men-2013.csv")
glimpse(ausopen)
