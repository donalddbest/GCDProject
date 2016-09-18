## Getting and Cleaning Data Peer Review Project
## by Donald DiJacklin

# Clear workspace
rm(list = ls())

# Important Libraries...
library(dplyr)

# Getting the relevant files...
subject_test<-read.csv(file ="~/UCI HAR Dataset/test/subject_test.txt",sep = "",header = FALSE)
x_test<-read.csv(file = "~/UCI HAR Dataset/test/x_test.txt", sep = "",header = FALSE)
y_test<-read.csv(file = "~/UCI HAR Dataset/test/y_test.txt", sep = "",header = FALSE)
subject_train<-read.csv(file = "~/UCI HAR Dataset/train/subject_train.txt",sep = "",header = FALSE)
x_train<-read.csv("~/UCI HAR Dataset/train/x_train.txt",sep = "",header = FALSE)
y_train<-read.csv("~/UCI HAR Dataset/train/y_train.txt",sep = "",header = FALSE)
features<-read.csv("~/UCI HAR Dataset/features.txt",sep = "", header = FALSE)
activity_labels<-read.csv("~/UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)

# Using the features to name the testing and training dataset...
colnames(x_test)<-features$V2
colnames(x_train)<-features$V2

# I know this looks weird, but it's creating a vector of the features containing "mean" or "std"
mean<-grep("mean",features$V2)
std<-grep("std",features$V2)
v<-sort(c(mean,std))
# Knowing how I want the end result, I adjust the vector accordingly
v<-v+2
v<-c(1,2,v)

# Changes the y values to the activity, probably inefficiently...
y_test$V1<-as.factor(y_test$V1)
y_train$V1<-as.factor(y_train$V1)
activity_labels<-as.character(activity_labels$V2)
levels(y_test$V1)<-activity_labels
levels(y_train$V1)<-activity_labels
# Renames y vector
names(y_train)<-"Activity"
names(y_test)<-"Activity"

# Renames subject vector
names(subject_test)<-"Subject"
names(subject_train)<-"Subject"

# Combining the activities, subjects, and the test/train data respectively.
test_set<-cbind(subject_test,y_test,x_test)
train_set<-cbind(subject_train,y_train,x_train)

# Filters out the columns that are wanted using the vector I constructed earlier.
test_set<-test_set[,v]
train_set<-train_set[,v]

# Finally combines the testing and training datasets
data_set<-rbind(test_set,train_set)

# Saves the file in a csv file and as an R file that can be "load"ed
write.csv(data_set,"data_set.csv",row.names = FALSE)
save("data_set", file = "data_set.R")

# Turns the data into the requested tidy data set of the means of each variable.
data_set<-group_by(data_set, Subject, Activity)
tidy_data<-summarise_each(data_set,funs(mean(.,na.rm=TRUE)))

# Saves the tidy data as a csv and as an R File that can be "load"ed.

write.csv(tidy_data, file = "tidy_data.csv", row.names = FALSE)
save("tidy_data",file =  "tidy_data.R")
write.table(tidy_data, file =  "tidy_data.txt", row.names = FALSE)
