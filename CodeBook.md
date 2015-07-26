# GettingAndCleaningData

## Codebook from course project

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

See `README.txt` and `features_info.txt` in the *Human Activity Recognition Dataset* located here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip for more details. 

### Data Processing Performed

Executed script `run_analysis.R`

* downloaded the Human Activity Recognition Dataset from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* Merged the training and the test sets to create one data set.

* Extracted only the measurements on the mean and standard deviation for each measurement. 
    
* Produced a new tidy data set with the **average of each variable for each activity and each subject**
  * Using descriptive activity names to name the activities
  * Using descriptive variable names
  * as described below

* Wrote the new tidy data set to a file called `new_tidy_data.txt`

### Columns in data file `new_tidy_data.txt` 

#### ID Columns
* **activity**
  * types of activities : (*WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*)
* **subject**
  * subject identifier : (1 - 30)

#### Variables
The following variables are encoded as:

**time** : time domain signal captured at a constant rate of 50 Hz

**fft** : fast fourier transform applied to signal

**body** : measurement of body

**gravity** : measurement of gravity

**acc** : measurement from accelerometer (**standard gravity units 'g'**)

**gyro** : measurement from gyroscope (**radians/second**)

**mean** : measurement mean

**std** : measurement standard deviation

**x, y, z** : measurement along x, y, z axis

**jerk** : measurement jerk

**mag** : magnitude of signal calculated using the Euclidean norm across x,y,z axes

* time.body.acc-mean.x
* time.body.acc-mean.y
* time.body.acc-mean.z
* time.body.acc-std.x
* time.body.acc-std.y
* time.body.acc-std.z
* time.gravity.acc-mean.x
* time.gravity.acc-mean.y
* time.gravity.acc-mean.z
* time.gravity.acc-std.x
* time.gravity.acc-std.y
* time.gravity.acc-std.z
* time.body.acc.jerk-mean.x
* time.body.acc.jerk-mean.y
* time.body.acc.jerk-mean.z
* time.body.acc.jerk-std.x
* time.body.acc.jerk-std.y
* time.body.acc.jerk-std.z
* time.body.gyro-mean.x
* time.body.gyro-mean.y
* time.body.gyro-mean.z
* time.body.gyro-std.x
* time.body.gyro-std.y
* time.body.gyro-std.z
* time.body.gyro.jerk-mean.x
* time.body.gyro.jerk-mean.y
* time.body.gyro.jerk-mean.z
* time.body.gyro.jerk-std.x
* time.body.gyro.jerk-std.y
* time.body.gyro.jerk-std.z
* time.body.acc.mag-mean
* time.body.acc.mag-std
* time.gravity.acc.mag-mean
* time.gravity.acc.mag-std
* time.body.acc.jerk.mag-mean
* time.body.acc.jerk.mag-std
* time.body.gyro.mag-mean
* time.body.gyro.mag-std
* time.body.gyro.jerk.mag-mean
* time.body.gyro.jerk.mag-std
* fft.body.acc-mean.x
* fft.body.acc-mean.y
* fft.body.acc-mean.z
* fft.body.acc-std.x
* fft.body.acc-std.y
* fft.body.acc-std.z
* fft.body.acc.jerk-mean.x
* fft.body.acc.jerk-mean.y
* fft.body.acc.jerk-mean.z
* fft.body.acc.jerk-std.x
* fft.body.acc.jerk-std.y 
* fft.body.acc.jerk-std.z 
* fft.body.gyro-mean.x
* fft.body.gyro-mean.y 
* fft.body.gyro-mean.z 
* fft.body.gyro-std.x 
* fft.body.gyro-std.y 
* fft.body.gyro-std.z 
* fft.body.acc.mag-mean 
* fft.body.acc.mag-std 
* fft.body.acc.jerk.mag-mean 
* fft.body.acc.jerk.mag-std 
* fft.body.gyro.mag-mean
* fft.body.gyro.mag-std 
* fft.body.gyro.jerk.mag-mean 
* fft.body.gyro.jerk.mag-std 

### More information
Check http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for more information

