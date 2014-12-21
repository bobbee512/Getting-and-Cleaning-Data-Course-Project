Getting-and-Cleaning-Data-Course-Project
========================================

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.

Getting and Cleaning Data Course Project R script called run_analysis.R

run_analysis()

I use the dplyr package in this script. The following are the steps taken.

set the working directory for R script and Samsung data

setwd("C:\Users\Owner\Dropbox\Coursera Data Science Specialization\Cleaning Data\UCI HAR Dataset\")

put all output in subdirectory named "data"

read training data set (X_train.txt), consisting of 7352 records (rows) and 561 attributes (columns)

add column names for the 561 attributes from features.txt.

Features has two columns. The first, is the number for the feature (V1) and the second is the feature (V2)

I use the second column of features for the column headings of X_train_data by transposing V2 into a row and rbinding V2 to X_train_data.

create a new 1 character attribute(column) in X_train_data for an "activities" atribute, from y_train.txt. Call it Activity.

replace the activity number with an activity name, from activity_labels. txt.

create a new 2 character attribute (column) in X_train_data for a "Subjects" attribute, using Subject.train.txt. Call it Subjects.

create a new 1 character attribute (column) in x_train_data for a "TYPE_train_or_test" attribute and fill the entire table with "1's" for "train."

create a new 5 character attribute (column) in 01_X_train_data for a Record Number attribute (column) Call it REC_ID and fill it with the sequential numbers from 1 to 7352.

read the testing data set, X_test.txt, consisting of 2947 records (rows) and 561 attributes (columns)

create a new 1 character attribute(column) in X_test_data for an "activities" atribute, Call it Activity.

replace the activity number with an activity name, from activity_labels. txt.

create a new 2 character attribute (column) in activities_X_test_data for a "Subjects" attribute, using Subject.text.txt. Call it Subject.

create a new 1 character attribute (column) in x_test_data for a "TYPE.train or test" attribute and fill the entire table with "2" for "test."

create a new 5 character attribute (column) in coded_X_test_data for a Record Number attribute (column) and fill it with the sequential numbers from 7353 to 10299.

rbind the ordered_X_train_data and the ordered_X_test_data and call it ordered_data.

extract from ordered_data only those columns that are means or standard deviations of each measurement. I use the dplyr library for the select().

Include all column headings that have the labels "-mean()" or "-std() or "meanfreq()" in them only. I chose these formats because they seemed to be the same type of data.

write a table for the reduced_ordered_data and call it tidy_ordered_data.
This completes the work for my first tidy data set. Call it tidy_ordered_data. tidy_ordered_data contains 4 categorical variables and 79 measurement variables, with 7352 data rows and 1 column headings row.

For the next section, I chose to use the dplyr library to group and summarize and the data by Subject and Activity. I called it sum_ordered_data. The final table created by a write.table is called tidy_data.

create a 2nd independent tidy data set with the average of each variable for each activity and each subject.

write a table for the second tidy data set and call it tidy_data.

HEAD

Subject Activity tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z 1 1 LAYING 0.2215982 -0.040513953 -0.1132036 2 1 SITTING 0.2612376 -0.001308288 -0.1045442 3 1 STANDING 0.2789176 -0.016137590 -0.1106018

TAIL

Subject Activity tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z 1 30 WALKING 0.2764068 -0.01758804 -0.09862471 2 30 WALKING_DOWNSTAIRS 0.2831906 -0.01743839 -0.09997814 3 30 WALKING_UPSTAIRS 0.2714156 -0.02533117 -0.12469749

This completes the work for my 2nd tidy data set. Call it tidy_data. It contains the average of each mean or std variable for each activity and each subject. It consists of 2 categorical variables (Subject and Activity) and 79 measurement variables. There are 180 rows(30 subjects, 6 activities each).
