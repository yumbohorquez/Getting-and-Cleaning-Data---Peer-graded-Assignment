## Getting and Cleaning Data - Assignment



## Item# 1. Merges the training and the test sets to create one data set.

## Creating the directory
if(!file.exists("C:/Users/csms1109007/Documents/JABG/Econometria/Data Science - Johns Hopkings/Getting and Cleaning Data/Assignment2")) {
  dir.create("C:/Users/csms1109007/Documents/JABG/Econometria/Data Science - Johns Hopkings/Getting and Cleaning Data/Assignment2")}


## Download & unzip the dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Assignment2Data.zip")
unzip(zipfile="./Assignment2Data.zip", exdir="./Assignment2Data")


## Name & read the raw datasets (txt files)
subject_test <- read.table("./Assignment2Data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./Assignment2Data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Assignment2Data/UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("./Assignment2Data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./Assignment2Data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Assignment2Data/UCI HAR Dataset/train/y_train.txt")

features <- read.table("./Assignment2Data/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./Assignment2Data/UCI HAR Dataset/activity_labels.txt")

## labeling all columns with descriptive variable names  
colnames(activity_labels) <- c('activity_id', 'activity_name')

colnames(subject_test) <- "subject_id"                  ## (Solution for Item#4)
colnames(x_test) <- features[,2]                        ## (Solution for Item#4)
colnames(y_test) <- "activity_id"                       ## (Solution for Item#4)

colnames(subject_train) <- "subject_id"                 ## (Solution for Item#4)
colnames(x_train) <- features[,2]                       ## (Solution for Item#4)
colnames(y_train) <- "activity_id"                      ## (Solution for Item#4)

## Combining all test and all training datasets
test2 <- cbind(y_test, subject_test, x_test)
train2 <- cbind(y_train, subject_train, x_train)

## Merge both datasets
all_data <- rbind(test2, train2)                        ## (Solution for Item#4)

## Check the whole dataset
str(all_data)  ##"'data.frame':	10299 obs. of  563 variables:..."



## Item# 2. Extracts only the measurements on the mean and standard deviation for each measurement

## create a subset with specific conditions "mean" & "std"
subset2 <- features[grep("mean\\(\\)|std\\(\\)", features[,2]),]
subsetfinal <- all_data[, subset2[,1]]



## Item# 3. Uses descriptive activity names to name the activities in the data set

## changing te activity id by the activity name (adding and deleting columns) 
all_data2 <- merge(all_data, activity_labels, by="activity_id", all.x=T)
alldatafinal <- all_data2[, -1]



## Item# 4. 
## The solution is inside Item# 1.




## Item# 5. From the data set in step 4, creates a second, independent tidy data set with the average
##  of each variable for each activity and each subject.

## Taking as raw data "alldatafinal" dataset was created the new data frame
tidy_dataset <- aggregate(.~activity_name + subject_id, alldatafinal, mean)  ## Grouped by subject_id
tidy_dataset <- aggregate(.~subject_id + activity_name, alldatafinal, mean)  ## Grouped by activity_name

##  Ceeating an original file in txt format in the project directory
write.table(tidy_dataset, file = "./Assignment2Data/UCI HAR Dataset/tidy_dataset.txt", row.names = FALSE, col.names = TRUE)