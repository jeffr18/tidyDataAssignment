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


# Part 3 - Create human-readable variable names
#convert periods to underscores
names(finalData) <- gsub("...", "_", names(finalData), fixed=TRUE)
names(finalData) <- gsub("..", "_", names(finalData), fixed=TRUE)
names(finalData) <- gsub(".", "_", names(finalData), fixed=TRUE)

#remove underscores that appear at the end
names(finalData) <- gsub("_$", "", names(finalData))

#replace text at beggining of variable name with more human readable text
names(finalData) <- gsub("^tBody", "time_body", names(finalData))
names(finalData) <- gsub("^fBody", "freq_body", names(finalData))
names(finalData) <- gsub("^tGravity", "time_gravity", names(finalData))



# Part 2 - Extract mean and standard deviation measurements
dataColumnNames <- c()

# Create base data frame with id values
issolatedData <- data.frame(subject_id=finalData$subject_id, activity_id=finalData$activity_id, activity_label=finalData$activity_label)

# cbind mean columns.  Search column name for text "mean" but don't inlcude "meanFreq"
meanColumns <- grepl("mean",names(finalData)) & !grepl("meanFreq", names(finalData))
dataColumnNames <- c(dataColumnNames, names(finalData[meanColumns]))
issolatedData <- cbind(issolatedData, finalData[meanColumns])

# cbind standard deviation columns.  Search column name for text "std"
stdColumns <- grepl("std",names(finalData))
dataColumnNames <- c(dataColumnNames, names(finalData[stdColumns]))
issolatedData <- cbind(issolatedData, finalData[stdColumns])


# Part 4 - Creates a second, independent tidy data set with the average of each variable for each activity 
# and each subject. 
subjectList = unique(issolatedData$subject_id)
activityList = unique(issolatedData$activity_label)

tidyData <- data.frame()

for (subjectValue in subjectList)
{
    for (activityValue in activityList)
    {
        # Create a subset for each subject and each activity
        activityData <- subset(issolatedData, (issolatedData$subject_id == subjectValue) & 
                                   (issolatedData$activity_label == activityValue))
        
        # loop through the data columns and generate the average for each one
        for (columnValue in dataColumnNames)
        {
            # issolate the column for the specific data and get the average
            dataColumn <- grepl(columnValue,names(activityData))
            averageValue <- mean(activityData[,dataColumn])
            
            # create a record in the tidy data frame
            tidyData <- rbind(tidyData, c(subjectValue, activityValue, columnValue, averageValue))
        }
    }
}

# Part 5 - Finalize tidy data and save to file
# Set the column variable names for the tidy data frame
names(tidyData) <- c("subject_id", "activity_label", "data_name", "average_value")

# Convert subject_id and average_value to numeric
tidyData$subject_id <- as.numeric(tidyData$subject_id)
tidyData$average_value <- as.numeric(tidyData$average_value)

# Write out tidy data to file
outputFilePath <- "./tidy_data.txt"
write.table(tidyData, file=outputFilePath, row.names=FALSE)




