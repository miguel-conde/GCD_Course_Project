# Getting and Cleaning Data Course Project


# Abstract

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Through this project we will transform a bunch of data into a tidy data set as required.

The steps to do this will be:

1. Careful reading of instructions to understand the best of them.
2. Downloading data and exploring them to understand structure and meaning.
3. Decide which data we need and what we will include in our tidy dataset (requirements).
4. Write an script to get the data set.
5. Run the script and check its results against requirements. Repeat the process until match results and requirements.
6. Document all the process in this document.




# Understanding the instructions - Key points

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

## Downloading data and exploring them to understand structure and meaning.

I downloaded the [file][3] to my working directory and uncompressed it. I found it created a directory, UCI HAR Dataset/, in my working directory, with this structure:


```r
dir("UCI HAR Dataset", full.names=T, recursive = T)
```

```
##  [1] "UCI HAR Dataset/activity_labels.txt"                         
##  [2] "UCI HAR Dataset/features.txt"                                
##  [3] "UCI HAR Dataset/features_info.txt"                           
##  [4] "UCI HAR Dataset/Notas para Code Book.txt"                    
##  [5] "UCI HAR Dataset/README.txt"                                  
##  [6] "UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"   
##  [7] "UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"   
##  [8] "UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"   
##  [9] "UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"  
## [10] "UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"  
## [11] "UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"  
## [12] "UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"  
## [13] "UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"  
## [14] "UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"  
## [15] "UCI HAR Dataset/test/subject_test.txt"                       
## [16] "UCI HAR Dataset/test/X_test.txt"                             
## [17] "UCI HAR Dataset/test/y_test.txt"                             
## [18] "UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt" 
## [19] "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt" 
## [20] "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt" 
## [21] "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"
## [22] "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
## [23] "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"
## [24] "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"
## [25] "UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"
## [26] "UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"
## [27] "UCI HAR Dataset/train/subject_train.txt"                     
## [28] "UCI HAR Dataset/train/X_train.txt"                           
## [29] "UCI HAR Dataset/train/y_train.txt"
```

We have a README.txt. Let's check it.

### Info from README.txt

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured **3-axial linear acceleration** and **3-axial angular velocity** at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where *70% of the volunteers was selected for generating the training data and 30% the test data.*

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). *The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity*. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. *From each window, a vector of features was obtained by calculating variables from the time and frequency domain*. See **'features_info.txt' for more details**. 

#### For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### The **dataset** includes the following files:

This is very important, as defines the concept "dataset" the instructions referred to ("Merges the *training and the test sets* to create one data set.")

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

As a first conclusion, I infer **we can ignore Inertial Signals in train and test data sets and concentrate in "X_train.txt"" and "X_test.text"**

From README.txt we learn this info about what's contained in UCI HAR Dataset/:

