# Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Script Processing

The script run_analysis.R reads in each of the sets of data downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Each of the file is read in and named with a internal variable equivalent to the file name: features, activity_labels, y_train, x_train, subject_train, y_test, y_train, subject_test.  The 2 X files are combined together and the column names are correctly renamed using the titles from the features table.  The 2 Y files are then combined together and the column renamed to activities.  The single ID of the activity is replaced with the names of the activities in the activity_labels file.  The 2 subject files are combined and the column renamed to Subject.  Then all 3 files are combined in the order of subject, activity, features this final data set is call all_in_one.

Another data set is created with just the features (measures) that represent a mean or a standard deviation this data set is called mean_std_all

The final third data set is created off the mean_std set.  This set aggregates the data so there is only 1 row for each subject and activity and named summary_data.   Reducing the rows from over 10,000 to just 180.  Each of the measures now become an average (reminding myself that this isn’t data I’m using and it is okay to average an average and unsure what a averages of a standard deviation would really be).  This data set is saved to a text file under the name of summary.txt.

