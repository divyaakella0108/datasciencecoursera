run_analysis <- function()
  
{
setwd("C:/Users/212470996/Desktop/dataset/getdataDataset/UCI HAR Dataset")  
  
##read the given files data

features <- read.table("./features.txt") #List of all features.
activity_labels <- read.table("./activity_labels.txt", header = FALSE) #Activity name.

#Read test dataset
X_test  <-   read.table("./test/X_test.txt", header = FALSE) 
Y_test  <-   read.table("./test/y_test.txt", header = FALSE) 
subject_test <- read.table("./test/subject_test.txt", header = FALSE) 

#Read train dataset
X_train <-   read.table("./train/X_train.txt", header = FALSE)
Y_train <-   read.table("./train/y_train.txt", header = FALSE) 
subject_train<- read.table("./train/subject_train.txt", header = FALSE)

##Assign Column Names to test datasets
colnames(X_test)<- features[,2]
colnames(Y_test)<-  "activityId"
colnames(subject_test) = "subjectId"

##Assign Column Names to train datasets
colnames(X_train)<- features[,2]
colnames(Y_train)<-  "activityId"
colnames(subject_train) = "subjectId"


colnames(activity_labels) <- c('activityId','activityType')

#Merge train data using column bind
train_Merge = cbind(Y_train, subject_train, X_train)
#Merge test data using column bind
test_Merge = cbind(Y_test, subject_test, X_test)

#Merge train & test data using row bind
AllData = rbind(train_Merge, test_Merge)

#Extract only the measurements on the mean and standard deviation for each measurement.

#Using grepl to find the column names having mean, std and other columns are selected for display purpose
 colNames = colnames(AllData)
 mean_std = (grepl("activityId", colNames) | grepl("subjectId", colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
 
# MeanAndStdColData has required data
 MeanAndStdColData <- AllData[ , mean_std == TRUE]
# Add ActivityType column
 MeanAndStdColData_AT = merge(MeanAndStdColData, activity_labels, by='activityId', all.x=TRUE)
#get the tidydata 
 TidyData <- aggregate(. ~subjectId + activityId, MeanAndStdColData_AT, mean)
 TidyData <- TidyData[order(TidyData$subjectId, TidyData$activityId),]
# write the tidy data to a file
 write.table(TidyData, "TidyData.txt", row.name=FALSE)
}