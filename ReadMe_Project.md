## Getting and Cleaning Data Course Project
## R script called run_analysis.R

run_analysis()

The script works with one exception.  I was unable to reduce the data set by removing those 
columns that do not have measurement of mean or std.  I left my attempted code in the script
ass comments so that you can see my attempt.  I do summarize properly and calculate the means
and stds; just on too many columns!

I also use the dplyr package.  The following are the steps taken.

1. set the working directory for R script and Samsung data

  setwd("C:\\Users\\Owner\\Dropbox\\Coursera Data Science Specialization\\Cleaning Data\\UCI HAR Dataset\\")  
  
2. put all output in subdirectory named "data"

3. read training data set (X_train.txt), consisting of 7352 records (rows) and 561 attributes (columns)

4. add column names for the 561 attributes from features.txt.

## features has two columns.  The first, is the number for the feature (V1) and the second 
## is the feature (V2)

## I use the second column of features for the column headings of X_train_data by
## transposing V2 into a row and rbinding V2 to X_train_data.

5. create a new 1 character attribute(column) in X_train_data for an "activities" atribute,
from y_train.txt. Call it Activity. 

6.  replace the activity number with an activity name, from activity_labels. txt.

7.  create a new 2 character attribute (column) in X_train_data for a "Subjects" attribute, using Subject.train.txt.
Call it Subjects.

8.  create a new 1 character attribute (column) in x_train_data for a "TYPE_train_or_test" 
attribute and fill the entire table with "1's" for "train." 

9. create a new 5 character attribute (column) in 01_X_train_data for a Record Number attribute (column)
Call it REC_ID and fill it with the sequential numbers from 1 to 7352.

10. read the testing data set, X_test.txt, consisting of 2947 records (rows) and 561 attributes (columns)

11. create a new 1 character attribute(column) in X_test_data for an "activities" atribute,
Call it Activity.

12. replace the activity number with an activity name, from activity_labels. txt.

13. create a new 2 character attribute (column) in activities_X_test_data for a "Subjects" attribute,
using Subject.text.txt.  Call it Subject.

14. create a new 1 character attribute (column) in x_test_data for a "TYPE.train or test" 
attribute and fill the entire table with "2" for "test."

15. create a new 5 character attribute (column) in coded_X_test_data for a Record Number attribute (column)
and fill it with the sequential numbers from 7353 to 10299.

16. rbind the ordered_X_train_data and the ordered_X_test_data and call it ordered_data.
  
17. extract from ordered_data only those columns that are means or standard deviations 
of each measurement.

##  Include all column headings that have the labels "-mean()" or "-std()" in them.
##  I chose these formats because they seemed to be the same type of data.

STEP 17 IS NOT YET WORKING.

18. write a table for the reduced_ordered_data and call it tidy_ordered_data.

##  This completes the work for my first tidy data set.  Call it tidy_ordered_data. 
##  tidy_ordered_data contains 4 categorical variables and 86 measurement variables, with
##  7352 data rows and 1 column headings row.

##  For the next section, I chose to use the dplyr library to group and summarize and 
##  the data by Subject and Activity.  I called it sum_ordered_data.
##  The final table created by a write.table is called tidy_data.

19. create a 2nd independent tidy data set with the average of each variable for each 
activity and each subject.  

20. write a table for the second tidy data set and call it tidy_data.

HEAD

  Subject Activity tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z
1       1   LAYING         0.2215982      -0.040513953        -0.1132036
2       1  SITTING         0.2612376      -0.001308288        -0.1045442
3       1 STANDING         0.2789176      -0.016137590        -0.1106018

TAIL

  Subject           Activity tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z
1      30            WALKING         0.2764068       -0.01758804       -0.09862471
2      30 WALKING_DOWNSTAIRS         0.2831906       -0.01743839       -0.09997814
3      30   WALKING_UPSTAIRS         0.2714156       -0.02533117       -0.12469749

##  This completes the work for my 2nd tidy data set.  Call it tidy_data. 
##  It contains the average of each mean or std variable for each activity and each subject. 
##  It consists of 2 categorical variables (Subject and Activity) and 64 measurement variables.  There
##  are 180 rows(30 subjects, 6 activities each).

}
