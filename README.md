# GettingCleaningData_CourseProject
This repo contains the necessary files for performing the course project for the Coursera course, 
Getting and Cleaning Data.


Step 1: Merge the training and the test sets to create one data set.

  I performed Step 1 using shell and python scripts.  To generate the merged data set, the user must run the 
  following command in a bash shell:

  sh run_CleanData.sh
  
  This script creates a tidy .csv file that contains the merged dataset called 'cleandata.csv'.

_______________________________________________________________________________________________________
run_CleanData.sh does the following:

1) Unzips getdata-projectfiles-UCI HAR Dataset.zip.
2) Renames the newly created directory to remove the blank spaces.
3) Removes commas, paratheses, and dashes from the feature names.
4) Calls the python script print_table.py which merges all data into txt file.
5) Calls the python script parse_table.py which prints the table in a comma separated format.
6) Finally, tidies up the working directory by removing temporary files and mover the original zip file

Comments are provided within each script describing the individual steps.
________________________________________________________________________________________________________

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
