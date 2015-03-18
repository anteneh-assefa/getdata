Getting and cleaning data course project
========================================

## 1. Merges the training and the test sets to create one data set.

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              "rawData.zip", method="curl")
unzip("rawData.zip")

trainData <- read.table("UCI HAR Dataset/train/X_train.txt", sep="")
names(trainData) <- c(as.character(read.table("UCI HAR Dataset/features.txt", sep="")[,2]))

trainData <- cbind(read.table("UCI HAR Dataset/train/subject_train.txt", sep=""),
                   read.table("UCI HAR Dataset/train/y_train.txt", sep=""),
                   trainData)
names(trainData)[1] <- "subject"; names(trainData)[2] <- "actLabel"

testData <- cbind(read.table("UCI HAR Dataset/test/subject_test.txt", sep=""),
                  read.table("UCI HAR Dataset/test/y_test.txt", sep=""),
                  read.table("UCI HAR Dataset/test/X_test.txt", sep=""))
names(testData) <- names(trainData)

trainTest <- rbind(trainData,testData)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

meanStd <- trainTest[, c(1:2, grep("[Mm]ean|std",names(trainTest)))]

## 3. Use descriptive activity names to name the activities in the data set.

for (i in 1:nrow(meanStd)){
    if(meanStd[i,"actLabel"] == 1) {meanStd[i,"actLabel"] <- "Walking"}
    else if(meanStd[i,"actLabel"] == 2) {meanStd[i,"actLabel"] <- "Walking Upstairs"}
    else if(meanStd[i,"actLabel"] == 3) {meanStd[i,"actLabel"] <- "Walking Downstairs"}
    else if(meanStd[i,"actLabel"] == 4) {meanStd[i,"actLabel"] <- "Sitting"}
    else if(meanStd[i,"actLabel"] == 5) {meanStd[i,"actLabel"] <- "Standing"}
    else if(meanStd[i,"actLabel"] == 6) {meanStd[i,"actLabel"] <- "Laying"}
}

## 4. Appropriately labels the data set with descriptive variable names.

names(meanStd) <- gsub("^t", "", names(meanStd)); names(meanStd) <- gsub("^f", "", names(meanStd))
names(meanStd) <- gsub("-", "", names(meanStd)); names(meanStd) <- gsub("\\)", "", names(meanStd))
names(meanStd) <- gsub("\\(", "", names(meanStd))

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
##    each variable for each activity and each subject.

tidyData <- aggregate(meanStd[,3:ncol(meanStd)], 
            by=list(subject = meanStd$subject, actLabel = meanStd$actLabel), 
            mean)
write.table(tidyData, "tidy_data.txt",sep="\t", row.names=F, col.names=T, quote=F)

