# Getting-and-cleaning-data-course-project

This repo consist of: R code, documentation files and final result for Getting and Cleaning Data Course Project - Data Science Specialization, held by John Hopkins University in Coursera. 

### Overview
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### About data
The data that will be collected is wearable computing. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Project Summary
Create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Files
You will find 3 more files in this repo.
1. codebook.md file will provide detail information about variables and data transformation that was performed to clean the data.
2. run_analysis.R file will provide the R Code from downloading the files from source until creating a tidy set data file.
3. tidydata.txt was final result from run_analysis.R and result of this project that provide a tidy data set ready to analyze.
