CodeBook.md
========================================================

a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called 

The raw supplied files in the UCI HAR Dataset

The files are loaded into the following raw data variables

dt_x_test: a collection of 561 measurements taken for each observation that were assigned to the test set

dt_x_train: a collection of 561 measurements taken for each observation that were assigned to the training set

dt_y_test : A listing for the test set of what type of activity is being done while the measurement is taken

dt_y_train: A listing for the training set of what type of activity is being done while the measurement is taken

dt_subject_test: A listinf for the test data for wich of the 30 subjects the measurements apply to 

dt_subject_train: A listing for the training set of  individual one of the 30 subjects the obsrvation applies to 

dt_features: list of the 561 captured values for each observation (in the x test and train accounts)

dt_activity_labels: The human readable activity levels



Manipulation on the initial loaded variables this is done for ease of understanding and simplification of later code

dt_x_test:  using the dt_features$V2 data set the columns are renamed to reflect what information is in the file

dt_x_train:   using the dt_features$V2 data set the columns are renamed to reflect what information is in the file 

dt_y_test: change the single column name to exerciseKey

dt_x_test: change the single column name to exerciseKey

dt_subject_test: Change the sinlge column name to subject

dt_subject_train: Change the sinlge column name to subject

dt_activity_labels: rename the first column to exerciseKey and secound column to exerciseActivity


Merging of Data to intermediate objects (These two merges are done by column

dt_train : This dataset contains the column for both dt_subject_train and dt_subject_train

dt_test : This dataset contains the columns for both dt_subject_test and dt_subject_test

The merged datasets are then merged at the row level combining both the Training and Test datasets

dt_merged:  combines dt_train dt_test 

mean: contains the mean value for all the raw measurments collected  (561 values)
standardDeviation: contains the standard deviation value for all the raw measurments collected  (561 values)
 
 
output1: a tidy dataset composed of the mean and standard deviation measurements of the combined dataset (dt_merged)

dt_name_merged:   adds an additional row to the dt_merged dataset, this is the name of the activity this is done using the plyr package and joining on exerciseKey

output2:  This is a the final output where we calcualte the mean for each subject and activity for all 561 observations.

Before outputing a small amount of claen up is done on column names as the groupby.1 and groupby.2 output of the aggrigate function is not describtive. the are renamed
output2 column 1 is changed to  "subject"
output2 column 1 is changed to "activity"

Both output1 and output2 are exported as csv files.
since the rownames are not needed in output2 they are suppresse by the row.names=FALSE arguement
