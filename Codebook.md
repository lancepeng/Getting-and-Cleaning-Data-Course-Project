Codebook.md
Lance Peng
Tuesday, 20 September, 2016

Getting and Cleaning Data Course Project:-
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article (http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files loaded:
1. y_train.txt
2. X_train.txt
3. subject_train.txt
4. y_test.txt
5. X_test.txt
6. subject_test.txt

Processing:
1. Part 2 is to Extracts only the measurements on the mean and standard deviation for each measurement. Refer below for the measurements. 

"tBodyAcc.mean.X"          
"tBodyAcc.mean.Y"           
"tBodyAcc.mean.Z"          
"tBodyAcc.std.X"            
"tBodyAcc.std.Y"           
"tBodyAcc.std.Z"            
"tGravityAcc.mean.X"       
"tGravityAcc.mean.Y"        
"tGravityAcc.mean.Z"       
"tGravityAcc.std.X"         
"tGravityAcc.std.Y"        
"tGravityAcc.std.Z"         
"tBodyAccJerk.mean.X"      
"tBodyAccJerk.mean.Y"       
"tBodyAccJerk.mean.Z"      
"tBodyAccJerk.std.X"        
"tBodyAccJerk.std.Y"       
"tBodyAccJerk.std.Z"        
"tBodyGyro.mean.X"         
"tBodyGyro.mean.Y"          
"tBodyGyro.mean.Z"         
"tBodyGyro.std.X"           
"tBodyGyro.std.Y"          
"tBodyGyro.std.Z"           
"tBodyGyroJerk.mean.X"     
"tBodyGyroJerk.mean.Y"      
"tBodyGyroJerk.mean.Z"     
"tBodyGyroJerk.std.X"       
"tBodyGyroJerk.std.Y"      
"tBodyGyroJerk.std.Z"       
"tBodyAccMag.mean"         
"tBodyAccMag.std"           
"tGravityAccMag.mean"      
"tGravityAccMag.std"        
"tBodyAccJerkMag.mean"     
"tBodyAccJerkMag.std"       
"tBodyGyroMag.mean"        
"tBodyGyroMag.std"          
"tBodyGyroJerkMag.mean"    
"tBodyGyroJerkMag.std"      
"fBodyAcc.mean.X"          
"fBodyAcc.mean.Y"           
"fBodyAcc.mean.Z"          
"fBodyAcc.std.X"            
"fBodyAcc.std.Y"           
"fBodyAcc.std.Z"            
"fBodyAccJerk.mean.X"      
"fBodyAccJerk.mean.Y"       
"fBodyAccJerk.mean.Z"      
"fBodyAccJerk.std.X"        
"fBodyAccJerk.std.Y"       
"fBodyAccJerk.std.Z"        
"fBodyGyro.mean.X"         
"fBodyGyro.mean.Y"          
"fBodyGyro.mean.Z"         
"fBodyGyro.std.X"           
"fBodyGyro.std.Y"          
"fBodyGyro.std.Z"           
"fBodyAccMag.mean"         
"fBodyAccMag.std"           
"fBodyBodyAccJerkMag.mean" 
"fBodyBodyAccJerkMag.std"   
"fBodyBodyGyroMag.mean"    
"fBodyBodyGyroMag.std"      
"fBodyBodyGyroJerkMag.mean"
"fBodyBodyGyroJerkMag.std"  
"activityLabel" 

2. Part 3, 4 is Uses descriptive activity names to name the activities in the data set and Appropriately labels the data set with descriptive variable names

3. Part 5 is to creates a second, independent tidy data set with the average of each variable for each activity and each subject. Output is output.csv.

