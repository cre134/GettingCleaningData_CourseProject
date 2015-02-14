# GettingCleaningData_CourseProject
This repo contains the necessary files for performing the course project for 'Getting and Cleaning Data'.


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

6) Finally, tidies up the working directory by removing temporary files and moving the original zip file.

Comments are provided within each script describing the individual steps.
________________________________________________________________________________________________________

Step 2 - 5: run_analysis.R  performs the following steps 

First, run_analysis.R reads in the merged dataset, 'cleandata.csv', created in Step 1.  Then it  
converts the numberic exercise codes into strings describing the exercise.   Then the column names 
are scanned for the key words 'mean' and 'std' and stores the column numbers in a vector named 'trimmedset'. 
The vector trimmedset is used to create a parsed data set containing only columns with the mean (46 columns) 
and standard deviation (33 columns).  The parsed data set is stored into a new data.frame called 
'parse_totalset' with dimensions 10299x81.  'parse_totalset' is then grouped by subject/participant 
followed by exercise.  summarize is used on each column to report the average of each average/std measurement.

The output is a matrix containing 181 rows and 81 columns.
