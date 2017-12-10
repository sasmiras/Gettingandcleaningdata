==================================================================
Project to get and clean the data
Version 1.0
==================================================================
Purpose of the project is to get and clean the data. The input data set consist of Human Activity recognition data collected using smart phone.
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the input data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The output file has average of variable(only measurements on mean and standard deviation) for each activity and each subject.

=========================================
Task
=========================================
Create R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


=========================================
The project includes following files:
=========================================
- 'README.txt' - Giving brief about the project
- 'Code Book.txt' - Process and desciption of the data that was collected 
- 'tidy.csv' - The output file with the average of each variable for each activity and each subject
- 'run_analysis.r' - The code to extract the data from different input files, clean and tidy the data and save it to csv file.

