##First the working directory has to be set to the directory FilesForAnalysis

##Loads of all the necessary files into R
features <- read.table("features.txt")
subject_test <- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")
X_test <- read.table("X_test.txt")
X_train <- read.table("X_train.txt")
y_test <- read.table("y_test.txt")
y_train <- read.table("y_train.txt")
activity_labels <- read.table("activity_labels.txt")

##1.Merges the training and the test sets to create one data set.
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)
merged_set <- rbind(test, train)

##2.Extracts only the measurements on the mean and standard 
##deviation for each measurement.

##First I want to know what are columns on the mean or std
##so I extract a vector with variable names from features

variable_names <- features[,2]

#What are the numbers of variables that are going to be extracted?
##Which columns are extracted depends on the context of "mean" or "std".
##the columns extracted by this script are only these that contain "mean()" and "std()" in the name
extracted_features <- grep("mean\\()|std\\()", variable_names)

##In the mearged_set there are first two columns with subject and activity
##so I add 2 to each of the value in extracted_features vector 
##to get the numbers of column to extract
column_numbers <- extracted_features+2
df_extracted <- merged_set[,c(1,2, column_numbers)]#this is a data frame with extracted only the measurements on the mean and standard deviation for each measurement

##4.Appropriately labels the data set with descriptive variable names.
##Creates a vector with variables' names for df_extracted 
df_names <- c("subject", "activity", as.character(variable_names[extracted_features]) )
##Name the variables of df_extracted
colnames(df_extracted) <- df_names
##Makes the original names more readable
colnames(df_extracted) <- gsub("^t", "Time", colnames(df_extracted))
colnames(df_extracted) <- gsub("^f", "Freqency", colnames(df_extracted))
colnames(df_extracted) <- gsub("BodyBody", "Body", colnames(df_extracted))

##3.Uses descriptive activity names to name the activities in the data set
activity_vect <- activity_labels[,"V2"]
library(dplyr)
df_extracted <- mutate(df_extracted, activity = activity_vect[activity])

##5.From the data set in step 4, creates a second, independent tidy data set with 
##the average of each variable for each activity and each subject.
df_extracted <- tbl_df(df_extracted)
grouped <- group_by(df_extracted, subject, activity)
tidy_data <- summarize_all(grouped, mean)
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
