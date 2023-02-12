Description of the variables and data:

There are 81 variables from which the first 2 correspond to the "subject_id" from which the report was taken and the "activity_label" which corresponds to the activity that the subject was performing (i.e: LAYING, SITTING, etc.). In total there are 30 subjects and 6 activites. 
The other 79 variables correspond to the average of that variable for each activity and each subject.
The 79 variables were extracted from the main dataset which contained 561 variables in total.
The selection was made based on those that were mean and standard deviation for each measurement


Transformations performed to clean up the data:

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3) Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names. 

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This "tidy_data" in included in the repo.


