Getting and Cleaning Data Project README
by Donald DiJacklin
----------------------------------------

Contained in this Repository are 6 files besides this one.
These files are:
1. CodeBook.md: In which the datasets are desribed, and goes over
the processing of them.

2. run_analysis.R: In which I take the information available at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
(beware: large file, took forever to download) and extract the full
dataset, process it to make it "tidy", and save the result into
two different forms at two different points. Processing the data
included: taking the feature vector and turning it into the names
of the columns, extracting the columns with the regular expressions
"mean" or "std", adding the subject numbers with the column name
"Subject", adding the column "Activity" with the name of the activity
instead of the number of the activity which was given, and taking the
mean of each column of feature variables grouped by "Subject", and 
"Activity".

3. data_set.csv: The full dataset with only the features that contain
the regular expressions "mean" or "std". 10299 rows, and 81 columns.
Opens in Microsoft Excel, or can be read into R with read.csv

4. data_set.R: The full dataset with only the features that contain
the regular expressions "mean" or "std". 10299 rows, and 81 columns.
Yes it's the same thing as data_set.csv, but the instructions were
unclear how they wanted it. Can be opened in R using load.

5. tidy_data.csv: The "tidy" dataset, which is the full dataset 
condensed into the means of each feature variable grouped by "Subject"
and "Activity". 30 subjects x 6 activities = 180 rows, and 81 columns.
Opens in Microsoft Excel, or can be read into R with read.csv

6. tidy_data.R: The "tidy" dataset, which is the full dataset 
condensed into the means of each feature variable grouped by "Subject"
and "Activity". 30 subjects x 6 activities = 180 rows, and 81 columns.
Yes it's the same thing as tidy_data.csv, but the instructions were
unclear how they wanted it. Can be opened in R using load.