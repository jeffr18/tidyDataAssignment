# Project 1

# Part 1 - Import and merge data files
# Read raw data files into data frames
featuresData <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, colClasses=c("numeric", "character"), col.names=c("number", "column_title"))
activityLabelsData <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, colClasses=c("numeric", "character"), col.names=c("activity_id", "activity_label"))
xTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names=featuresData$column_title)
yTrainData <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names=c("activity_id"))
subjectTrainData <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names=c("subject_id"))
xTestData <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names=featuresData$column_title)
yTestData <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names=c("activity_id"))
subjectTestData <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names=c("subject_id"))

# Attach the activity label to the activity id in the train/test data
mergedYTrainData <- merge(yTrainData, activityLabelsData, by.x="activity_id", by.y="activity_id", all=FALSE)
mergedYTestData <- merge(yTestData, activityLabelsData, by.x="activity_id", by.y="activity_id", all=FALSE)

# Combine the columns of the train/test data
mergedTrainData = cbind(xTrainData, subjectTrainData, mergedYTrainData)
mergedTestData = cbind(xTestData, subjectTestData, mergedYTestData)

# Combine the rows of the train/test data
finalData = rbind(mergedTrainData, mergedTestData)



# Part 2 - Extract mean and standard deviation measurements
# Issolate the mean and standard deviation values
issolatedData <- data.frame(subject_id=finalData$subject_id, activity_id=finalData$activity_id, activity_label=finalData$activity_label)

# cbind mean columns.  Search column name for text "mean" but don't inlcude "meanFreq"
meanColumns <- grepl("mean",names(finalData)) & !grepl("meanFreq", names(finalData))
issolatedData <- cbind(issolatedData, finalData[meanColumns])

# cbind standard deviation columns.  Search column name for text "std"
stdColumns <- grepl("std",names(finalData))
issolatedData <- cbind(issolatedData, finalData[stdColumns])

# Part 3 - Create human-readable variable names
#convert periods to underscores
names(issolatedData) <- gsub("...", "_", names(issolatedData), fixed=TRUE)
names(issolatedData) <- gsub("..", "_", names(issolatedData), fixed=TRUE)
names(issolatedData) <- gsub(".", "_", names(issolatedData), fixed=TRUE)

#remove underscores that appear at the end
names(issolatedData) <- gsub("_$", "", names(issolatedData))

#replace text at beggining of variable name with more human readable text
names(issolatedData) <- gsub("^tBody", "time_body", names(issolatedData))
names(issolatedData) <- gsub("^fBody", "freq_body", names(issolatedData))
names(issolatedData) <- gsub("^tGravity", "time_gravity", names(issolatedData))


# Part 4 - Creates a second, independent tidy data set with the average of each variable for each activity 
# and each subject. 



# Write out tidy data to file
outputFilePath = ./tidyData.txt
write.table()




