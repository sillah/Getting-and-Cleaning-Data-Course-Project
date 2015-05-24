==================================================================
#### Getting and Cleaning Data Course Project
==================================================================
###### Sillah
==================================================================
This project uses data from the Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine study conducted by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.  

Their experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.   

As per project directions, I combined the training and test data from the Human Activity Recognition Using Smartphones Dataset, selected the variables with mean() and standard deviation (std()) in their names, renamed variables to make them more descriptive, and created a dataset that showed the mean values of the variables I selected for every activity and subject.  

For each record, I provided:
======================================
- Activity Name.   
- An identifier of the subject who carried out the experiment.  
- A 66-feature vector showing the mean of variables that had mean() or std() in their names in the Human Activity Recognition Using Smartphones Dataset.   

The dataset includes the following files:
'README.md'  
'CodeBook.md':  Data dictionary and description of steps  
'run_analysis.R':  The R script that performs the analysis required for this project  
'getdataProject.txt': Shows the average of each variable for each activity and each subject.  

Each row in the dataset identifies an activity, the subject who performed the activity, and the mean of the mean and standard deviation variables collected in the Human Activity Recognition Using Smartphones study.  

Just as in the Human Activity Recognition Using Smartphones study, the acceleration signals and body acceleration signals are still shown in standard gravity units 'g' and the angular velocity measured by the gyroscope, are measured in radians/second. 
