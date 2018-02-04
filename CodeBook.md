### Code Book for Coursera Getting and Cleaning Data Assignment:
### Human Activity Recognition Using Smartphones Data Set 

## This file includes original data description, transformation, list of variables in clean data set and the units

## Original data set description:
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universitŗ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


#### Data transformation, list of variables and units

## Data transformation
 1. Traing and test data set were merged to one data set
The original data sets with test and training data with 561 variables, as well as columns with subject id and activity were merged 
1. Measurements on the mean and standard deviation are extracted.
By extracting variables on mean and standard deviation, number of variables is reduced from 561 to 66.
1. Names of the variables were modified to  be more descriptive and readable.
1. The script changes the numbers in the column “activity” to the actual type of activity based on the data in activity_labels.txt
1. A final independent tidy data set is created with the average of each variable for each activity and each subject.
The measurements are aggregated by subject id and activity, and the mean value for each of the 66 variable is given.

## List of variables:
* subject (numeric)
* activity (factor)
66 numeric variables:
* TimeBodyAcc-mean()-X
* TimeBodyAcc-mean()-Y
* TimeBodyAcc-mean()-Z
* TimeBodyAcc-std()-X
* TimeBodyAcc-std()-Y
* TimeBodyAcc-std()-Z
* TimeGravityAcc-mean()-X
* TimeGravityAcc-mean()-Y
* TimeGravityAcc-mean()-Z
* TimeGravityAcc-std()-X
* TimeGravityAcc-std()-Y
* TimeGravityAcc-std()-Z
* TimeBodyAccJerk-mean()-X
* TimeBodyAccJerk-mean()-Y
* TimeBodyAccJerk-mean()-Z
* TimeBodyAccJerk-std()-X
* TimeBodyAccJerk-std()-Y
* TimeBodyAccJerk-std()-Z
* TimeBodyGyro-mean()-X
* TimeBodyGyro-mean()-Y
* TimeBodyGyro-mean()-Z
* TimeBodyGyro-std()-X
* TimeBodyGyro-std()-Y
* TimeBodyGyro-std()-Z
* TimeBodyGyroJerk-mean()-X
* TimeBodyGyroJerk-mean()-Y
* TimeBodyGyroJerk-mean()-Z
* TimeBodyGyroJerk-std()-X
* TimeBodyGyroJerk-std()-Y
* TimeBodyGyroJerk-std()-Z
* TimeBodyAccMag-mean()
* TimeBodyAccMag-std()
* TimeGravityAccMag-mean()
* TimeGravityAccMag-std()
* TimeBodyAccJerkMag-mean()
* TimeBodyAccJerkMag-std()
* TimeBodyGyroMag-mean()
* TimeBodyGyroMag-std()
* TimeBodyGyroJerkMag-mean()
* TimeBodyGyroJerkMag-std()
* FreqencyBodyAcc-mean()-X
* FreqencyBodyAcc-mean()-Y
* FreqencyBodyAcc-mean()-Z
* FreqencyBodyAcc-std()-X
* FreqencyBodyAcc-std()-Y
* FreqencyBodyAcc-std()-Z
* FreqencyBodyAccJerk-mean()-X
* FreqencyBodyAccJerk-mean()-Y
* FreqencyBodyAccJerk-mean()-Z
* FreqencyBodyAccJerk-std()-X
* FreqencyBodyAccJerk-std()-Y
* FreqencyBodyAccJerk-std()-Z
* FreqencyBodyGyro-mean()-X
* FreqencyBodyGyro-mean()-Y
* FreqencyBodyGyro-mean()-Z
* FreqencyBodyGyro-std()-X
* FreqencyBodyGyro-std()-Y
* FreqencyBodyGyro-std()-Z
* FreqencyBodyAccMag-mean()
* FreqencyBodyAccMag-std()
* FreqencyBodyAccJerkMag-mean()
* FreqencyBodyAccJerkMag-std()
* FreqencyBodyGyroMag-mean()
* FreqencyBodyGyroMag-std()
* FreqencyBodyGyroJerkMag-mean()
* FreqencyBodyGyroJerkMag-std()

## **Units**
* subject: no unit (integer id number)
* activity: no unit (qualitative factor)
* signals from the accelerometer *Acc*: standard gravity units g
* signals from the gyroscope *Gyro*: radians/second
