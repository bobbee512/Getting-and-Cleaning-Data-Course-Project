## Getting and Cleaning Data Course Project
## R script called run_analysis.R

run_analysis <- function(){
  
## set the working directory for R script and Samsung data

  setwd("C:\\Users\\Owner\\Dropbox\\Coursera Data Science Specialization\\Cleaning Data\\UCI HAR Dataset\\")  
  
## put all output in subdirectory named "data"

## Check to see if a directory named "data" exists and
## if it does not exist, create it.

  if (!file.exists("data")) {
    dir.create("data")
}

## read training data set, consisting of 7352 records (rows) and 561 attributes (columns)
## add column names for the 561 attributes from features.txt

  features <- read.table("features.txt", sep = "", header = FALSE)

## features has two columns.  The first, is the number for the feature (V1) and the second 
## is the feature (V2)

## I use the second column of features for the column headings of X_train_data by
## transposing V2 into a row and rbinding V2 to X_train_data.
  
  trans_features <- t(features$V2)

  X_train_data <- read.table("./train/X_train.txt", sep = "", header = FALSE, col.names=trans_features)

## create a new 1 character attribute(column) in X_train_data for an "activities" atribute,
## Call it activities_x_train_data

  activities_train <- read.table("./train/y_train.txt", header = FALSE, col.name="Activity")

## REPLACE ACTIVITY NUMBER WITH ACTIVITY NAME

##  Split activity_labels.txt into 2 columns (V1 = numbers 1 - 6) and (V2 = activity name) 
##  Call it activities.

##  activities <- read.table("./activity_labels.txt", header = FALSE)

##  match activities (V1) with Activity column in activities_train and replace
## the match with the name (V2)

## In an attempt to complete the project on time, I have decided to be expedient
## in lieu of elegant, although, as a new R programmer, I don't know enough yet
## to be elegant.  I will return to this activity if time permits. Please be gentle.

  activities_train <- gsub("1", "WALKING", activities_train$Activity)
  activities_train <- gsub("2", "WALKING_UPSTAIRS", activities_train)
  activities_train <- gsub("3", "WALKING_DOWNSTAIRS", activities_train)
  activities_train <- gsub("4", "SITTING", activities_train)
  activities_train <- gsub("5", "STANDING", activities_train)
  activities_train <- gsub("6", "LAYING", activities_train)

  activities_X_train_data <- cbind(activities_train, X_train_data)

  colnames(activities_X_train_data)[1] <- "Activity"

## create a new 2 character attribute (column) in X_train_data for a "Subjects" attribute, using Subject.train.txt.
## Call it subject_X_train_data.

  subject_train <- read.table("./train/subject_train.txt", header = FALSE, col.name = "Subject")
  
  subject_X_train_data <- cbind(subject_train, activities_X_train_data)

## create a new 1 character attribute (column) in x_train_data for a "TYPE_train_or_test" 
## attribute and fill the entire table with "1" for "train." Call it coded_X_train_data.

  TYPE_train_or_test <- rep(1, 7352)

  coded_X_train_data <- cbind(TYPE_train_or_test, subject_X_train_data)
  
## create a new 5 character attribute (column) in 01_X_train_data for a "REC NO" attribute (column)
## and fill it with the sequential numbers from 1 to 7352.

  REC_ID <- seq(from = 1, to = 7352, by = 1)

  ordered_X_train_data <- cbind(REC_ID, coded_X_train_data)
  
## read testing data set, consisting of 2947 records (rows) and 561 attributes (columns)

  X_test_data <- read.table("./test/X_test.txt", sep = "", header = FALSE, col.names=trans_features)
  
## create a new 1 character attribute(column) in X_test_data for an "activities" atribute,
## Call it activities_x_test_data

  activities_test <- read.table("./test/y_test.txt", header = FALSE, col.name="Activity")

## REPLACE ACTIVITY NUMBER WITH ACTIVITY NAME

## Ditto above:  In an attempt to complete the project on time, I have decided to be expedient
## in lieu of elegant, although, as a new R programmer, I don't know enough yet
## to be elegant.  I will return to this activity if time permits. Please be gentle.
                        
  activities_test <- gsub("1", "WALKING", activities_test$Activity)
  activities_test <- gsub("2", "WALKING_UPSTAIRS", activities_test)
  activities_test <- gsub("3", "WALKING_DOWNSTAIRS", activities_test)
  activities_test <- gsub("4", "SITTING", activities_test)
  activities_test <- gsub("5", "STANDING", activities_test)
  activities_test <- gsub("6", "LAYING", activities_test)

  activities_X_test_data <- cbind(activities_test, X_test_data)

  colnames(activities_X_test_data)[1] <- "Activity"

## create a new 2 character attribute (column) in activities_X_test_data for a "Subjects" attribute, using Subject.text.txt.
## Call it subject_X_test_data.

  subject_test <- read.table("./test/subject_test.txt", header = FALSE, col.name = "Subject")

  subject_X_test_data <- cbind(subject_test, activities_X_test_data)

## create a new 1 character attribute (column) in x_test_data for a "TYPE.train or test" 
## attribute and fill the entire table with "2" for "test." Call it coded_X_test_data.

  TYPE_train_or_test <- rep(2, 2947)

  coded_X_test_data <-  cbind(TYPE_train_or_test, subject_X_test_data)

## create a new 5 character attribute (column) in coded_X_test_data for a "REC NO" attribute (column)
  ## and fill it with the sequential numbers from 7353 to 10299.

  REC_ID <- seq(from = 7353, to = 10299, by = 1)

  ordered_X_test_data <- cbind(REC_ID, coded_X_test_data)

## merge the ordered_X_train_data and the ordered_X_test_data, ordered by "REC NO".  
## call it ordered_data
  
  ordered_data <- rbind(ordered_X_train_data, ordered_X_test_data)

##  Extract from ordered_data only those columns that are means or standard deviations 
##  of each measurement.

##  Include all column headings that have the labels "-mean()" or "-std()" in them.
##  I chose these formats because they seemed to be the same type of data.

## It is called reduced_ordered_data.

##  trans_features contains all the column headings to be searched.  
    
##    print(trans_features)

    selected_columns <- grep("mean|std", trans_features)

 ##   print(selected_columns)

# selected_columns are the measurements from trans_features that I keep.
# It is a list of numbers starting with 1, 2, 3, 4.5, 6, 41, 42, 43, etc.
# I need to increment these numbers by 4 so that they become 5, 6, 7, 8, etc.

#  Then I need to select() the selected_columns in ordered_data.  This will be
#  my reduced_ordered_data.

##    Write a table for the reduced_ordered_data and call it tidy_ordered_data.

##    tidy_ordered_data <- write.table(reduced_ordered_data)

      tidy_ordered_data <- write.table(ordered_data, file = "tidy_ordered_data.txt", sep = " ", row.names=FALSE, col.names=TRUE)

##  This completes the work for my first tidy data set.  Call it tidy_ordered_data. 
##  tidy_ordered_data contains 4 categorical variables and 86 measurement variables, with
##  7352 data rows and 1 column headings row.

##  For the next section, I chose to use the dplyr library to group and summarize and 
##  the data by Subject and Activity.  I called it sum_ordered_data.
##  The final table created by a write.table is called tidy_data.

##  I use the dplyr library.

##    Install.packages("dplyr")
    
    library(dplyr)
    
#    clean_ordered_data <- select (ordered_data, rev_selected_columns)

    sum_ordered_data <- ordered_data  %>%
  
    group_by(Subject, Activity) %>%
  
    summarise_each(funs(mean), tBodyAcc.mean...X:fBodyBodyGyroJerkMag.std..)

##tail(sum_ordered_data, 3)

  tidy_data <- write.table(sum_ordered_data, file="tidy_data.txt", sep = " ", row.names = FALSE, col.names = TRUE)

##  This completes the work for my 2nd tidy data set.  Call it tidy_data. 
##  It contains the average of each mean or std variable for each activity and each subject. 
##  It consists of 2 categorical variables (Subject and Activity) and 86 measurement variables.  There
##  are 180 rows(30 subjects, 6 activities each).

}
