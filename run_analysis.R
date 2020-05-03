# As part of this activity, below mentieond tasks need to be complete.

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

# First need to download the zip file and extract all the files.
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileLocal <- "activity.zip"

# download file if its not present locally
if(!file.exists(fileLocal)){
  download.file(fileURL, fileLocal)
}

#Unzip the zip file in current folder.
unzip(zipfile =  fileLocal, exdir = ".", overwrite = TRUE)


### Task 1: Merges the training and the test sets to create one data set.  

#Both train and test folder cantains 3 files, containing data for subject, x and y data. Two common files are also present which contains activity (activity_labels.txt) and feature (features.txt) details.
#Read all given files in dataframes:
activity_labels <- read.table(file = "./UCI HAR Dataset/activity_labels.txt",header = FALSE, sep = " ")
features <- read.table(file = "./UCI HAR Dataset/features.txt", header = FALSE, sep = " ")

subject_train <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table(file = "./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table(file = "./UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table(file = "./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table(file = "./UCI HAR Dataset/test/y_test.txt")



#Apply proper column names to the dataframes. X data file contains reading of all the features and there column names information, we already read in features variable. Assign column names from features dataframe to dataframes containing features (X dataframes).
colnames(activity_labels) <- c("activityID","activityType")
colnames(features) <- c("featureID","featureType")
colnames(subject_train) <- c("subjectID")
colnames(X_train) <- features[,2]
colnames(y_train) <- c("activityID")
colnames(subject_test) <- c("subjectID")
colnames(X_test) <- features[,2]
colnames(y_test) <- c("activityID")


#Combine all 3 files data columnwise in one dataframe related to test and train in respective dataframes.
train_data <- cbind(y_train, subject_train, X_train)
test_data <- cbind(y_test, subject_test, X_test)


#Combine both test and train data rowwise in one dataframe. as they have common table structure.
full_data <- rbind(train_data,test_data)


### Task 2: Extracts only the measurements on the mean and standard deviation for each measurement.

#Mean and standard deviation column contains "mean" and "std" in thier column names.
#Aslo we need activity and subject id columns. 
mean_std_data <- full_data[ , grepl("mean|std|activityID|subjectID", names(full_data)) ]



### Task 3: Uses descriptive activity names to name the activities in the data set.

#Join with activity_labels dataframe to get activity names in the dataframe.
mean_std_data <- merge(mean_std_data, activity_labels, by = "activityID")


### Task 4: Appropriately labels the data set with descriptive variable names.

colnames(mean_std_data) <- gsub("\\(|\\)","", (names(mean_std_data)))
colnames(mean_std_data) <- gsub("-","_", (names(mean_std_data)))
colnames(mean_std_data) <- gsub("BodyBody","Body", (names(mean_std_data)))
colnames(mean_std_data) <- gsub("mean","Mean", (names(mean_std_data)))
colnames(mean_std_data) <- gsub("std","Std", (names(mean_std_data)))
colnames(mean_std_data) <- gsub("^f","Freq_", (names(mean_std_data)))
colnames(mean_std_data) <- gsub("^t","Time_", (names(mean_std_data)))
## There were duplicates in column names so make them unique
## colnames(full_data) <- make.unique( names(full_data) )


### Answer 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# data_average <- mean_std_data %>% group_by(activityID, subjectID) %>% summarise_all(.funs = "mean" )
data_average <- mean_std_data %>% group_by(activityID, subjectID, activityType) %>% summarise_all("mean" )


### Export data to a csv file
write.table(x= data_average, file = "tidyData.csv", row.names = FALSE, quote = FALSE)
