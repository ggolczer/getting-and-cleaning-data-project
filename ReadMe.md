# Getting & Cleaning Data Project

Data Science Specialization (Coursera) - Course: Getting and Cleaning Data course project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This repository contains the following files:

README.md, this file, which provides an overview of the data set and how it was created. tidy_data.txt, which contains the data set. CodeBook.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data). run_analysis.R, the R script that was used to create the data set (see the Creating the data set section below)

# Study design

The source data set that this project was based on was obtained from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#), which describes how the data was initially collected.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Creating the Data Set

The R script run_analysis.R can be used to merge all data set and create a new tidy dataset. First, it retrieves the source data set, unzips, load and transforms it to produce the final data set by implementing the following steps (see the CodeBook.md and script for details):
  - If it doesn't exists already, download and unzip       source data
  - Load/read data into R
  - Merge the training and the test sets to create one data set
  - Extract only the measurements on the mean and standard deviation for each measurement
  - Use descriptive activity names to name the activities in the data set
  - Appropriately label the data set with descriptive variable names
  - Create a second, independent tidy set with the average of each variable for each activity and each subject
  - Write the data set to the tidy_data.csv file

The tidy_data.csv in this repository was created by running the run_analysis.R script using R version 3.4.1 on Windows 10 64-bit.
