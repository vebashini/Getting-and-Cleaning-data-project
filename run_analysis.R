# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a 
# series of yes/no questions related to the project. You will be required to submit: 
# 1) a tidy data set as described below, 
# 2) a link to a Github repository with your script for performing the analysis, and 
# 3) a code book that describes the variables, the data, and any transformations or work that you performed 
#    to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
#    This repo explains how all of the scripts work and how they are connected.
# 
# One of the most exciting areas in all of data science right now is wearable computing - 
# see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most 
# advanced algorithms to attract new users. The data linked to from the course website represent data collected 
# from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where 
# the data was obtained:
#   
#   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# 
# Here are the data for the project:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# You should create one R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Good luck!

if (!require("data.table")) {
  install.packages("data.table")
}
if (!require("reshape2")) {
  install.packages("reshape2")
}
library("data.table")
library("reshape2")

# Read the headers and names of data
# Read the feature names: 'features.txt': List of all features.
features <- read.table("./data/UCI HAR Dataset/features.txt")
features <- features[,2] #Keep only the names, discard the numbers

# Read the activity labels: 'activity_labels.txt': Links the class labels with their activity name
activity.labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activity.labels <- activity.labels[,2] #Keep only the names, discard the numbers

# Read the Test Datasets
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt") #'test/X_test.txt': Test set.
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt") #'test/y_test.txt': Test labels.
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt") #Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
names(X_test) = features # label each column

# Read the Train Datasets
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt") #'train/X_train.txt': Training set.
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt") #'train/y_train.txt': Training labels.
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt") #Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
names(X_train) = features # label each column

# Extract only the measurements on the mean and standard deviation for each measurement.
measurements <- grepl("mean()|std()", features)

# Subset the data by only the features we want to see - mean and std
X_test = X_test[,measurements]
X_train = X_train[,measurements]

# Add a column onto the labels with the activity done - Link the class labels with their activity name.
y_test[,2] = activity.labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Name")
names(subject_test) = "Subject"

y_train[,2] = activity.labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Name")
names(subject_train) = "Subject"

# Create a set of data for test and one for train
test_data <- cbind(as.data.table(subject_test), y_test, X_test)
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge the training and the test sets to create one data set
combined = rbind(test_data, train_data)

#http://exposurescience.org/heR.doc/library/reshape/html/melt-data-frame-da.html for info on melt
# Melt a data frame into form suitable for easy casting
melted = melt(combined, id = c("Subject", "Activity_ID", "Activity_Name"))

# Create an independent tidy data set with the average of each variable for each activity and each subject
tidy.data   = dcast(melted, Subject + Activity_Name ~ variable, mean)

# Save data set
write.table(tidy.data, file = "./data/tidy_data.txt")