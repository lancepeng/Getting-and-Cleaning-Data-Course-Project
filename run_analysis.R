####
# Part 1: Merges the training and the test sets to create one data set.
###
# read in y_train
y_train <- read.csv("UCI HAR Dataset/train/y_train.txt")
# rename X5 to type_of_exercise
names(y_train) <- "activityID"
# add ID column by using row number as values of ID column
y_train[,"ID"] <- as.numeric(rownames(y_train))

# read in x_train
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
# add ID column by using row number as values of ID column
x_train[,"ID"] <- as.numeric(rownames(x_train))

# read in subject training data
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt")
# rename X1 to subjectID
names(subject_train) <- "subjectID"
# add ID column by using row number as values of ID column
subject_train[,"ID"] <- as.numeric(rownames(subject_train))

# merge y_train with subject_train
trainData <- merge(y_train,subject_train,all=TRUE)
# merge trainData with x_train
trainData <- merge(trainData,x_train,all=TRUE)

# read in test y_train
test_y_train <- read.csv("UCI HAR Dataset/test/y_test.txt")
# rename X5 to type_of_exercise
names(test_y_train) <- "activityID"
# add ID column by using row number as values of ID column
test_y_train[,"ID"] <- as.numeric(rownames(test_y_train))

# read in test x_train
test_x_train <- read.table("UCI HAR Dataset/test/X_test.txt")
# add ID column by using row number as values of ID column
test_x_train[,"ID"] <- as.numeric(rownames(test_x_train))

# read in test subject training data
test_subject_train <- read.csv("UCI HAR Dataset/test/subject_test.txt")
# rename X1 to subjectID
names(test_subject_train) <- "subjectID"
# add ID column by using row number as values of ID column
test_subject_train[,"ID"] <- as.numeric(rownames(test_subject_train))

# merge test_y_train with test_subject_train
testData <- merge(test_y_train,test_subject_train,all=TRUE)
# merge testData with test_x_train
testData <- merge(testData,test_x_train,all=TRUE)

# add trainData and testData
trainTestData <- rbind(trainData,testData)

### end of part 1 

###
# Part 2: Extracts only the measurements on the mean and standard deviation for each measurement.
###
# extract mean and standard deviation
features = read.table("UCI HAR Dataset/features.txt", col.names=c("featureID", "featureLabel"))
selected_features <- features[grepl("mean\\(\\)", features$featureLabel) | grepl("std\\(\\)", features$featureLabel), ]
selectedData <- trainTestData[, c(c(1, 2, 3), selected_features$featureID + 3)]

### end of part 2

###
# Part 3: Uses descriptive activity names to name the activities in the data set
# Part 4: Appropriately labels the data set with descriptive variable names
###
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activityID", "activityLabel")) 
renamedSelectedData = merge(selectedData, activity_labels)

# Label the data set with descriptive activity names
selected_features$featureLabel = gsub("\\(\\)", "", selected_features$featureLabel)
selected_features$featureLabel = gsub("-", ".", selected_features$featureLabel)
for (i in 1:length(selected_features$featureLabel)) {
  colnames(renamedSelectedData)[i + 3] <- selected_features$featureLabel[i]
}
finalSelectedData = renamedSelectedData

### end of part 4

###
# Part 5: creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###
removedCols <- c("ID","activityLabel")
data5 <- finalSelectedData[,!(names(finalSelectedData) %in% removedCols)]
aggdata <-aggregate(data5, by=list(subject = data5$subjectID, activity = data5$activityID), FUN=mean, na.rm=TRUE)
removedCols <- c("subject","activity")
aggdata <- aggdata[,!(names(aggdata) %in% removedCols)]
aggdata = merge(aggdata, activity_labels)
write.csv(file="output.csv", x=aggdata)

### end of part 5