**UCI HAR Dataset/**  

- *README.txt*: this file  
- *Activity_labels.txt*: Links the class labels with their activity name   
- *features.txt*: List of all features. A 561-feature vector with time and frequency domain variables. *Why 561?*  
- *features_info.txt*: Shows information about the variables used on the feature vector.  
- **test/**  
    + *subject_test.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. *30 subjects?*  
    + *X_test.txt*: **Training set**.   
    + *y_test.txt*: (range from 1 to 6). *Why this range?*  
    + **Inertial Signals/**  
        + *body_acc_x_test.txt*: The body acceleration signal obtained by subtracting the gravity from the total acceleration. Every row shows a 128 element vector.   
        + *body_acc_y_test.txt* 
        + *body_acc_z_test.txt* 
        + *body_gyro_x_test.txt*: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. Every row shows a 128 element vector. 
        + *body_gyro_y_test.txt* 
        + *body_gyro_z_test.txt* 
        + *total_acc_x_test.txt*: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
        + *total_acc_y_test.txt*: 
        + *total_acc_z_test.txt*: 
- **train/**
    + *subject_train.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
    + *X_train.txt*: **Training set**. 
    + *y_train.txt*: (range from 1 to 6). 
    + **Inertial Signals/**
        + *body_acc_x_train.txt*: The body acceleration signal obtained by subtracting the gravity from the total acceleration. Every row shows a 128 element vector. 
        + *body_acc_y_train.txt* 
        + *body_acc_z_train.txt* 
        + *body_gyro_x_train.txt*: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. Every row shows a 128 element vector. 
        + *body_gyro_y_train.txt* 
        + *body_gyro_z_train.txt* 
        + *total_acc_x_train.txt*: 7352 acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
        + *total_acc_y_train.txt*: 
        + *total_acc_z_train.txt*: 


### Exploring Data

Let's begin with "Activity_labels.txt":


```r
probe <- read.table("./UCI HAR Dataset/activity_labels.txt")
dim(probe)
```

```
## [1] 6 2
```

```r
str(probe)
```

```
## 'data.frame':	6 obs. of  2 variables:
##  $ V1: int  1 2 3 4 5 6
##  $ V2: Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1
```

```r
head(probe)
```

```
##   V1                 V2
## 1  1            WALKING
## 2  2   WALKING_UPSTAIRS
## 3  3 WALKING_DOWNSTAIRS
## 4  4            SITTING
## 5  5           STANDING
## 6  6             LAYING
```
So it seems we have here how activity # ids are linked to activity names.

Now "features.txt":

```r
probe <- read.table("./UCI HAR Dataset/features.txt")
dim(probe)
```

```
## [1] 561   2
```

```r
str(probe)
```

```
## 'data.frame':	561 obs. of  2 variables:
##  $ V1: int  1 2 3 4 5 6 7 8 9 10 ...
##  $ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ...
```

```r
head(probe)
```

```
##   V1                V2
## 1  1 tBodyAcc-mean()-X
## 2  2 tBodyAcc-mean()-Y
## 3  3 tBodyAcc-mean()-Z
## 4  4  tBodyAcc-std()-X
## 5  5  tBodyAcc-std()-Y
## 6  6  tBodyAcc-std()-Z
```

```r
tail(probe)
```

```
##      V1                                   V2
## 556 556 angle(tBodyAccJerkMean),gravityMean)
## 557 557     angle(tBodyGyroMean,gravityMean)
## 558 558 angle(tBodyGyroJerkMean,gravityMean)
## 559 559                 angle(X,gravityMean)
## 560 560                 angle(Y,gravityMean)
## 561 561                 angle(Z,gravityMean)
```

We find here 561 apparent statistic names about some measures. What are them? Why there are 561? Perhaps we could find answers in "features_info.txt".

In "features_info.txt" we have this important info:

```
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

33:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

17:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
```
So we have 33 signal and 17 statistics. One moment! Let's see...

```r
33*17
```

```
## [1] 561
```
Yes! This is why we have 561 features!

From now on we'll focus on test/ subdirectory, as train/ has the same structure.

Let's go now with "test/subject_test.txt":


```r
probe <- read.table("./UCI HAR Dataset/test/subject_test.txt")
dim(probe)
```

```
## [1] 2947    1
```

```r
str(probe)
```

```
## 'data.frame':	2947 obs. of  1 variable:
##  $ V1: int  2 2 2 2 2 2 2 2 2 2 ...
```

```r
head(probe)
```

```
##   V1
## 1  2
## 2  2
## 3  2
## 4  2
## 5  2
## 6  2
```

```r
tail(probe)
```

```
##      V1
## 2942 24
## 2943 24
## 2944 24
## 2945 24
## 2946 24
## 2947 24
```

```r
unique(probe)
```

```
##      V1
## 1     2
## 303   4
## 620   9
## 908  10
## 1202 12
## 1522 13
## 1849 18
## 2213 20
## 2567 24
```

```r
nrow(unique(probe))
```

```
## [1] 9
```
We have 9 rows, each with numbers just in `ras.character(unique(probe$V1))`. We know from README.txt that each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. This appears the 30% subjects used for the test set. Lets check with the train one:


```r
probe <- read.table("./UCI HAR Dataset/train/subject_train.txt")
dim(probe)
```

```
## [1] 7352    1
```

```r
str(probe)
```

```
## 'data.frame':	7352 obs. of  1 variable:
##  $ V1: int  1 1 1 1 1 1 1 1 1 1 ...
```

```r
head(probe)
```

```
##   V1
## 1  1
## 2  1
## 3  1
## 4  1
## 5  1
## 6  1
```

```r
tail(probe)
```

```
##      V1
## 7347 30
## 7348 30
## 7349 30
## 7350 30
## 7351 30
## 7352 30
```

```r
unique(probe)
```

```
##      V1
## 1     1
## 348   3
## 689   5
## 991   6
## 1316  7
## 1624  8
## 1905 11
## 2221 14
## 2544 15
## 2872 16
## 3238 17
## 3606 19
## 3966 21
## 4374 22
## 4695 23
## 5067 25
## 5476 26
## 5868 27
## 6244 28
## 6626 29
## 6970 30
```

```r
nrow(unique(probe))
```

```
## [1] 21
```
there are 21 subjects here, the 70% required for the train set. And they are diferent from the subjects in the test set:


```r
probe_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
probe_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
intersect(unique(probe_test),unique(probe_train))
```

```
## data frame with 0 columns and 0 rows
```

That's OK!

Let's explore "X_test.txt" now:


```r
probe <- read.table("./UCI HAR Dataset/test/X_test.txt")
dim(probe)
```

```
## [1] 2947  561
```

```r
str(probe)
```

```
## 'data.frame':	2947 obs. of  561 variables:
##  $ V1  : num  0.257 0.286 0.275 0.27 0.275 ...
##  $ V2  : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
##  $ V3  : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
##  $ V4  : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
##  $ V5  : num  -0.92 -0.967 -0.97 -0.973 -0.967 ...
##  $ V6  : num  -0.668 -0.945 -0.963 -0.967 -0.978 ...
##  $ V7  : num  -0.953 -0.987 -0.994 -0.995 -0.994 ...
##  $ V8  : num  -0.925 -0.968 -0.971 -0.974 -0.966 ...
##  $ V9  : num  -0.674 -0.946 -0.963 -0.969 -0.977 ...
##  $ V10 : num  -0.894 -0.894 -0.939 -0.939 -0.939 ...
##  $ V11 : num  -0.555 -0.555 -0.569 -0.569 -0.561 ...
##  $ V12 : num  -0.466 -0.806 -0.799 -0.799 -0.826 ...
##  $ V13 : num  0.717 0.768 0.848 0.848 0.849 ...
##  $ V14 : num  0.636 0.684 0.668 0.668 0.671 ...
##  $ V15 : num  0.789 0.797 0.822 0.822 0.83 ...
##  $ V16 : num  -0.878 -0.969 -0.977 -0.974 -0.975 ...
##  $ V17 : num  -0.998 -1 -1 -1 -1 ...
##  $ V18 : num  -0.998 -1 -1 -0.999 -0.999 ...
##  $ V19 : num  -0.934 -0.998 -0.999 -0.999 -0.999 ...
##  $ V20 : num  -0.976 -0.994 -0.993 -0.995 -0.993 ...
##  $ V21 : num  -0.95 -0.974 -0.974 -0.979 -0.967 ...
##  $ V22 : num  -0.83 -0.951 -0.965 -0.97 -0.976 ...
##  $ V23 : num  -0.168 -0.302 -0.618 -0.75 -0.591 ...
##  $ V24 : num  -0.379 -0.348 -0.695 -0.899 -0.74 ...
##  $ V25 : num  0.246 -0.405 -0.537 -0.554 -0.799 ...
##  $ V26 : num  0.521 0.507 0.242 0.175 0.116 ...
##  $ V27 : num  -0.4878 -0.1565 -0.115 -0.0513 -0.0289 ...
##  $ V28 : num  0.4823 0.0407 0.0327 0.0342 -0.0328 ...
##  $ V29 : num  -0.0455 0.273 0.1924 0.1536 0.2943 ...
##  $ V30 : num  0.21196 0.19757 -0.01194 0.03077 0.00063 ...
##  $ V31 : num  -0.1349 -0.1946 -0.0634 -0.1293 -0.0453 ...
##  $ V32 : num  0.131 0.411 0.471 0.446 0.168 ...
##  $ V33 : num  -0.0142 -0.3405 -0.5074 -0.4195 -0.0682 ...
##  $ V34 : num  -0.106 0.0776 0.1885 0.2715 0.0744 ...
##  $ V35 : num  0.0735 -0.084 -0.2316 -0.2258 0.0271 ...
##  $ V36 : num  -0.1715 0.0353 0.6321 0.4164 -0.1459 ...
##  $ V37 : num  0.0401 -0.0101 -0.5507 -0.2864 -0.0502 ...
##  $ V38 : num  0.077 -0.105 0.3057 -0.0638 0.2352 ...
##  $ V39 : num  -0.491 -0.429 -0.324 -0.167 0.29 ...
##  $ V40 : num  -0.709 0.399 0.28 0.545 0.458 ...
##  $ V41 : num  0.936 0.927 0.93 0.929 0.927 ...
##  $ V42 : num  -0.283 -0.289 -0.288 -0.293 -0.303 ...
##  $ V43 : num  0.115 0.153 0.146 0.143 0.138 ...
##  $ V44 : num  -0.925 -0.989 -0.996 -0.993 -0.996 ...
##  $ V45 : num  -0.937 -0.984 -0.988 -0.97 -0.971 ...
##  $ V46 : num  -0.564 -0.965 -0.982 -0.992 -0.968 ...
##  $ V47 : num  -0.93 -0.989 -0.996 -0.993 -0.996 ...
##  $ V48 : num  -0.938 -0.983 -0.989 -0.971 -0.971 ...
##  $ V49 : num  -0.606 -0.965 -0.98 -0.993 -0.969 ...
##  $ V50 : num  0.906 0.856 0.856 0.856 0.854 ...
##  $ V51 : num  -0.279 -0.305 -0.305 -0.305 -0.313 ...
##  $ V52 : num  0.153 0.153 0.139 0.136 0.134 ...
##  $ V53 : num  0.944 0.944 0.949 0.947 0.946 ...
##  $ V54 : num  -0.262 -0.262 -0.262 -0.273 -0.279 ...
##  $ V55 : num  -0.0762 0.149 0.145 0.1421 0.1309 ...
##  $ V56 : num  -0.0178 0.0577 0.0406 0.0461 0.0554 ...
##  $ V57 : num  0.829 0.806 0.812 0.809 0.804 ...
##  $ V58 : num  -0.865 -0.858 -0.86 -0.854 -0.843 ...
##  $ V59 : num  -0.968 -0.957 -0.961 -0.963 -0.965 ...
##  $ V60 : num  -0.95 -0.988 -0.996 -0.992 -0.996 ...
##  $ V61 : num  -0.946 -0.982 -0.99 -0.973 -0.972 ...
##  $ V62 : num  -0.76 -0.971 -0.979 -0.996 -0.969 ...
##  $ V63 : num  -0.425 -0.729 -0.823 -0.823 -0.83 ...
##  $ V64 : num  -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 ...
##  $ V65 : num  0.219 -0.465 -0.53 -0.7 -0.302 ...
##  $ V66 : num  -0.43 -0.51 -0.295 -0.343 -0.482 ...
##  $ V67 : num  0.431 0.525 0.305 0.359 0.539 ...
##  $ V68 : num  -0.432 -0.54 -0.315 -0.375 -0.596 ...
##  $ V69 : num  0.433 0.554 0.326 0.392 0.655 ...
##  $ V70 : num  -0.795 -0.746 -0.232 -0.233 -0.493 ...
##  $ V71 : num  0.781 0.733 0.169 0.176 0.463 ...
##  $ V72 : num  -0.78 -0.737 -0.155 -0.169 -0.465 ...
##  $ V73 : num  0.785 0.749 0.164 0.185 0.483 ...
##  $ V74 : num  -0.984 -0.845 -0.429 -0.297 -0.536 ...
##  $ V75 : num  0.987 0.869 0.44 0.304 0.544 ...
##  $ V76 : num  -0.989 -0.893 -0.451 -0.311 -0.553 ...
##  $ V77 : num  0.988 0.913 0.458 0.315 0.559 ...
##  $ V78 : num  0.981 0.945 0.548 0.986 0.998 ...
##  $ V79 : num  -0.996 -0.911 -0.335 0.653 0.916 ...
##  $ V80 : num  -0.96 -0.739 0.59 0.747 0.929 ...
##  $ V81 : num  0.072 0.0702 0.0694 0.0749 0.0784 ...
##  $ V82 : num  0.04575 -0.01788 -0.00491 0.03227 0.02228 ...
##  $ V83 : num  -0.10604 -0.00172 -0.01367 0.01214 0.00275 ...
##  $ V84 : num  -0.907 -0.949 -0.991 -0.991 -0.992 ...
##  $ V85 : num  -0.938 -0.973 -0.971 -0.973 -0.979 ...
##  $ V86 : num  -0.936 -0.978 -0.973 -0.976 -0.987 ...
##  $ V87 : num  -0.916 -0.969 -0.991 -0.99 -0.991 ...
##  $ V88 : num  -0.937 -0.974 -0.973 -0.973 -0.977 ...
##  $ V89 : num  -0.949 -0.979 -0.975 -0.978 -0.985 ...
##  $ V90 : num  -0.903 -0.915 -0.992 -0.992 -0.994 ...
##  $ V91 : num  -0.95 -0.981 -0.975 -0.975 -0.986 ...
##  $ V92 : num  -0.891 -0.978 -0.962 -0.962 -0.986 ...
##  $ V93 : num  0.898 0.898 0.994 0.994 0.994 ...
##  $ V94 : num  0.95 0.968 0.976 0.976 0.98 ...
##  $ V95 : num  0.946 0.966 0.966 0.97 0.985 ...
##  $ V96 : num  -0.931 -0.974 -0.982 -0.983 -0.987 ...
##  $ V97 : num  -0.995 -0.998 -1 -1 -1 ...
##  $ V98 : num  -0.997 -0.999 -0.999 -0.999 -1 ...
##  $ V99 : num  -0.997 -0.999 -0.999 -0.999 -1 ...
##   [list output truncated]
```

We have 2947 rows and 561 columns (the features).

Last but not least, "y_test.txt":

```r
probe <- read.table("./UCI HAR Dataset/test/y_test.txt")
dim(probe)
```

```
## [1] 2947    1
```

```r
str(probe)
```

```
## 'data.frame':	2947 obs. of  1 variable:
##  $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
```

```r
head(probe)
```

```
##   V1
## 1  5
## 2  5
## 3  5
## 4  5
## 5  5
## 6  5
```

```r
tail(probe)
```

```
##      V1
## 2942  2
## 2943  2
## 2944  2
## 2945  2
## 2946  2
## 2947  2
```

```r
unique(probe)
```

```
##     V1
## 1    5
## 32   4
## 56   6
## 80   1
## 110  3
## 134  2
```

```r
nrow(unique(probe)) 
```

```
## [1] 6
```

So they must be the activity # ids.

**Summing up:**  

- We have a main **Training set**, "./UCI HAR Dataset/Train/X_train.txt", with 2497 obs of 561 variables (the features).
- "./UCI HAR Dataset/activity_labels.txt" (6 obs. of 2 variables) links the class labels with their activity name ( 1-WALKING, 2-WALKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING )
- ./UCI HAR Dataset/features.txt: Test set column names. List of all features (described in 'features_info.txt'). 561 obs. of 2 variables.
- "./UCI HAR Dataset/test/y_test.txt": Activity kind column for dataset. 2947 obs. of 1 variable.
- "./UCI HAR Dataset/test/subject_test.txt". subject columns for dataset. 2947 obs. of 1 variable.

### Choosing variables

In "./UCI HAR Dataset/Train/X_train.txt" we have 561 features. We are required to *extract only the measurements on the mean and standard deviation for each measurement*.

Let's take a look of the features including "mean" or "std" in its name:


```r
probe <- read.table("./UCI HAR Dataset/features.txt") 
grep("mean|std", probe$V2, value=TRUE)
```

```
##  [1] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
##  [3] "tBodyAcc-mean()-Z"               "tBodyAcc-std()-X"               
##  [5] "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
##  [7] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"           
##  [9] "tGravityAcc-mean()-Z"            "tGravityAcc-std()-X"            
## [11] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
## [13] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
## [15] "tBodyAccJerk-mean()-Z"           "tBodyAccJerk-std()-X"           
## [17] "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
## [19] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"             
## [21] "tBodyGyro-mean()-Z"              "tBodyGyro-std()-X"              
## [23] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
## [25] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
## [27] "tBodyGyroJerk-mean()-Z"          "tBodyGyroJerk-std()-X"          
## [29] "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
## [31] "tBodyAccMag-mean()"              "tBodyAccMag-std()"              
## [33] "tGravityAccMag-mean()"           "tGravityAccMag-std()"           
## [35] "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"          
## [37] "tBodyGyroMag-mean()"             "tBodyGyroMag-std()"             
## [39] "tBodyGyroJerkMag-mean()"         "tBodyGyroJerkMag-std()"         
## [41] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
## [43] "fBodyAcc-mean()-Z"               "fBodyAcc-std()-X"               
## [45] "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"               
## [47] "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"          
## [49] "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"          
## [51] "fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"          
## [53] "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
## [55] "fBodyAccJerk-std()-Z"            "fBodyAccJerk-meanFreq()-X"      
## [57] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
## [59] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
## [61] "fBodyGyro-mean()-Z"              "fBodyGyro-std()-X"              
## [63] "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"              
## [65] "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
## [67] "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"             
## [69] "fBodyAccMag-std()"               "fBodyAccMag-meanFreq()"         
## [71] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"      
## [73] "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"        
## [75] "fBodyBodyGyroMag-std()"          "fBodyBodyGyroMag-meanFreq()"    
## [77] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-std()"     
## [79] "fBodyBodyGyroJerkMag-meanFreq()"
```

As we can see, we have "()" and "-" in the features names. We'll have to take care of this when writing the script.

We'll use this broad definition of *measurements on the mean and standard deviation for each measurement*, althoug others are possible. For instance, if we recall what are real, non processed measurements, we should use jus this ones:


```r
grep("^t(BodyAcc|GravityAcc|BodyGyro)-(mean|std)\\(\\)-[XYZ]+", 
     probe$V2, value=TRUE)
```

```
##  [1] "tBodyAcc-mean()-X"    "tBodyAcc-mean()-Y"    "tBodyAcc-mean()-Z"   
##  [4] "tBodyAcc-std()-X"     "tBodyAcc-std()-Y"     "tBodyAcc-std()-Z"    
##  [7] "tGravityAcc-mean()-X" "tGravityAcc-mean()-Y" "tGravityAcc-mean()-Z"
## [10] "tGravityAcc-std()-X"  "tGravityAcc-std()-Y"  "tGravityAcc-std()-Z" 
## [13] "tBodyGyro-mean()-X"   "tBodyGyro-mean()-Y"   "tBodyGyro-mean()-Z"  
## [16] "tBodyGyro-std()-X"    "tBodyGyro-std()-Y"    "tBodyGyro-std()-Z"
```

So our *objetive* is to get a tidy dataset with:

- columns:79 features + 2 (Activity, Subject) = 81
- rows: 30 (Subjects) x 6 (activities) = 180.

## How the script works

### Relevant files

Taking into account the above, these are the test files to consider:

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

## CODE BOOK

```
     [1] "Activity"                      
     [2] "Subject"           
2
   [3-5] "tBodyAcc_mean_XYZ"        [6-8] "tBodyAcc_std_XYZ"
  [9-11] "tGravityAcc_mean_XYZ"     [12-14] "tGravityAcc_std_XYZ"       
 [15-17] "tBodyAccJerk_mean_XYZ"    [18-20] "tBodyAccJerk_std_XYZ"     
 [21-23] "tBodyGyro_mean_XYZ"       [24-26] "tBodyGyro_std_XYZ"             
 [27-29] "tBodyGyroJerk_mean_XYZ"   [30-32] "tBodyGyroJerk_std_XYZ"  
5 x 2 x 3 = 30 
    [33] "tBodyAccMag_mean"         [34] "tBodyAccMag_std"    
    [35] "tGravityAccMag_mean"      [36] "tGravityAccMag_std"    
    [37] "tBodyAccJerkMag_mean"     [38] "tBodyAccJerkMag_std"    
    [39] "tBodyGyroMag_mean"        [40] "tBodyGyroMag_std"    
    [41] "tBodyGyroJerkMag_mean"    [42] "tBodyGyroJerkMag_std"    
5 x 2 x 1 = 10    
 [43-45] "fBodyAcc_mean_XYZ"        [46-48] "fBodyAcc_std_XYZ"        [49-51] "fBodyAcc_meanFreq_XYZ"                
 [52-54] "fBodyAccJerk_mean_XYZ"    [55-57] "fBodyAccJerk_std_XYZ"    [58-60] "fBodyAccJerk_meanFreq_XYZ"    
 [61-63] "fBodyGyro_mean_XYZ        [64-66] "fBodyGyro_std_XYZ"       [67-69] "fBodyGyro_meanFreq_XYZ"
3 x 3 x 3 = 27  
 [70] "fBodyAccMag_mean"             [71] "fBodyAccMag_std"           [72] "fBodyAccMag_meanFreq"   
 [73] "fBodyBodyAccJerkMag_mean"     [74] "fBodyBodyAccJerkMag_std"   [75] "fBodyBodyAccJerkMag_meanFreq"
 [76] "fBodyBodyGyroMag_mean"        [77] "fBodyBodyGyroMag_std"      [78] "fBodyBodyGyroMag_meanFreq"
 [79] "fBodyBodyGyroJerkMag_mean"    [80] "fBodyBodyGyroJerkMag_std"  [81] "fBodyBodyGyroJerkMag_meanFreq"
4 x 3 x 1 = 12   

2 + 30 + 10 + 27 + 12 = 81
```
 
 
### Variables Explanation 

All the variables are *the mean and standard deviation* for each measurement as extracted from original dataset and *averaged for each activity and each subject*.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

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
