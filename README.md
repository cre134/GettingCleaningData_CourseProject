# GettingCleaningData_CourseProject
This repo contains the necessary files for performing the course project for the Coursera course, 
Getting and Cleaning Data.


Step 1: Merge the training and the test sets to create one data set.

I performed Step 1 using shell and python scripts.  To generate the merged data set, the user must run the 
following command in a bash shell:

sh run_CleanData.sh

This will unzip the data file and create a file named "cleandata.csv".  cleandata.csv is then read into
R and the remaining steps are formed calling run_analysis.R
