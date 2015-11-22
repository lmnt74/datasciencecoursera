This was mostly an exercise in cleaning up data. 

Took the dataset that was provided by UCI and cleaned it up. The data set they provided was scattered through various folders.

Raw Data:
Volunteer and volunteer activity
Various measurements are included in different files broken up into training sets and test sets. (more details in features.txt)

A little bit about the data that was provided (straight from the file features_info.txt):
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

What we did:
We took the volunteers and linked them to the activities they performed, along with some statistics that were provided on their
activities. We merged both the training and test data sets. Then pulled all the mean and standard deviations of their activiites.
There were a total of 30 volunteers and the activities they performed were broken into six categories:
Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying

The standard deviation and means were then averaged by activity and volunteer to give the final output which, if you would
like you can write to a file by uncommentig the last piece of code.
