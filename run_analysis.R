setwd("E:/Learning/Master/Data Science/Getting and cleaning Data/Project")
library(plyr)
library(reshape2)
library(knitr)
# Load the datasets
# Dataset Variables 
# Values of Varible Activity consist of data from “Y_train.txt” and “Y_test.txt”
# values of Varible Subject consist of data from “subject_train.txt” and subject_test.txt"
# Values of Varibles Features consist of data from “X_train.txt” and “X_test.txt”
train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
names(trainActivities) <- "Activities"
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(trainSubjects) <- "subject"
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
#set names to variables
names(testActivities) <- "Activities"
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(testSubjects) <- "subject"
test <- cbind(testSubjects, testActivities, test)


# merge datasets and add labels
allData <- rbind(train, test)
# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################
# Load activity labels + features and Cast Labels and feature nemes as char
# Step 3
# Use descriptive activity names to name the activities in the data set
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
# Step 4
# Appropriately label the data set with descriptive variable names
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation
featuresWanted <- grep("mean\\(\\)|std\\(\\)", features[,2])
featuresWanted.names <- features[featuresWanted,2]

featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)

# subset the desired columns
allData_Featurewanted <- allData[featuresWanted]

# convert activities & subjects into factors

allData_Featurewanted$Activities <- factor(allData_Featurewanted$Activities,levels = activityLabels[,1],labels = activityLabels[,2])
allData_Featurewanted$subject <- as.factor(allData_Featurewanted$subject)

allData_Featurewanted_melted <- melt(allData_Featurewanted, id = c("subject", "Activities"))
allData_Featurewanted_mean <- dcast(allData_Featurewanted_melted, subject + Activities ~ variable, mean)

write.table(allData_Featurewanted_mean, "tidy.txt", row.names = FALSE, quote = FALSE)

