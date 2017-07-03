# GettingCleaningData-Project
The project of the "Getting and Cleaning Data"-course at Coursera

This repository includes my files after accomplishing the final project of the "Getting and Cleaning Data"-course at Coursera. 
The "run_analysis.R" is an R-script that generates the tidy data.
The ""tidydataset.txt" is the tidy data. This file can be read in R using the "read.table" command. 
The "CodeBook.md" is a code book that describes the variables, the data, and the transformations that was performed to clean up the data. 

The following explains how the R-script "run_analysis.R" work.
To run this script, the following files should be in the working directory
- features.txt       - activity_labels.txt
- subject_test.txt   - X_test.txt             - y_test.txt
- subject_train.txt  - X_train.txt             - y_train.txt

In addition, to run this script, the library "dplyr" should be installed. 

This script first reads the descriptive activities ("activity_labels.txt"), features ("features.txt"), subjects ("subject_test.txt" and "subject_train.txt"), and labels ("y_test.txt" and "y_train.txt"). Having these information, the training ("X_train.txt") and testing ("X_test.txt") data can be read with the appropriate names for their columns (i.e. features). 
The next step in the script is to extract only the measurements on the mean and standard deviation for each measurement. After that, the "labels" and "subjects" columns are added to X_train and X_test data. To add the descriptive activity names as a new column to X_train and X_test (called "activities"), the "merge" command is used.   
The modified training and testing data (X_train2 and X_test2) are merged together using "rbind" command. During the previous procedures, the descriptive variable names (column names) were shortened. To appropriately label X_train2 and X_test, their column-names were modified accordingly. Finally, the last part of the script creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
