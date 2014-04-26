ReadMe.md
========================================================

I submitted a single script to accomplish the peer 
This script accomplishes the following tasks
 You should create one R script called run_analysis.R that does the following. 

- 1)  Merges the training and the test sets to create one data set.
- 2)  Extracts only the measurements on the mean and standard deviation for each measurement. 
- 3)	Uses descriptive activity names to name the activities in the data set
- 4)	Appropriately labels the data set with descriptive activity names. 
- 5)	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
In addition it accomplish one additional task, to output the 2 tidy data sets as csv files.

To start off it sets the working directory, this will need to be changed to where you have unzipped the file.  The working directory should be set into the folder UCI HAR Dataset that was in the files that were downloaded and unzipped from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

I use the plyr package in the join so it will need to be downloaded and added to your R libraries.
library(plyr)

I then define where each of the unzipped files are kept, these are stored in variables that will be used later in the code to load these files.

Part 1
The files are then loaded, merged and the supplied column headings are created

Part 2
A data set is created that has 2 rows, the first contains the mean and the second the standard deviation for all the measures.

part 3 and 4 are done at the same time.
This step aligns the measure to what type of activity it was and then assigns a descriptor (walking, laying etc to each record)

 Part 5 
This step creates a tidy dataset that has the mean values for each measure by both subject and activity, I do a bit of clean up on the column names to make the output cleaner so we know what each column represents.
 
After the 5 required steps I have include the code to write 2 csv files one for each dataset we made during the assignment, these are the files I then uploaded to coursera.


