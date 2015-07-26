# GettingAndCleaningData

## Code from course project

### `run_analysis.R`

Script that does the following:

* downloads the Human Activity Recognition Dataset from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each measurement. 
    
* Produces a new tidy data set with the average of each variable for each activity and each subject
  * Using descriptive activity names to name the activities
  * Using descriptive variable names

* Writes the new tidy data set to a file called *new_tidy_data.txt*

see `CodeBook.md` in this repository for more details   