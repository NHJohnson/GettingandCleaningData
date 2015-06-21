## Variable and Formatting Information for tidymeans.txt
# Study Design and Data Structure
The original data from which this data set was constructed consisted of a large number of measurements of the observables of the accelerometer and gyroscope of a Samsung Galaxy S smartphone taken as each of 30 subject performed each of six activities: walking, walking up stairs, walking down stairs, sitting, standing, and lying down. Examples of the observables include 
 acceleration due to gravity and acceleration by the subject in each spatial dimension (full list below). For each observable in each trial, the mean and standard deviation of the observable were among the quantities provided. For those two types of measurements, this dataset (tidymeans.txt) reports the mean value observed when each subject was performing each activity: for example when subject 2 was lying down, when subject 27 was going up stairs, etc. Hence there are 180 rows in the dataset, and 66 data-containing columns, corresponding to the 66 types of means and standard deviations present in the original data. The first two columns report the subject number and activity type, for 68 total.

# Code Book
From the original researchers, upon whose statements of the meanings of their observables we cannot improve:
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

The researchers also note that the observables "are normalized and bounded within [-1,1]", so the actual stated values may be considered unitless.

The original data set contained 17 types of observables derived from the above quantities, but as described only their means and standard deviations have been used in the preparation of 'tidydata.txt'. Hence columns whose label indicates a mean are in fact the means of the means of the observable for each subject-activity pair, and those with labels indicating a standard deviation (std) are the means of the observed standard deviations for the pair. 

The observables in tidydata are then:
"Subject": Factor denoting to which of the 30 subjects the data in the row pertains, number from 1-30. 
"Activity": Factor denoting which of the six activities was being performed when the data in the row was collected. Character description.
All other columns contain measurements by the gyroscope or the accelerometer, generally either associated with one of the spatial dimensions (X,Y,Z) or an absolute magnitude. Please note once more that all data in tidydata is a mean of the quantity described for a particular subject-activity pair. The 66 observables are:

"tBodyAcc-mean()-X" 
"tBodyAcc-mean()-Y" 
"tBodyAcc-mean()-Z" 
"tGravityAcc-mean()-X" 
"tGravityAcc-mean()-Y" 
"tGravityAcc-mean()-Z" 
"tBodyAccJerk-mean()-X" 
"tBodyAccJerk-mean()-Y" 
"tBodyAccJerk-mean()-Z" 
"tBodyGyro-mean()-X" 
"tBodyGyro-mean()-Y" 
"tBodyGyro-mean()-Z" 
"tBodyGyroJerk-mean()-X" 
"tBodyGyroJerk-mean()-Y" 
"tBodyGyroJerk-mean()-Z" 
"tBodyAccMag-mean()" 
"tGravityAccMag-mean()" 
"tBodyAccJerkMag-mean()" 
"tBodyGyroMag-mean()" 
"tBodyGyroJerkMag-mean()" 
"fBodyAcc-mean()-X" 
"fBodyAcc-mean()-Y" 
"fBodyAcc-mean()-Z" 
"fBodyAccJerk-mean()-X" 
"fBodyAccJerk-mean()-Y" 
"fBodyAccJerk-mean()-Z" 
"fBodyGyro-mean()-X" 
"fBodyGyro-mean()-Y" 
"fBodyGyro-mean()-Z" 
"fBodyAccMag-mean()" 
"fBodyBodyAccJerkMag-mean()" 
"fBodyBodyGyroMag-mean()" 
"fBodyBodyGyroJerkMag-mean()" 
"tBodyAcc-std()-X" 
"tBodyAcc-std()-Y" 
"tBodyAcc-std()-Z" 
"tGravityAcc-std()-X" 
"tGravityAcc-std()-Y" 
"tGravityAcc-std()-Z" 
"tBodyAccJerk-std()-X" 
"tBodyAccJerk-std()-Y" 
"tBodyAccJerk-std()-Z" 
"tBodyGyro-std()-X" 
"tBodyGyro-std()-Y" 
"tBodyGyro-std()-Z" 
"tBodyGyroJerk-std()-X" 
"tBodyGyroJerk-std()-Y" 
"tBodyGyroJerk-std()-Z" 
"tBodyAccMag-std()" 
"tGravityAccMag-std()" 
"tBodyAccJerkMag-std()" 
"tBodyGyroMag-std()" 
"tBodyGyroJerkMag-std()" 
"fBodyAcc-std()-X" 
"fBodyAcc-std()-Y" 
"fBodyAcc-std()-Z" 
"fBodyAccJerk-std()-X" 
"fBodyAccJerk-std()-Y" 
"fBodyAccJerk-std()-Z" 
"fBodyGyro-std()-X" 
"fBodyGyro-std()-Y" 
"fBodyGyro-std()-Z" 
"fBodyAccMag-std()" 
"fBodyBodyAccJerkMag-std()" 
"fBodyBodyGyroMag-std()" 
"fBodyBodyGyroJerkMag-std()"

All columns except for the initial two factors are of numeric type.
