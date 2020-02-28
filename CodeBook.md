Getting and Celaning Data - Assignment Proejct

Goal: Create one R script called run_analysis.R that does the following.

Tasks
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Variables and coging description:


x_test 		      -> Test set

x_train 	      -> Training set

y_test  	      -> Test labels

y_train 	      -> Training labels

activity_labels	-> Links the class labels with their activity name

subject_test    -> Identifies the subject who performed the test activity

subject_train  	-> Identifies the subject who performed the trsining activity

features      	-> List of all features

test2		        -> Combine all test data in one data frame (y_test, subject_test & x_test)

train2         	-> Combine all training data in one data frame (y_train, subject_train & x_train)

all_data   	    -> Merges both data frames (test2 & train2)

subset2     	  -> Identifies the column names with conditions "mean()" & "std()"

subsetfinal  	  -> Is the data frame with mean and tsd values

all_data2     	-> Merges the primary dataset "all data" with the column containing descriptive labels for all activities

alldatafinal  	-> Delete the activity id from "alldata2" data frame

tidy_dataset   	-> Contains the averge for each variabe, grouping by subject id & activity name
