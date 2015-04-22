
#setwd("C:/Data/BigData_UTD/R-Prog/WorkingDir/UCI HAR Dataset/")

library(data.table)
# Load Features list
features <- read.table("features.txt")
features <- features[,2]

# Goal #4 
# clean up labels and make more descriptive
features <- gsub("\\(\\)","",features) # remove () from labels
features <- gsub("-","_",features) # replace - (dash) with _ (underscore)
features <- gsub("^t", "time", features)
features <- gsub("^f", "frequency", features)
features <- gsub("Acc", "Accelerometer", features)
features <- gsub("Gyro", "Gyroscope", features)
features <- gsub("Mag", "Magnitude", features)
features <- gsub("BodyBody", "Body", features)

# load training data
x_train <- read.table("train/x_train.txt",col.names=features)
y_train <- read.table("train/y_train.txt",col.names=c("activity_id"))
subject_train <- read.table("train/subject_train.txt",col.names = c("subject_id"))

# load test data
x_test <- read.table("test/x_test.txt",col.names=features)
y_test <- read.table("test/y_test.txt", col.names=c("activity_id"))
subject_test <- read.table("test/subject_test.txt",col.names = c("subject_id"))

# load activity labels, add column name
activity_lable <- read.table("activity_labels.txt",col.names=c("activity_id","activity"))

# Goal #3
# merge by activity_id
y_train <- merge(activity_lable,y_train,by="activity_id",all=T)
y_test <- merge(activity_lable,y_test,by="activity_id",all=T)

# column bind subject and activity data with observatons (x_data)
testData <- cbind(y_test[,2],x_test)
testData <- cbind(subject_test,testData)
colnames(testData)[2] <- "activity"

# column bind subject and activity data with observatons (x_data)
trainData <- cbind(y_train[,2],x_train)
trainData <- cbind(subject_train,trainData)
colnames(trainData)[2] <- "activity"

# Goal #1
# combine training and testing data in one dataset
combined_data <- rbind(trainData, testData)

# Goal #2
# mean & SD of combined data
mean_data <- suppressWarnings(sapply(combined_data,mean,na.rm=TRUE))
# Activity columns is not numeric and returns NA.
mean_data <- mean_data[!is.na(mean_data)]

sd_data <- sapply(combined_data,sd,na.rm=TRUE)
DT <- data.table(combined_data)

# Goal #5
tidyData <- DT[,lapply(.SD,mean),by="activity,subject_id"]
write.table(tidyData,file="tidyData.txt",sep=" ",row.name=FALSE)


