library(dplyr)

#  Read in all the needed files

x_train <- read.table("train/X_train.txt", header=FALSE)
y_train <- read.table("train/y_train.txt", header=FALSE)
subject_train <- read.table("train/subject_train.txt", header=FALSE)

x_test <- read.table("test/X_test.txt", header=FALSE)
y_test <- read.table("test/y_test.txt", header=FALSE)
subject_test <- read.table("test/subject_test.txt", header=FALSE)

features <- read.table("features.txt", header=FALSE) 
activity_labels <- read.table("activity_labels.txt", header=FALSE)

# combine the X files and rename the columns to names provided in the features file.
x_all <- rbind(x_train, x_test) 
names(x_all) <- features$V2   

#Use descriptive activity names to name the activities in the data set
#Combine the 2 y files and look up the Activity values

y_all <- rbind(y_train, y_test)
y_all[, 1] <- activity_labels[y_all[, 1], 2]  
names(y_all) <- "Activity" 

#  combine the 2 subject files and rename the column to Subject

subject_all <- rbind(subject_train, subject_test)
names(subject_all) <- "Subject"

#  Merge the training and test sets to create one data set

all_in_one <- cbind(subject_all,y_all,x_all)

#   Extract only the measurements on the mean and standard deviation 
#   for each measurement. 

#  Pattern search to find all the std() and mean() data values

mean_std_cols <- grep("mean|std",features[,2])
x_mean_std <- x_all[, mean_std_cols]

#  Create a new data set with just the mean and Standard Dev metrics
mean_std_all <- cbind(subject_all,y_all,x_mean_std)

#  Create another data set based on the above with the rows aggregated.  Summarizing one row for each subject and activity averaging the mean and std values
summary_data <- aggregate(mean_std_all[,3:ncol(mean_std_all)], by = list(Subject=mean_std_all$Subject, Activity=mean_std_all$Activity), FUN=mean)

#save the "tidy" set of data to a text file
write.table(summary_data, "summary.txt", row.name=FALSE)
