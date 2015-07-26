# Getting And Cleaning Data Course Project
# 
# You should create one R script called run_analysis.R that does the following.
# 
# 1 Merges the training and the test sets to create one data set. 
# 
# 2 Extracts only the measurements on the mean and standard deviation for each
# measurement.
# 
# 3 Uses descriptive activity names to name the activities in the data set 
# 
# 4 Appropriately labels the data set with descriptive variable names.
# 
# 5 From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.


## Goals for Tidy Data
## 1. Each variable forms a column
## 
## 2. Each observations forms a row
## 
## 3. Each table/file stores data about one kind of observation (e.g
## people/hospitals)

library(dplyr)
library(reshape2)

#
# Create data directory
#

if (!file.exists("data")) {
        dir.create("data")
}

##
## Get the Human Activity Recognition (HAR) Dataset
## Download using method = "curl"
##
# src_file = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# dest_file = "./data/HAR.zip"
# download.file(src_file, dest_file, method = "curl")
# dateDownloaded <- date()

##
## Read data into memory. 
## Use unz() for zipped files if necessary
## 

## Activity and Feature Labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                              colClasses="character")[,2]
feature_labels <- read.table("UCI HAR Dataset/features.txt", 
                             colClasses="character")[,2]


## Training Data
training_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt",
                                col.names=c("subject"))

training_data <- read.table("UCI HAR Dataset/train/X_train.txt",
                             col.names=as.character(feature_labels))
                            
training_activity <- read.table("UCI HAR Dataset/train/y_train.txt",
                                col.names=c("activity"))

## Add the subject and activity columns to the training data
training_data <- cbind(training_subjects, training_activity, training_data)

## Test Data
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt",
                            col.names=c("subject"))

test_data <- read.table("UCI HAR Dataset/test/X_test.txt",
                        col.names=as.character(feature_labels))

test_activity <- read.table("UCI HAR Dataset/test/y_test.txt",
                            col.names=c("activity"))

## Add the subject and activity columns to the test data
test_data <- cbind(test_subjects, test_activity, test_data)
                  
##
## Merges the training and the test sets to create one data set
##
merged_data <- merge(training_data, test_data, all = TRUE)

## 
## Extracts only the measurements on the mean and standard deviation for each
## measurement.
## 
selected_columns <- grep("subject|activity|mean\\.|std\\.",names(merged_data))
mean_std_data <- select(merged_data,selected_columns)

##
## Uses descriptive activity names to name the activities in the data set
##
mean_std_data$subject <- as.factor(mean_std_data$subject)
mean_std_data$activity <- as.factor(mean_std_data$activity)
levels(mean_std_data$activity) = activity_labels

##
## Appropriately labels the data set with descriptive variable names
## Convert labels to lower case, expand 'time' and 'frequency', remove '()'
##
feature_labels <- tolower(feature_labels)

feature_labels <- gsub("bodybody", "body", feature_labels)

feature_labels <- gsub("tbody", "time.body", feature_labels)
feature_labels <- gsub("tgravity", "time.gravity", feature_labels)

feature_labels <- gsub("fbody", "fft.body", feature_labels)
feature_labels <- gsub("fgravity", "fft.gravity", feature_labels)

feature_labels <- gsub("accjerk", "acc.jerk", feature_labels)
feature_labels <- gsub("gyrojerk", "gyro.jerk", feature_labels)

feature_labels <- gsub("accmag", "acc.mag", feature_labels)
feature_labels <- gsub("gyromag", "gyro.mag", feature_labels)
feature_labels <- gsub("jerkmag", "jerk.mag", feature_labels)

feature_labels <- gsub("bodyacc", "body.acc", feature_labels)
feature_labels <- gsub("bodygyro", "body.gyro", feature_labels)
feature_labels <- gsub("gravityacc", "gravity.acc", feature_labels)

feature_labels <- gsub("\\(\\)\\-", ".", feature_labels)
feature_labels <- gsub("\\(\\)", "", feature_labels)

descriptive_names <- c("subject", "activity", as.character(feature_labels))
names(mean_std_data) <- descriptive_names[selected_columns]

##
## Create a new tidy data set grouped by activity and subject and summarised by
## the means of the variables
##
#new_tidy_data <- mean_std_data %>% group_by(activity,subject) %>% summarise_each(funs(mean))
id_labels = c(1:2)
var_labels = c(3:68)
melt_data <- melt(mean_std_data, id_labels, measure.vars=var_labels)
new_tidy_data <- dcast(melt_data, activity+subject~variable,mean)
write.table(new_tidy_data, "./data/new_tidy_data.txt", row.names=FALSE)
