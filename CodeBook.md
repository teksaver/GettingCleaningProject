CodeBook for Coursera's "Getting and Cleaning data" Course

#What is this file?
This code book describes the variables, the data, and transformations that were performed to clean up the provided data

#What does the data come from?
The data set represent the results of experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

8 text files are used as input
- *activity_labels.txt* contian the 6 activities that were performed by the subjects
- *features.txt* contain labels for 561 performed measurements for each observation
- *subject_train.txt* and *subject_test.txt* identify the subject of each observation
- *y_train.txt* and *y_test.txt* identify the activity performed for each observation
- *X_train.txt* and *X_test.txt* provide the value for each measurement for each observation

#Output variables

The final file contains 180 observations and 68 variables :

The initial 10299 observations are grouped by subject and activity and the mean of each group is calculated. The first 2 variables define each group:

- *subject_id*: the id of the subject of the observation
- *act_name*: the name of the performed activity for the observation

The remaining variables are composed as follows : mogo_xxx_yyy_zzz or mogo_xxx_yyy where
- mogo stands for "mean of grouped observations", since we calculated the mean for each group
- xxx is the measured element
- yyy define whether we look at the Mean value (yyy==mean) or the standard deviation (yyy==std)
- zzz represent the axis : X, Y or Z

mogo_tBodyAcc_mean_X
mogo_tBodyAcc_mean_Y
mogo_tBodyAcc_mean_Z
mogo_tBodyAcc_std_X
mogo_tBodyAcc_std_Y
mogo_tBodyAcc_std_Z
mogo_tGravityAcc_mean_X
mogo_tGravityAcc_mean_Y
mogo_tGravityAcc_mean_Z
mogo_tGravityAcc_std_X
mogo_tGravityAcc_std_Y
mogo_tGravityAcc_std_Z
mogo_tBodyAccJerk_mean_X
mogo_tBodyAccJerk_mean_Y
mogo_tBodyAccJerk_mean_Z
mogo_tBodyAccJerk_std_X
mogo_tBodyAccJerk_std_Y
mogo_tBodyAccJerk_std_Z
mogo_tBodyGyro_mean_X
mogo_tBodyGyro_mean_Y
mogo_tBodyGyro_mean_Z
mogo_tBodyGyro_std_X
mogo_tBodyGyro_std_Y
mogo_tBodyGyro_std_Z
mogo_tBodyGyroJerk_mean_X
mogo_tBodyGyroJerk_mean_Y
mogo_tBodyGyroJerk_mean_Z
mogo_tBodyGyroJerk_std_X
mogo_tBodyGyroJerk_std_Y
mogo_tBodyGyroJerk_std_Z
mogo_tBodyAccMag_mean
mogo_tBodyAccMag_std
mogo_tGravityAccMag_mean
mogo_tGravityAccMag_std
mogo_tBodyAccJerkMag_mean
mogo_tBodyAccJerkMag_std
mogo_tBodyGyroMag_mean
mogo_tBodyGyroMag_std
mogo_tBodyGyroJerkMag_mean
mogo_tBodyGyroJerkMag_std
mogo_fBodyAcc_mean_X
mogo_fBodyAcc_mean_Y
mogo_fBodyAcc_mean_Z
mogo_fBodyAcc_std_X
mogo_fBodyAcc_std_Y
mogo_fBodyAcc_std_Z
mogo_fBodyAccJerk_mean_X
mogo_fBodyAccJerk_mean_Y
mogo_fBodyAccJerk_mean_Z
mogo_fBodyAccJerk_std_X
mogo_fBodyAccJerk_std_Y
mogo_fBodyAccJerk_std_Z
mogo_fBodyGyro_mean_X
mogo_fBodyGyro_mean_Y
mogo_fBodyGyro_mean_Z
mogo_fBodyGyro_std_X
mogo_fBodyGyro_std_Y
mogo_fBodyGyro_std_Z
mogo_fBodyAccMag_mean
mogo_fBodyAccMag_std
mogo_fBodyBodyAccJerkMag_mean
mogo_fBodyBodyAccJerkMag_std
mogo_fBodyBodyGyroMag_mean
mogo_fBodyBodyGyroMag_std
mogo_fBodyBodyGyroJerkMag_mean
mogo_fBodyBodyGyroJerkMag_std

#How were the measurements made?

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

Multiple calculations were performed from the original set of variables, from which we only kept the mean and standard deviation. The orginial values that were estimated from the measured signals and contained in the original files are: 

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


