# - Test set: ./UCI HAR Dataset/test/X_test.txt (2947 obs. of 561 variables)
# - Test set column names: ./UCI HAR Dataset/features.txt (561 obs. of 
#   2 variables)
# - Activity kind column: ./UCI HAR Dataset/test/y_test.txt (2947 obs. of 
#   1 variable)
# - Activity labels: ./UCI HAR Dataset/activity_labels.txt (6 obs. of 
#   2 variable)
# - # subject: ./UCI HAR Dataset/test/y_test.txt (2947 obs. of 
#   1 variable)


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
    names(rawDataSet) <- gsub("\\(\\)" ,"", features$V2)
    names(rawDataSet) <- gsub("\\-", "_", names(rawDataSet))
    
    # Attach just mean and std columns and return dataset obtained
    reg_expr <- "mean|std"
    #reg_expr <- "^t(BodyAcc|GravityAcc|BodyGyro)_(mean|std)_[XYZ]+"
    col_mn_std <- grep(reg_expr, names(rawDataSet))
    cbind(my_dataset, rawDataSet[, col_mn_std])
}

# Merge the training and the test sets to create one data set.
my_DataSet <- procRawDataSet("test")
my_DataSet <- rbind(my_DataSet, procRawDataSet("train"))

library(dplyr)

# Group by Activity, Subject
tbl_my_dDataSet <- tbl_df(my_DataSet)
tbl_my_dDataSet_group_by <- group_by(tbl_my_dDataSet, Activity, Subject)

# Create a second, independent tidy data set with the average of each 
# variable for each activity and each subject
tidy_DataSet<-as.data.frame(summarise_each(tbl_my_dDataSet_group_by, 
                                           funs(mean)))

# Write it as a txt file created with write.table() using row.name=FALSE
write.table(tidy_DataSet, "tidy_DataSet.txt", row.names=FALSE )

