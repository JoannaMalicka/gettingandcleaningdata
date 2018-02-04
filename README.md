## Here you can find the description of **Study Design** and **analysis performed by the script**

# Introduction
*run_analysis* is an R script that performs ordering and cleaning procedure of data collected during the experiment in which activity of human volunteers was tracked by accelerometers in Samsung smart phone. A full description is available at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original data are available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original data set includes the folder “UCI HAR dataset” where are 4 files:  
* README.txt
* features.txt
* activity_labels.txt
* features_info.txt
and two folders: train and test. In test folder are:
* Inertial Signals folder
* X_test.txt
* subject_test.txt
* y_test.txt
 train folder has analogous content but for the train part of the data set.

*run_analysis* uses the following folders:
* X_test.txt
* subject_test.txt
* y_test.txt
* X_train.txt
* subject_train.txt
* y_train.txt
* activity_labels.txt
* features.txt

All these necessary files were placed into a new folder FilesForAnalysis. 
**R working directory should be set to FilesForAnalysis folder**

# Trasformation done by run_analysis
1. **Setting up**
The working directory has to be set manually by user to FilesForAnalysis.
run_analysis loads all the necessary files to the environment. 
1. **Merging of training and test data sets** 
Merges training and test data into one complete data frame called merged_set
1. **Extracts only the measurements on the mean and standard deviation for each measurement**
Names of the variables are known thanks to features.txt loaded into environment. Applying regular expressions, the script locates the variables that are means or standard deviations of the measurement. The script subsets these located columns together with 2 columns: subject id and activity and creates a new data set called df_extracted.
**Nota bene:** The subset data contain only the data with the mean  or std. dev. of the measurement “as such”. Variables, which include “mean” in the name, for example regarding the mean frequency and corresponding to the angle are not subsetted. 
1. **Labels the data set with descriptive variable names.**
The script labels the variables corresponding to subject and type of activity.  Using regular expression, the script slightly changes original names of the remaining variables (extracted from features.txt) in order to make them more understandable. For example,  “f” changes to “Frequency”, “t” to “Time”. 
1. **Uses descriptive activity names to name the activities in the data set.**
The script changes the numbers in the column “activity” to the actual type of activity based on the data in activity_labels.txt
1. From the data set in step 4, creates a second, **independent tidy data set with the average of each variable for each activity and each subject.**
The variables are grouped by subject id and 6 types of activity into 180 groups (30 subjects x 6 activities). The script finds the mean value of the variables for each group and saves the data in a new data frame tidy_data. Exports tidy_data to a *tidy_data.txt* file
