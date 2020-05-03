### Variables

identifiers in tidyData.csv file

1. `activityID` 
2. `subjectID` 
3. `activityType`

measures in tidyData.csv file: 
Time_BodyAcc_Mean_X Time_BodyAcc_Mean_Y Time_BodyAcc_Mean_Z Time_BodyAcc_Std_X Time_BodyAcc_Std_Y Time_BodyAcc_Std_Z Time_GravityAcc_Mean_X Time_GravityAcc_Mean_Y Time_GravityAcc_Mean_Z Time_GravityAcc_Std_X Time_GravityAcc_Std_Y Time_GravityAcc_Std_Z Time_BodyAccJerk_Mean_X Time_BodyAccJerk_Mean_Y Time_BodyAccJerk_Mean_Z Time_BodyAccJerk_Std_X Time_BodyAccJerk_Std_Y Time_BodyAccJerk_Std_Z Time_BodyGyro_Mean_X Time_BodyGyro_Mean_Y Time_BodyGyro_Mean_Z Time_BodyGyro_Std_X Time_BodyGyro_Std_Y Time_BodyGyro_Std_Z Time_BodyGyroJerk_Mean_X Time_BodyGyroJerk_Mean_Y Time_BodyGyroJerk_Mean_Z Time_BodyGyroJerk_Std_X Time_BodyGyroJerk_Std_Y Time_BodyGyroJerk_Std_Z Time_BodyAccMag_Mean Time_BodyAccMag_Std Time_GravityAccMag_Mean Time_GravityAccMag_Std Time_BodyAccJerkMag_Mean Time_BodyAccJerkMag_Std Time_BodyGyroMag_Mean Time_BodyGyroMag_Std Time_BodyGyroJerkMag_Mean Time_BodyGyroJerkMag_Std Freq_BodyAcc_Mean_X Freq_BodyAcc_Mean_Y Freq_BodyAcc_Mean_Z Freq_BodyAcc_Std_X Freq_BodyAcc_Std_Y Freq_BodyAcc_Std_Z Freq_BodyAcc_MeanFreq_X Freq_BodyAcc_MeanFreq_Y Freq_BodyAcc_MeanFreq_Z Freq_BodyAccJerk_Mean_X Freq_BodyAccJerk_Mean_Y Freq_BodyAccJerk_Mean_Z Freq_BodyAccJerk_Std_X Freq_BodyAccJerk_Std_Y Freq_BodyAccJerk_Std_Z Freq_BodyAccJerk_MeanFreq_X Freq_BodyAccJerk_MeanFreq_Y Freq_BodyAccJerk_MeanFreq_Z Freq_BodyGyro_Mean_X Freq_BodyGyro_Mean_Y Freq_BodyGyro_Mean_Z Freq_BodyGyro_Std_X Freq_BodyGyro_Std_Y Freq_BodyGyro_Std_Z Freq_BodyGyro_MeanFreq_X Freq_BodyGyro_MeanFreq_Y Freq_BodyGyro_MeanFreq_Z Freq_BodyAccMag_Mean Freq_BodyAccMag_Std Freq_BodyAccMag_MeanFreq Freq_BodyAccJerkMag_Mean Freq_BodyAccJerkMag_Std Freq_BodyAccJerkMag_MeanFreq Freq_BodyGyroMag_Mean Freq_BodyGyroMag_Std Freq_BodyGyroMag_MeanFreq Freq_BodyGyroJerkMag_Mean Freq_BodyGyroJerkMag_Std Freq_BodyGyroJerkMag_MeanFreq

Variables of the R code file:

-`fileURL`:         This contains the URL of data file to be downloaded

-`fileLocal`:       This contains data files local name

-`activity_labels`: This contains data from file "activity_labels.txt"

-`features`:        This contains data from file "features.txt

-`subject_train`:   This contains data from file "subject_train.txt"

-`X_train`:         This contains data from file "X_train.txt"

-`y_train`:         This contains data from file "y_train.txt"

-`subject_test`:    This contains data from file "subject_test.txt"

-`X_test`:          This contains data from file "X_test.txt"

-`y_test`:          This contains data from file "y_test.txt"

-`Data train_data`: This will contain all the columns from X, Y and subject training data

-`test_data`:       This will contain all the columns from X, Y and subject test data

-`full_data`:       This will contains all the records of training and test data

-`mean_std_data`:   This will contains a subset of data for Mean and standard deviation columns, activityID, subjectID and activityType. This will also contain proper column names.

-`data_average`:     This will contains mean of all numeric columns

### Transformations

- For test and training data subject, activity and measurement details were given in separate files. Thus activity for merging data was performed.
- Column names contained codes, parenthesis, hyphen, repeated words etc. which are removed and replaced with underscore where applicable.
- Mean calculation for all numeric columns.
- Exported data to a csv file "tidyData.csv"
