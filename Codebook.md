CodeBook for Tidy UCI HAR Dataset
What is it?

This CodeBook describes the data contained in the output of the run_analysis.R script contained in this repository. The tidy flat text file can be read using data.table to create a data table for further analysis.

tidy_data <- data.table("tidy_data.txt")
The script creates a tidy, condensed version of the University of California Irvine's (UCI's) dataset for Human Activity Recognition (HAR) using smartphones that can be used for further research and analysis. The original UCI HAR Dataset is a public domain dataset built from the recordings of subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensor (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Where to get original datasets?
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Data Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws


Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link]


Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Data cleaning & manipulation done for tidy dataset
filtered_feature_names <- gsub("\\(\\)", "", filtered_feature_names)
filtered_feature_names <- gsub("Acc", "-acceleration", filtered_feature_names)
filtered_feature_names <- gsub("Mag", "-Magnitude", filtered_feature_names)
filtered_feature_names <- gsub("^t(.*)$", "\\1-time", filtered_feature_names)
filtered_feature_names <- gsub("^f(.*)$", "\\1-frequency", filtered_feature_names)
filtered_feature_names <- gsub("(Jerk|Gyro)", "-\\1", filtered_feature_names)
filtered_feature_names <- gsub("BodyBody", "Body", filtered_feature_names)
And finally all variable names are converted into lowercase.

Description of the UCI HAR variables

The Tidy dataset consists of 180 observations summarized by activity (6 categories) and subject (30 volunteers) pairs. 
For each row in the tidy dataset, the following 4 columns are provided:

subject
activity
measurement
mean

#subject

A numeric identifier (1-30) of the subject who carried out the experiment.

#activity

The activity name with the following possible values.

'laying',
'sitting',
'standing',
'walking',
'walking_downstairs'
'walking_upstairs'

#measurement

The name of the measurement for which the mean is calculated. 
This variable can contain one of the following 66 variables. 
Please refer the codebook with the original dataset for the explanation of these different variables.

body-acceleration-jerk-magnitude-mean-frequency
body-acceleration-jerk-magnitude-mean-time
body-acceleration-jerk-magnitude-std-frequency
body-acceleration-jerk-magnitude-std-time
body-acceleration-jerk-mean-x-frequency
body-acceleration-jerk-mean-x-time
body-acceleration-jerk-mean-y-frequency
body-acceleration-jerk-mean-y-time
body-acceleration-jerk-mean-z-frequency
body-acceleration-jerk-mean-z-time
body-acceleration-jerk-std-x-frequency
body-acceleration-jerk-std-x-time
body-acceleration-jerk-std-y-frequency
body-acceleration-jerk-std-y-time
body-acceleration-jerk-std-z-frequency
body-acceleration-jerk-std-z-time
body-acceleration-magnitude-mean-frequency
body-acceleration-magnitude-mean-time
body-acceleration-magnitude-std-frequency
body-acceleration-magnitude-std-time
body-acceleration-mean-x-frequency
body-acceleration-mean-x-time
body-acceleration-mean-y-frequency
body-acceleration-mean-y-time
body-acceleration-mean-z-frequency
body-acceleration-mean-z-time
body-acceleration-std-x-frequency
body-acceleration-std-x-time
body-acceleration-std-y-frequency
body-acceleration-std-y-time
body-acceleration-std-z-frequency
body-acceleration-std-z-time
body-gyro-jerk-magnitude-mean-frequency
body-gyro-jerk-magnitude-mean-time
body-gyro-jerk-magnitude-std-frequency
body-gyro-jerk-magnitude-std-time
body-gyro-jerk-mean-x-time
body-gyro-jerk-mean-y-time
body-gyro-jerk-mean-z-time
body-gyro-jerk-std-x-time
body-gyro-jerk-std-y-time
body-gyro-jerk-std-z-time
body-gyro-magnitude-mean-frequency
body-gyro-magnitude-mean-time
body-gyro-magnitude-std-frequency
body-gyro-magnitude-std-time
body-gyro-mean-x-frequency
body-gyro-mean-x-time
body-gyro-mean-y-frequency
body-gyro-mean-y-time
body-gyro-mean-z-frequency
body-gyro-mean-z-time
body-gyro-std-x-frequency
body-gyro-std-x-time
body-gyro-std-y-frequency
body-gyro-std-y-time
body-gyro-std-z-frequency
body-gyro-std-z-time
gravity-acceleration-magnitude-mean-time
gravity-acceleration-magnitude-std-time
gravity-acceleration-mean-x-time
gravity-acceleration-mean-y-time
gravity-acceleration-mean-z-time
gravity-acceleration-std-x-time
gravity-acceleration-std-y-time
gravity-acceleration-std-z-time

#mean
mean of the measurement for each variable and subject
