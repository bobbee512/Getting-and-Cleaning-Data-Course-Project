CODE BOOK – TIDY DATA SET (tidy_data.txt)

INTRODUCTION: 

The data contained in the TIDY DATA SET is derived from data collected from the accelerometers from the Samsung Galaxy S 

Smartphone.  The original data is split into several data sets, which must be combined, organized, summarized and grouped and 

output as a TIDY DATA SET.  The TIDY DATA SET contains the average for each measurement variable for each activity and each 

subject in the study. The data supplied includes:

Training data:

Measurements – 7352 observations of 561 variables each (X_train.txt)

Features –  561 feature heading labels for the 561 variables (features.txt)

Activities – 6 activities (y_train.txt)

Activity Names – the label names for each of the 6 activities (activity_labels.txt)

Subjects – 15 subjects  who performed the 6 training activities and generated the data for the 561 features consisting of 

accelerometer measurements (subject_train.txt) 

Testing data:

Measurements – 2947 observations of 561 variables each (Y_train.txt)

Features – 561 feature heading labels for the 561 variables (features.txt)

Activities – 6 activities (y_test.txt)

Activity Names – the label names for each of the 6 activities (activity_labels.txt)

Subjects --  15 subjects who performed the six training activities and generated the data for the 561 features consisting of 

accelerometer measurements (subject_test.txt) 

PREPARATORY WORK:

This data is first combined and reorganized into a tiny_ordered_data.txt file which preserves the nature and order of the data 

in the original files. 

For example, the tiny_ordered_data.txt file has a:
-	Record number attribute (REC_ID) , which was assigned to the original data in the original order  to preserve the 

order of the data. Record numbers are assigned in order from 1 to 7352 for the training data and from 7353 to 10299 for the 

testing data.  
-	A type (training or testing)  attribute (TYPE_train_or_test) was created and assigned 1 for training data and 2 for 

testing data.  
-	The feature headings are bound to the column measurements of the training and testing data.
-	The training and testing data are combined into one data set, in order by record number.
-	The activities are bound to each row of measurement data in the combined data set and each activity is named .
-	The subjects are bound to the testing data of the combined data set.

TIDY DATA SET:

The TIDY DATA SET (tiny_data.txt) is generated from the tiny_ordered_data.txt file and consists of the averages calculated on 

the measurements on the mean and standard deviation data for each measurement in  the tiny_ordered_data.txt file.  The 

averages are summarized and grouped by Subject and Activity (the record number and type fields are not included the 

tiny_data.txt file).

The resulting TIDY DATA SET consists of 2 categorical variables (Subject and Activity) and 64 calculated means of the mean 

measurement variables.  There are 180 rows (30 subjects, 6 activities each)

DATA DICTIONARY FOR TIDY DATA SET: 

Subject 		30 subjects, coded 1 - 30

1	Subject #1
2	Subject #2
3	Subject #3
.
.
.
30	Subject #30

Activity		6 activities for each of the 30 subjects, coded by Activity Name

LAYING
SITTING
STANDING
WALKING
WALKING_DOWNSTAIRS
WALKING_UPSTAIRS

Calculated mean Measurements of Mean (mean() or std() only) Measurement Variables -- 
	64 mean variables (attributes). Column headings are listed below:

tBodyAcc.mean...X
tBodyAcc.mean...Y
tBodyAcc.mean...Z
tBodyAcc.std...X
tBodyAcc.std...Y
tBodyAcc.std...Z
tGravityAcc.mean...X
tGravityAcc.mean...Y
tGravityAcc.mean...Z
tGravityAcc.std...X
tGravityAcc.std...Y
tGravityAcc.std...Z
tBodyAccJerk.mean...X
tBodyAccJerk.mean...Y
tBodyAccJerk.mean...Z
tBodyAccJerk.std...X
tBodyAccJerk.std...Y
tBodyAccJerk.std...Z
tBodyGyro.mean...X
tBodyGyro.mean...Y
tBodyGyro.mean...Z
tBodyGyro.std...X
tBodyGyro.std...Y
tBodyGyro.std...Z
tBodyGyroJerk.mean...X
tBodyGyroJerk.mean...Y
tBodyGyroJerk.mean...Z
tBodyGyroJerk.std...X
tBodyGyroJerk.std...Y
tBodyGyroJerk.std...Z
tBodyAccMag.mean..
tBodyAccMag.std..
tGravityAccMag.mean..
tGravityAccMag.std..
tBodyAccJerkMag.mean..
tBodyAccJerkMag.std..
tBodyGyroMag.mean..
tBodyGyroMag.std..
tBodyGyroJerkMag.mean..
tBodyGyroJerkMag.std..
fBodyAcc.mean...X
fBodyAcc.mean...Y
fBodyAcc.mean...Z
fBodyAcc.std...X
fBodyAcc.std...Y
fBodyAcc.std...Z
fBodyAccJerk.mean...X
fBodyAccJerk.mean...Y
fBodyAccJerk.mean...Z
fBodyAccJerk.std...X
fBodyAccJerk.std...Y
fBodyAccJerk.std...Z
fBodyGyro.mean...X
fBodyGyro.mean...Y
fBodyGyro.mean...Z
fBodyGyro.std...X
fBodyGyro.std...Y
fBodyGyro.std...Z
fBodyAccMag.mean..
fBodyAccMag.std..
fBodyBodyGyroMag.mean..
fBodyBodyGyroMag.std..
fBodyBodyGyroJerkMag.mean..
fBodyBodyGyroJerkMag.std..					
