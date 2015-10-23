# **This document describes the code inside run_analysis.R.**

## the code is divided to some parts
* Reading DATA
* Manipulating DATA
* Merge DATA
* Calculate Mean Of needed Features
* Write the data to file 
1. Set the directory to the ../data/
2. Read X_train.txt, y_train.txt and subject_train.txt from the "./UCI HAR Dataset/train" folder and store them in train, trainActivities and trainSubjects variables respectively.
3. Read X_test.txt, y_test.txt and subject_test.txt from the "./UCI HAR Dataset/test" folder and store them in test, testActivities and testSubjects variables respectively.
4. Merge Train Data to Test Data to generate a 10299x563 data frame, allData; 
5. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.
6. Read the features.txt file from the "/UCI HAR Dataset" folder and store the data in a variable called featuresWanted. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of joinData with the 66 corresponding columns.
7. Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
8. Read the activity_labels.txt file from the "./UCI HAR Dataset" folder and store the data in a variable called activity.
9. Extract only the measurements on the mean and standard deviation for each the allData to allData_Featurewanted using variable featuresWanted.
10. Finally, generate a second independent tidy data set named allData_Featurewanted_mean with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination.
11. Write the result out to "tidy.txt" file in current working directory.
