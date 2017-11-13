# Getting and Cleaning Data Course Project Codebook
The updates to the available codebooks is available below, with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
## Wearable Computing
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Summary:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Description of Data
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

>**Notes:** 
>- Features are normalized and bounded within [-1,1].
>- Each feature vector is a row on the text file.

### Description of Transformations
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Description of Tidy.Data produced
 [1] "Subject": int **;** "Activity_Name": Factor with 6 levels **;** "tBodyAcc-mean()-X": num              
 [4] "tBodyAcc-mean()-Y": num **;** "tBodyAcc-mean()-Z": num **;** "tBodyAcc-std()-X": num               
 [7] "tBodyAcc-std()-Y": num **;** "tBodyAcc-std()-Z": num **;** "tGravityAcc-mean()-X": num           
[10] "tGravityAcc-mean()-Y": num **;** "tGravityAcc-mean()-Z": num **;** "tGravityAcc-std()-X": num            
[13] "tGravityAcc-std()-Y": num **;** "tGravityAcc-std()-Z": num **;** "tBodyAccJerk-mean()-X": num          
[16] "tBodyAccJerk-mean()-Y": num **;** "tBodyAccJerk-mean()-Z": num **;** "tBodyAccJerk-std()-X": num           
[19] "tBodyAccJerk-std()-Y": num **;** "tBodyAccJerk-std()-Z": num **;** "tBodyGyro-mean()-X": num             
[22] "tBodyGyro-mean()-Y": num **;** "tBodyGyro-mean()-Z": num **;** "tBodyGyro-std()-X": num              
[25] "tBodyGyro-std()-Y": num **;** "tBodyGyro-std()-Z": num **;** "tBodyGyroJerk-mean()-X": num         
[28] "tBodyGyroJerk-mean()-Y": num **;** "tBodyGyroJerk-mean()-Z": num **;** "tBodyGyroJerk-std()-X": num          
[31] "tBodyGyroJerk-std()-Y": num **;** "tBodyGyroJerk-std()-Z": num **;** "tBodyAccMag-mean()": num             
[34] "tBodyAccMag-std()": num **;** "tGravityAccMag-mean()": num **;** "tGravityAccMag-std()": num           
[37] "tBodyAccJerkMag-mean()": num **;** "tBodyAccJerkMag-std()": num **;** "tBodyGyroMag-mean()": num            
[40] "tBodyGyroMag-std()": num **;** "tBodyGyroJerkMag-mean()": num **;** "tBodyGyroJerkMag-std()": num         
[43] "fBodyAcc-mean()-X": num **;** "fBodyAcc-mean()-Y": num **;** "fBodyAcc-mean()-Z": num              
[46] "fBodyAcc-std()-X": num **;** "fBodyAcc-std()-Y": num **;** "fBodyAcc-std()-Z": num               
[49] "fBodyAcc-meanFreq()-X": num **;** "fBodyAcc-meanFreq()-Y": num  **;** "fBodyAcc-meanFreq()-Z": num          
[52] "fBodyAccJerk-mean()-X": num **;** "fBodyAccJerk-mean()-Y": num **;** "fBodyAccJerk-mean()-Z": num          
[55] "fBodyAccJerk-std()-X": num **;** "fBodyAccJerk-std()-Y": num **;** "fBodyAccJerk-std()-Z": num           
[58] "fBodyAccJerk-meanFreq()-X": num **;** "fBodyAccJerk-meanFreq()-Y": num **;** "fBodyAccJerk-meanFreq()-Z": num      
[61] "fBodyGyro-mean()-X": num **;** "fBodyGyro-mean()-Y": num **;** "fBodyGyro-mean()-Z": num             
[64] "fBodyGyro-std()-X": num **;** "fBodyGyro-std()-Y": num **;** "fBodyGyro-std()-Z": num              
[67] "fBodyGyro-meanFreq()-X": num **;** "fBodyGyro-meanFreq()-Y": num **;** "fBodyGyro-meanFreq()-Z": num         
[70] "fBodyAccMag-mean()": num **;** "fBodyAccMag-std()": num **;** "fBodyAccMag-meanFreq()": num         
[73] "fBodyBodyAccJerkMag-mean()": num **;** "fBodyBodyAccJerkMag-std()": num **;** "fBodyBodyAccJerkMag-meanFreq()": num 
[76] "fBodyBodyGyroMag-mean()": num **;** "fBodyBodyGyroMag-std()": num **;** "fBodyBodyGyroMag-meanFreq()": num    
[79] "fBodyBodyGyroJerkMag-mean()": num **;** "fBodyBodyGyroJerkMag-std()": num **;** "fBodyBodyGyroJerkMag-meanFreq()": num

###Data Set Characteristics
**Mean and Standard Deviation of Wearable Computing Data**
- Number of Observations:  180
- Number of Attributes: 81	
