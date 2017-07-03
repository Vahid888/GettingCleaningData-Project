The data of this project is provided by a project called "Human Activity Recognition Using Smartphones Dataset" that was conducted in the Università degli Studi di Genova, Italy. More information can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In my project, I provided a modified version of the original dataset (accessible by the variable "alldata" after running the "run_analysis.R" script in R), in which the training and testing data are merged. Also, only the measurements on the mean and standard deviation for each measurement are presented. Moreover, I have added three columns to the modified data that represent "labels", "activities", and "subjects" as follows,

- "labels": An integer from 1 to 6 indicating the type of activities. 

- "activities": 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

- "subjects": An integer from 1 to 30 indicating the ID of the subject who attended the experiment. 

I also have provided a tidy dataset ("tidydataset.txt"). This tidy data is grouped, and indicate the average of each variable for each activity and each subject.




