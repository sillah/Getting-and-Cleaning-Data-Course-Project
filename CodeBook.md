#### Data Set Code Book: Getting and Cleaning Data Course Project

##### May 24th, 2015
##### Codebook prepared by Sillah, based on the 'getdataProject.txt' dataset.

The file (getdataProject.txt) contains 180 records showing mean values for body acceleration signals and angular velocity for 30 subjects over 6 activities.

**Units**
* The subject ids are shown as integers 1-30, each number representing an individual subject
* The acceleration signals and body acceleration signals are shown in standard gravity units 'g'. 
* The angular velocity measured by the gyroscope, are measured in radians/second. 
* There are 6 different activities; WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

**Input Data**
I downloaded the input dataset from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and saved the downloaded data to the "C:/Users/Mary/Documents/DSS/Obtaining Data/Course Project/UCI HAR Dataset" folder on my personal computer.  This directory is the main directory for this project and starting working directory for all input files.

**Code**

Everything required for the creation of this dataset was performed by the run_analysis.R script.
The code starts out by reading the required data from the UCI HAR dataset.  Not all files in the UCI HAR dataset were used for this project.  The code below shows all the files that were read, and how they were read.

# load the datasets
> trainData <- read.table("./train/X_train.txt", sep = "", header = FALSE)
> trainLabel <- read.table("./train/Y_train.txt", sep = ",", header = FALSE)
> subjectTrain <- read.table("./train/subject_train.txt", sep = "", header = FALSE)
> testData <- read.table("./test/X_test.txt", sep = "", header = FALSE)
> testLabel <- read.table("./test/Y_test.txt", sep = ",", header = FALSE)
> subjectTest <- read.table("./test/subject_test.txt", sep = "", header = FALSE)
> feature <- read.table("features.txt", sep = "", header = FALSE)
> activity <- read.table("activity_labels.txt", sep = "", header = FALSE) 

Once all 8 files were read in, I spent some time analyzing them to understand their contents, structure, and how they related to each other.  This analysis is not shown in the R script as it was purely exploratory for me to understand how to tackle the assignment.  Below are the steps performed in the script after loading and exploring the files:
* Get the names and indexes of all the fields with mean() and std() in their names from the feature data frame.
* Extract only the measurements on the mean and standard deviation from the trainData and testData data frames using the indexes in the step above.
* Appropriately label the extracts from trainData and testData using the names extracted from the feature data frame.  
* Also provide descriptive names for the variables stored in the trainLabel, testLabel, subjectTrain, and subjectTest data frames
* Once the variables in the data frames were renamed, I started the process of putting the together to create 1 dataset'
  * First I put all the training data together by suing cbind.
  
    > trainData <- cbind(cbind(trainLabel,subjectTrain),trainData)
  * Secondly, I put all the test data together using the same method as the training data.
  
    > TestData <- cbind(cbind(testLabel,subjectTest),testData)
  * Then I put the training data and test data together using rbind to create a merged training and test dataset. 
    > mergeData <- rbind(trainData, testData)

  * Once the merged training and test dataset was created, I used the merge function to merge it with the activity data frame and transformed the activities in the merged training and test dataset to the descriptive activity names stored in the activity data frame. (mergeData2)
* Note:  The steps listed above did not follow the chronological sequence of steps outlined in the assignment, but they achieve the same outcome of tidying the data and selecting only the mean and standard deviation variables.

I summarized mergeData2 to create a dataset (mergeData3) with the average of each variable for each activity and each subject.  This was achieved using the code below:
> mergeData3 <- mergeData2 %>%
        group_by(activity, subject) %>%
        summarise_each(funs(mean))

For the final step, I created a txt file (getdataProject.txt) to store mergeData3 using the code below:  
> write.table(mergeData3, file = "getdataProject.txt", quote = TRUE, sep = " ", row.name = FALSE,
            col.names = TRUE, qmethod = "double")

getdataProject.txt contain the variables listed below:

Activity   	(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  
Subject		(1 - 30)  
66 variables showing the mean of all the fields with mean() and std() in their names from the UCI HAR dataset.  
tBodyAcc-mean()-X  
tBodyAcc-mean()-Y  
tBodyAcc-mean()-Z  
tBodyAcc-std()-X  
tBodyAcc-std()-Y  
tBodyAcc-std()-Z  
tGravityAcc-mean()-X  
tGravityAcc-mean()-Y  
tGravityAcc-mean()-Z  
tGravityAcc-std()-X  
tGravityAcc-std()-Y  
tGravityAcc-std()-Z  
tBodyAccJerk-mean()-X  
tBodyAccJerk-mean()-Y  
tBodyAccJerk-mean()-Z 
tBodyAccJerk-std()-X  
tBodyAccJerk-std()-Y  
tBodyAccJerk-std()-Z  
tBodyGyro-mean()-X  
tBodyGyro-mean()-Y  
tBodyGyro-mean()-Z  
tBodyGyro-std()-X  
tBodyGyro-std()-Y  
tBodyGyro-std()-Z  
tBodyGyroJerk-mean()-X  
tBodyGyroJerk-mean()-Y  
tBodyGyroJerk-mean()-Z  
tBodyGyroJerk-std()-X  
tBodyGyroJerk-std()-Y  
tBodyGyroJerk-std()-Z  
tBodyAccMag-mean()  
tBodyAccMag-std()  
tGravityAccMag-mean()  
tGravityAccMag-std()  
tBodyAccJerkMag-mean()  
tBodyAccJerkMag-std()  
tBodyGyroMag-mean()  
tBodyGyroMag-std()  
tBodyGyroJerkMag-mean()  
tBodyGyroJerkMag-std()  
fBodyAcc-mean()-X  
fBodyAcc-mean()-Y  
fBodyAcc-mean()-Z  
fBodyAcc-std()-X  
fBodyAcc-std()-Y  
fBodyAcc-std()-Z  
fBodyAccJerk-mean()-X  
fBodyAccJerk-mean()-Y  
fBodyAccJerk-mean()-Z  
fBodyAccJerk-std()-X  
fBodyAccJerk-std()-Y  
fBodyAccJerk-std()-Z  
fBodyGyro-mean()-X  
fBodyGyro-mean()-Y  
fBodyGyro-mean()-Z  
fBodyGyro-std()-X  
fBodyGyro-std()-Y  
fBodyGyro-std()-Z  
fBodyAccMag-mean()  
fBodyAccMag-std()   
fBodyBodyAccJerkMag-mean() 
fBodyBodyAccJerkMag-std()  
fBodyBodyGyroMag-mean()  
fBodyBodyGyroMag-std()  
fBodyBodyGyroJerkMag-mean()  
fBodyBodyGyroJerkMag-std()  


If you are in the working directory specified above, you ca read the file using the code below:  

> read.table("getdataProject.txt", header = TRUE)

Below is a snippet of the first 6 columns of the first 6 rows of the output file:

  activity subject tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z tBodyAcc.std...X  
1   LAYING       1         0.2215982       -0.04051395        -0.1132036       -0.9280565  
2   LAYING       2         0.2813734       -0.01815874        -0.1072456       -0.9740595  
3   LAYING       3         0.2755169       -0.01895568        -0.1013005       -0.9827766  
4   LAYING       4         0.2635592       -0.01500318        -0.1106882       -0.9541937  
5   LAYING       5         0.2783343       -0.01830421        -0.1079376       -0.9659345  
6   LAYING       6         0.2486565       -0.01025292        -0.1331196       -0.9340494  

