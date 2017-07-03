#The following files should be in the working directory
#features.txt       activity_labels.txt
#subject_test.txt   X_test.txt   y_test.txt
#subject_train.txt  X_train.txt  y_train.txt

# If "dplyr" package is not installed, install it using this command: install.packages("dplyr")
library(dplyr)

# Reading descriptive activity 
activity_labels<-read.table("activity_labels.txt", stringsAsFactors = FALSE, col.names =c("labels","activities"))

# Reading features
featurenames<-read.table("features.txt", stringsAsFactors = FALSE, col.names = c("id", "features" ))

# Reading subject_test and subject_train and naming the columns
subject_test<-read.table(file="subject_test.txt", stringsAsFactors = FALSE, col.names = "subjects")
subject_train<-read.table(file="subject_train.txt", stringsAsFactors = FALSE, col.names = "subjects")

# Reading y_tes and y_train and naming the columns
y_test<-read.table(file="y_test.txt", stringsAsFactors = FALSE, col.names = "labels")
y_train<-read.table(file="y_train.txt", stringsAsFactors = FALSE, col.names = "labels")

# Reading X_tes and X_train and naming the columns (features)
X_test<-read.table(file="X_test.txt", stringsAsFactors = FALSE, col.names = featurenames$features)
X_train<-read.table(file="X_train.txt", stringsAsFactors = FALSE, col.names = featurenames$features)

# Extracting only the measurements on the mean and standard deviation for each measurement 
s<-grep("mean|std",names(X_test))
X_test2 <- X_test[,s]
X_train2 <- X_train[,s]

# adding the "labels"-column to the X_test and X_train
X_test2$labels <- y_test$labels
X_train2$labels <- y_train$labels

# adding the "subjects"-column to the X_test and X_train
X_test2$subjects <- subject_test$subjects
X_train2$subjects <- subject_train$subjects

# Using descriptive activity names to name the activities in the data set 
X_test2 <- merge(X_test2,activity_labels, by.x = "labels", by.y = "labels")
X_train2 <- merge(X_train2,activity_labels, by.x = "labels", by.y = "labels")

# Merging the training and the test sets to create one data set.
alldata <- rbind(X_train2,X_test2)

# Appropriately labeling the data set with descriptive variable names
colnames(alldata) <- c("labels",featurenames[s,2],"subjects", "activities")

# Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
alldata2 <- tbl_df(alldata) %>%
  group_by(activities,subjects) %>%
  summarise_all(funs(mean(., na.rm=TRUE)))

write.table(alldata2,file="tidydataset.txt", row.name=FALSE)


