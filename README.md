# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.  

Submit requirements: 

1. A **tidy data set** as described below.
2. A **link to a Github repository** *with your script for performing the analysis*
3. A **code book** that *describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md*. 
4. A **README.md** in the repo with your scripts. *This repo explains how all of the scripts work and how they are connected.*  

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article][1] . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones][2]

[1]:http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/
[2]:http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip][3]

[3]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The aim is create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Info from README.txt

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured **3-axial linear acceleration** and **3-axial angular velocity** at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where *70% of the volunteers was selected for generating the training data and 30% the test data.*

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). *The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity*. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. *From each window, a vector of features was obtained by calculating variables from the time and frequency domain*. See **'features_info.txt' for more details**. 

### For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The **dataset** includes the following files:


- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all (561) features. Labels of columns in X_test.txt
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': **Training set**. The set of variables that were estimated from  signals.
- 'train/y_train.txt': Training labels. What kind of Activity.
- 'test/X_test.txt': Test set. The set of variables that were estimated from  signals.
- 'test/y_test.txt': Test labels. What kind of Activity.

Also, the following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Data Directory Structure

**UCI HAR Dataset/**

- *README.txt*: this file
- *Activity_labels.txt*: Links the class labels with their activity name ( 1-WALKING, 2-WALKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING ). 6 obs of 2 variables. 6 obs of 2 variables.
- *features.txt*: List of all features (described in 'features_info.txt'). A 561-feature vector with time and frequency domain variables. 561 obs of 2 variables.
- *features_info.txt*: Shows information about the variables used on the feature vector.
- **test/**
    + *subject_test.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 2497 obs of 1 variables.
    + *X_test.txt*: **Training set**. 2497 obs of 561 variables
    + *y_test.txt*: (range from 1 to 6). 2497 obs of 1 variables.
    + **Inertial Signals/**
        + *body_acc_x_test.txt*: The body acceleration signal obtained by subtracting the gravity from the total acceleration. Every row shows a 128 element vector. 2497 obs of 128 variables.
        + *body_acc_y_test.txt* 2497 obs of 128 variables.
        + *body_acc_z_test.txt* 2497 obs of 128 variables.
        + *body_gyro_x_test.txt*: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. Every row shows a 128 element vector. 2497 obs of 128 variables.
        + *body_gyro_y_test.txt* 2497 obs of 128 variables.
        + *body_gyro_z_test.txt* 2497 obs of 128 variables.
        + *total_acc_x_test.txt*: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. 2497 obs of 128 variables.
        + *total_acc_y_test.txt*: 2497 obs of 128 variables.
        + *total_acc_z_test.txt*: 2497 obs of 128 variables.
- **train/**
    + *subject_train.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 7352 obs of 1 variables.
    + *X_train.txt*: **Training set**. 7352 obs of 561 variables
    + *y_train.txt*: (range from 1 to 6). 7352 obs of 1 variables.
    + **Inertial Signals/**
        + *body_acc_x_train.txt*: The body acceleration signal obtained by subtracting the gravity from the total acceleration. Every row shows a 128 element vector. 7352 obs of 128 variables.
        + *body_acc_y_train.txt* 7352 obs of 128 variables.
        + *body_acc_z_train.txt* 7352 obs of 128 variables.
        + *body_gyro_x_train.txt*: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. Every row shows a 128 element vector. 7352 obs of 128 variables.
        + *body_gyro_y_train.txt* 7352 obs of 128 variables.
        + *body_gyro_z_train.txt* 7352 obs of 128 variables.
        + *total_acc_x_train.txt*: 7352 acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. 7352 obs of 128 variables.
        + *total_acc_y_train.txt*: 7352 obs of 128 variables.
        + *total_acc_z_train.txt*: 7352 obs of 128 variables.

## How the script works

### Relevant files

Taking into account the above definition of files included in **dataset**, these are the test files to consider:

- Test set column names: ./UCI HAR Dataset/features.txt (561 obs. of 2 variables)
- Activity labels: ./UCI HAR Dataset/activity_labels.txt (6 obs. of 2 variable)
- Test set: ./UCI HAR Dataset/test/X_test.txt (2947 obs. of 561 variables)
- Activity kind column: ./UCI HAR Dataset/test/y_test.txt (2947 obs. of 1 variable)
- subject: ./UCI HAR Dataset/test/y_test.txt (2947 obs. of 1 variable)

And reciprocally these are the train files:

- Train set column names: ./UCI HAR Dataset/features.txt (561 obs. of 2 variables)
- Activity labels: ./UCI HAR Dataset/activity_labels.txt (6 obs. of 2 variable)
- Train set: ./UCI HAR Dataset/Train/X_train.txt (2947 obs. of 561 variables)
- Activity kind column: ./UCI HAR Dataset/test/y_test.txt (2947 obs. of 1 variable)
- subject: ./UCI HAR Dataset/Train/y_train.txt (2947 obs. of 1 variable)

### Merging the training and the test sets to create one data set.

The process is as follows:

1. Read all relevant test files.
2. Build a test dataset.
    + Add Subject id and provide a readable name for this column.
    + Add Activity label and provide a readable name for this column.
    + Get data for all features, cleaning "()" and "-" from col names.
    + Attach just mean and std columns and return dataset obtained.
3. The same to build train dataset.
4. Bind test and train datasets by rows.
5. Use dplyr 
    + To group the obtained datase by Activity and Subject.
    + And finally calculate the average of each variable for each activity and each subject in a tidy dataset.
6. Write tidy dataset as a txt file created with write.table() using row.name=FALSE
    
Point 1, 2 and 3 are performed by function procRawDataSet():

```
procRawDataSet <- function (set) {
    
    # Build up needed directory and file names 
    dataDirectory <- "./UCI HAR Dataset"
    rawDataSet_fn <- file.path(dataDirectory, set, sprintf("X_%s.txt", set))
    features_fn <- file.path(dataDirectory, "features.txt")
    activityType_fn <- file.path(dataDirectory, set, sprintf("y_%s.txt", set))
    activityLabels_fn <- file.path(dataDirectory, "activity_labels.txt")
    subject_fn <- file.path(dataDirectory, set, sprintf("subject_%s.txt", set))
    
    # Load needed files
    rawDataSet <- read.table(rawDataSet_fn)
    features <- read.table(features_fn)
    activityType <- read.table(activityType_fn)
    activityLabels <- read.table(activityLabels_fn)
    subject <- read.table(subject_fn)
    
    # Get subject data
    my_dataset <- data.frame()
    names(subject) <- "Subject"
    my_dataset <- subject
    
    # Get activity appropiated labels
    my_dataset$Activity <- sapply(activityType$V1, putLabel <- function(x) {
        activityLabels[activityLabels$V1 == x, "V2"]
    })
    
    # Get data for all features, cleaning "()" and "-" from col names
    names(rawDataSet) <- gsub("\\(\\)","", features$V2)
    names(rawDataSet) <- gsub("\\-","_", names(rawDataSet))
    
    # Attach just mean and std columns and return dataset obtained
    col_mn_std <- grep("mean|std", names(rawDataSet))
    cbind(my_dataset, rawDataSet[, col_mn_std])
}
```

Point 4 is simply:

```
## Merge the training and the test sets to create one data set.
my_DataSet <- procRawDataSet("test")
my_DataSet <- rbind(my_DataSet, procRawDataSet("train"))
```

And point 5:

```
library(dplyr)

# Group by Activity, Subject
tbl_my_dDataSet <- tbl_df(my_DataSet)
tbl_my_dDataSet_group_by <- group_by(tbl_my_dDataSet, Activity, Subject)

# Create a second, independent tidy data set with the average of each 
# variable for each activity and each subject
tidy_DataSet<-as.data.frame(summarise_each(tbl_my_dDataSet_group_by, 
                                           funs(mean)))

```

Finally, point 6:

```
# Write it as a txt file created with write.table() using row.name=FALSE
write.table(tidy_DataSet, "tidy_DataSet.txt", row.names=FALSE )
```

If you wanna check this file, just run:

```
checkData <- read.table("tidy_DataSet.txt", header = TRUE)
```

(your working directory must be the same as where you donloaded the file "tidy_DataSet.txt" )

## Code book

```
     [1] "Activity"                      
     [2] "Subject"                      
   [3-5] "tBodyAcc_mean_XYZ"    
   [6-8] "tBodyAcc_std_XYZ"                   
  [9-11] "tGravityAcc_mean_XYZ"              
 [12-14] "tGravityAcc_std_XYZ"                
 [15-17] "tBodyAccJerk_mean_XYZ"         
 [18-20] "tBodyAccJerk_std_XYZ"           
 [21-23] "tBodyGyro_mean_XYZ"               
 [24-26] "tBodyGyro_std_XYZ"                  
 [27-29] "tBodyGyroJerk_mean_XYZ"        
 [30-32] "tBodyGyroJerk_std_XYZ"          
    [33] "tBodyAccMag_mean"              
    [34] "tBodyAccMag_std"              
    [35] "tGravityAccMag_mean"           
    [36] "tGravityAccMag_std"           
    [37] "tBodyAccJerkMag_mean"          
    [38] "tBodyAccJerkMag_std"          
    [39] "tBodyGyroMag_mean"             
    [40] "tBodyGyroMag_std"             
    [41] "tBodyGyroJerkMag_mean"         
    [42] "tBodyGyroJerkMag_std"         
 [43-45] "fBodyAcc_mean_XYZ"                           
 [46-48] "fBodyAcc_std_XYZ"                              
 [49-51] "fBodyAcc_meanFreq_XYZ"           
 [52-54] "fBodyAccJerk_mean_XYZ"         
 [55-57] "fBodyAccJerk_std_XYZ"            
 [58-60] "fBodyAccJerk_meanFreq_XYZ"     
 [61-63] "fBodyGyro_mean_XYZ              
 [64-66] "fBodyGyro_std_XYZ"            
 [67-69] "fBodyGyro_meanFreq_XYZ"          
    [70] "fBodyAccMag_mean"              
    [71] "fBodyAccMag_std"               
    [72] "fBodyAccMag_meanFreq"         
    [73] "fBodyBodyAccJerkMag_mean"      
    [74] "fBodyBodyAccJerkMag_std"      
    [75] "fBodyBodyAccJerkMag_meanFreq"  
    [76] "fBodyBodyGyroMag_mean"        
    [77] "fBodyBodyGyroMag_std"          
    [78] "fBodyBodyGyroMag_meanFreq"    
    [79] "fBodyBodyGyroJerkMag_mean"     
    [80] "fBodyBodyGyroJerkMag_std"     
    [81] "fBodyBodyGyroJerkMag_meanFreq"
```
 
 
Features Explanation 
====================

```
"Activity": class labels with their activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING )

"Subject": the # id of the subject who performed the activity. Its range is from 1 to 30.
```

The acceleration signals from the smartphone accelerometer (BodyAcc, GravityAcc) are in standard gravity units 'g'.  
The angular velocity signals measured by the gyroscope (BodyGyro) are in radians/second. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

```
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyGyro-XYZ
```

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 

```
tBodyAccJerk-XYZ
tBodyGyroJerk-XYZ
```

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag):

```
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
```

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals):

```
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```

These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

```
mean(): Mean value
std(): Standard deviation
```
