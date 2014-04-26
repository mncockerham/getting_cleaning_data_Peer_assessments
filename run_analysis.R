## Merge the data sets
## Starting in parent directory that conatins the Test and train sets.

##SET WD. Will need to update to the location you downloaded the file to, the 
##working directory should be set to the folder UCI HAR Dataset in the unzipped data 
setwd("C:\\Users\\Mark\\Documents\\IntroR\\DS\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset")

##Load the following libraries if not available dowload and isntall the package
library(plyr)

##File Location ()
x_test  <- "./test/x_test.txt"
x_train <- "./train/x_train.txt"
y_test  <- "./test/y_test.txt"
y_train <- "./train/y_train.txt"
subject_test <- "./test/subject_test.txt"
subject_train <- "./train/subject_train.txt"
features <- "./features.txt"
activity_labels <- "./activity_labels.txt"

#Store column names into a table, column names will be in column V2
dt_features <- read.table(features, stringsAsFactors= FALSE)

##load X value for test and assign column names
dt_x_test <- read.table(x_test, stringsAsFactors= FALSE,colClasses=c("numeric"))
colnames(dt_x_test) <- dt_features$V2
##load x values for train
dt_x_train <- read.table(x_train, stringsAsFactors= FALSE,colClasses=c("numeric"))
colnames(dt_x_train) <- dt_features$V2

##Load exercise Type
dt_y_test <- read.table(y_test, stringsAsFactors= FALSE)
colnames(dt_y_test) <- "exerciseKey"
dt_y_train <- read.table(y_train, stringsAsFactors= FALSE)
colnames(dt_y_train) <- "exerciseKey"

##Load subject listing
dt_subject_test <- read.table(subject_test, stringsAsFactors= FALSE)
colnames(dt_subject_test) <- "subject"
dt_subject_train <- read.table(subject_train, stringsAsFactors= FALSE)
colnames(dt_subject_train) <- "subject"

##Load activity listing
dt_activity_labels <-  read.table(activity_labels, stringsAsFactors= FALSE)
colnames( dt_activity_labels) <- c("exerciseKey","exerciseActivity")

#PART 1 Merge to a single data set
dt_train <- cbind(dt_subject_train,dt_x_train,dt_y_train)
dt_test <- cbind(dt_subject_test,dt_x_test,dt_y_test)
dt_merged <- rbind(dt_train,dt_test)

##PART 2 Calculate mean for all measurements 
## we know that column1 is the subject and column 563 is the exercies so looking at columns 562 gives us teh 561 measurements :
 
mean <-  sapply(dt_merged[,2:562],mean)
standardDeviation <- sapply(dt_merged[,2:562],sd)
 
##using rbind will append the name of the dataset (mean or standardDeviation to the output lableling the row)
output1 <- rbind(mean,standardDeviation)


##Part 3 and 4 .Uses descriptive activity names to name the activities in the data set (loaded into dt_activity_labels)
##since the column in the loaded dt_activity_labels has the same column name as the column it matches in dt_merged
## We can join them to merge the dataset

dt_name_merged <- join(dt_merged,dt_activity_labels)

#Part 5 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

output2 <- aggregate(dt_name_merged[,2:562],list(dt_name_merged[,1],dt_name_merged[,564]),mean)
##Clean up the output a bit
colnames(output2)[1] <- "subject"
colnames(output2)[2] <-  "activity"

##output files to be checked
write.csv(output1,file="./tidy_data_1_mean_std.txt")
write.csv(output2,file="./tidy_data_2_subject_activity_mean.txt",row.names=FALSE)

