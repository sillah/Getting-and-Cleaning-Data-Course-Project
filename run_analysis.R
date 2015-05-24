# set the working directory
setwd("C:/Users/Mary/Documents/DSS/Obtaining Data/Course Project/UCI HAR Dataset")


# load the necessary libraries
library(dplyr)


# load the datasets
trainData <- read.table("./train/X_train.txt", sep = "", header = FALSE)
trainLabel <- read.table("./train/Y_train.txt", sep = ",", header = FALSE)
subjectTrain <- read.table("./train/subject_train.txt", sep = "", header = FALSE)
testData <- read.table("./test/X_test.txt", sep = "", header = FALSE)
testLabel <- read.table("./test/Y_test.txt", sep = ",", header = FALSE)
subjectTest <- read.table("./test/subject_test.txt", sep = "", header = FALSE)
feature <- read.table("features.txt", sep = "", header = FALSE)
activity <- read.table("activity_labels.txt", sep = "", header = FALSE)

# Get rows with only mean and std features
avgstd <- feature[grepl("mean()", feature$V2, fixed = TRUE)|grepl("std()", feature$V2, fixed = TRUE) ,]

# Step 2. 
# Extract only the measurements on the mean and standard deviation for each training measurement
trainData <- trainData[, avgstd[,1]]
# Extract only the measurements on the mean and standard deviation for each test measurement
testData <- testData[, avgstd[,1]]

# Step 4.
# Appropriately label the data set with descriptive variable names. 
names(trainData) <- avgstd[,2]
names(testData) <- avgstd[,2]
names(trainLabel) <- "activity"
names(subjectTrain) <- "subject"
names(testLabel) <- "activity"
names(subjectTest) <- "subject"

# Step 1. Merge the training and the test sets to create one data set
# Add labels and subjects to the training dataset 
trainData <- cbind(cbind(trainLabel,subjectTrain),trainData)
# Add labels and subjects to the test dataset
testData <- cbind(cbind(testLabel,subjectTest),testData)
# Merge the training and the test sets. 
mergeData <- rbind(trainData, testData)

# Step 3.  Use descriptive activity names to name the activities in the data set
# Merge the activity data to the merged dataset 
mergeData2 = merge(mergeData,activity, by.x="activity",by.y= "V1", all=TRUE)
# Transform the activity labels to use descriptive activity names 
mergeData2 <- mutate(mergeData2, activity=V2)
# Select only the required columns 
mergeData2 <- select(mergeData2, -V2)

#  create a data set with the average of each variable for each activity and each subject.
mergeData3 <- mergeData2 %>%
        group_by(activity, subject) %>%
        summarise_each(funs(mean))

#  Create a tx file to store the tidy data set created above
write.table(mergeData3, file = "getdataProject.txt", quote = TRUE, sep = " ", row.name = FALSE,
            col.names = TRUE, qmethod = "double")
