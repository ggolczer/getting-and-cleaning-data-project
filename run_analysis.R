

library(dplyr)

################GETTING DATA##################

#Download data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "UCI HAR Dataset.zip"

if (!file.exists(file)) {
  download.file(url, file, mode = "wb")
}
#Unzip Data
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(file)
}
################READ THE DATA################

#Loading Training data sets

training_subjects <- read.table(file.path(dataPath, "train", "subject_train.txt"))
training_values <- read.table(file.path(dataPath, "train", "X_train.txt"))
training_activity <- read.table(file.path(dataPath, "train", "y_train.txt"))

#Loading Test data sets

test_subjects <- read.table(file.path(dataPath, "test", "subject_test.txt"))
test_values <- read.table(file.path(dataPath, "test", "X_test.txt"))
test_activity <- read.table(file.path(dataPath, "test", "y_test.txt"))

#Load Features

features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)

#Load Activity Labels

activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activity_id_number", "activity_label")

#########Merges the training and the test sets to create one data set.

activity_all_data <- rbind(
  cbind(training_subjects, training_activity, training_values),
  cbind(test_subjects,  test_activity, test_values)
)

colnames(activity_all_data) <- c("subject", "activity",features[, 2] )

#########Extracts only the measurements on the mean and standard deviation for each measurement.

columns_mean_sd <- grepl("subject|activity|mean|std", colnames(activity_all_data))
activity_all_data <- activity_all_data[, columns_mean_sd]

########Uses descriptive activity names to name the activities in the data set

activity_all_data$activity <- factor(activity_all_data$activity, levels = activities[, 1], labels = activities[, 2])

########Appropriately labels the data set with descriptive variable names.

column_labels <- colnames(activity_all_data)
column_labels<- gsub("[\\(\\)-]", "", column_labels)
column_labels <- gsub("BodyBody", "Body", column_labels)
column_labels <- gsub("^f", "frequency_domain", column_labels)
column_labels <- gsub("^t", "time_domain", column_labels)
column_labels <- gsub("Acc", "accelerometer", column_labels)
column_labels <- gsub("Gyro", "gyroscope", column_labels)
column_labels <- gsub("Mag", "magnitude", column_labels)
column_labels <- gsub("Freq", "frequency", column_labels)
column_labels <- gsub("mean", "mean", column_labels)
column_labels <- gsub("std", "standard_deviation", column_labels)
colnames(activity_all_data) <- column_labels

########Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

activity_means <- activity_all_data %>% group_by(subject, activity) %>% summarise_all(funs(mean))

write.table(activity_means, "tidy.txt", row.names = FALSE)
