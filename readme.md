
# Coursera Project for Getting and Cleaning Data Course Project

This repository contains three files:

1. README.md

2. Codebook.md

3. run_analysis.R

## Overview

This README file describes the usage and operation of the R script `run_analysis.R` required for the Coursera class 
"Getting and Cleaning Data".

The project performs a cleaning and tidying up row data set available from the University of California Irvine Machine Learning repository.  

# Using the Script

The script, `run_analysis.R`, requires the original data set available from UC Irvine. It is assumed that data is downloaded and unzipped in the working directory.

## Running the script

1. Change to the directory containing the data set or make it as working directory.
   
2. From R-Studio, source and run the file.

    > source("run_analysis.R")

# Script Operation

Following goals were set for cleaning the raw data:

1. Merge the trainign and test data sets to create one data set

2. Extract only the measurements the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


The basic script operation combines the data from the training and test data
sets by:

1. Reading the data labels from `features.txt`.  The labels are processed so that they are more meaningful. For example,
	* '()' are removed
	* '-' (dash) is replaced by '_' (underscore)
	* prefix 't' and 'f' are replaced by 'time' and 'frequencey respectively
	* Word 'Acc' is replaced by 'Accelerometer'
	* Word 'Gyro' is replced by 'Gyroscope'
	* Word 'Mag' is repalced by 'Magnitude'
	* Word 'BodyBody' is replaced by 'Body'

2. Reading the train data in to x_train, y_train and subject_traint variables

3. Reading the test data in to x_test, y_test and subject_test variables

4. Reading activity data from activity_labels.txt

5. Merge activity data with y_test and y_train to replace activity id to activity name

6. Combining the x_, y_ and subject data for train and test data sets

7. Combining traing and test data sets in to one

8. Finding mean and sd for combined records

9. Creating a tide data set with mean and std features for each activity and subject

    
