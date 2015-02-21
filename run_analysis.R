## run_analysis.R
##----------------------------------------------
## OVERVIEW
##----------------------------------------------
## This script performs analysis and cleaning of the wearable computing data collected
## from the UCI HAR project with the Samsung Galaxy S smartphone.  It produces a tidy
## dataset containing the average of each mean() and std() variable for each activity 
## and each subject.
##
## The script performs each of the the following steps:
##      1.  Merges the training and the test sets to create one data set.
##      2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
##      3.  Appropriately labels the data set with descriptive variable names. 
##      4.  Uses descriptive activity names to name the activities in the data set.
##      5.  From the data set in step 4, creates a second, independent tidy data set 
##          with the average of each mean() and std() variable for each activity and 
##          each subject.


##----------------------------------------------
## R PACKAGE REQUIREMENTS
##----------------------------------------------
## This script requires that the following libraries be installed

require("data.table")
require("dplyr")

##----------------------------------------------
## SYSTEM INFORMATION WHEN ANALYSIS WAS PERFORMED
##----------------------------------------------
## Record system information for reproducibility of data

print(Sys.time())
print(Sys.info())
print(sessionInfo())

##----------------------------------------------
## ASSUMPTIONS
##----------------------------------------------
## This script starts with the assumption that the Samsung data is available in
## the working directory in an unzipped 'UCI HAR Dataseet' folder.
## It can be run from the main directory as long as the Samsung data has been 
## extracted to the "UCI HAR Dataset' subdirectory from within your working directory. 


##----------------------------------------------
## INPUT FILES
##----------------------------------------------
# Input files should already be in the "./UCI HAR Dataset"

if (file.exists("./UCI HAR Dataset")) {
        message("Success - The following directories exist")
        lapply(list.dirs("UCI HAR Dataset"), 
               print, quote=FALSE)
        message("In those directories, the following files exist")
        lapply(list.files("UCI HAR Dataset", recursive=TRUE, full.names=TRUE), 
               print, quote=FALSE)
        message("Ready for processing")
} else {
        stop ("'UCI HAR Dataset' directory not found.  Data must be downloaded and extracted first.")
}


##----------------------------------------------
## OUTPUT FILES
##----------------------------------------------
# Output files will get written to the dataDir
dataDir <- "./data"     
if (!file.exists(dataDir)) {
        dir.create(dataDir)
}


##----------------------------------------------
## MAIN PROCESSING
##----------------------------------------------

## ----------------------------------------------------------------------
##      1.  Merge the training and the test sets to create one data set.
## ----------------------------------------------------------------------

print("Processing test Files", quote=FALSE)
sTest <- data.table(read.table("./UCI HAR Dataset/test/subject_test.txt")) 
yTest <- data.table(read.table("./UCI HAR Dataset/test/y_test.txt"))
xTest <- data.table(read.table("./UCI HAR Dataset/test/X_test.txt"))

print("Processing train Files", quote=FALSE)
sTrain <- data.table(read.table("./UCI HAR Dataset/train/subject_train.txt")) 
yTrain <- data.table(read.table("./UCI HAR Dataset/train/y_train.txt"))
xTrain <- data.table(read.table("./UCI HAR Dataset/train/X_train.txt"))

test    <- bind_cols(sTest, yTest, xTest)
train   <- bind_cols(sTrain, yTrain, xTrain)
dataset <- rbind(test, train)

# Cleanup tmp variables from step 1
remove(sTest, yTest, xTest, sTrain, yTrain, xTrain, test, train) 


## ----------------------------------------------------------------------
##      2.  Extract only the measurements on the mean and standard deviation for each measurement. 
## ----------------------------------------------------------------------

print("Processing features file", quote=FALSE)

# read original features.txt data file ... 561 rows... contains Feature Id and Description
features <- data.table(read.table("./UCI HAR Dataset/features.txt"))

# msFeatures will contain vector for 'mean' and 'std' features only
msFeatures <- features[features[,grepl("mean\\(\\)|std\\(\\)", features$V2)]]

#Make new column for 'newFeatureLabel', but preserve the oldName for easy reference back
msFeatures$newFeatureLabel <- msFeatures$V2
msFeatures <- cbind(msFeatures, c(3:68))
setnames(msFeatures, c("featureId", "oldFeatureLabel", "newFeatureLabel", "tidyColumnNumber"))

## Create subset vector to select mean' and std' columns out of the full dataset:
## 1=subject, 2=activity, 3:68=the features with only 'mean' and 'sub'
## Had to use the offset of '+2" to allow for the subject and activity columns.
subsetColumns <- c(1,2,msFeatures[,featureId+2])

## Get subset of the dataset...  Should have 10299 obs (rows) of 68 variables (columns)
dataSubset <- dataset[, subsetColumns]

# Cleanup tmp variables from step 2
remove(dataset, features, subsetColumns) 

## ----------------------------------------------------------------------
##      3.  Appropriately label the data set with descriptive variable names.
## ----------------------------------------------------------------------

# Modify label names to be more readable and descriptive following R standards...
msFeatures$newFeatureLabel <- sub("\\(\\)", "", msFeatures$newFeatureLabel)   # Remove parentheses
msFeatures$newFeatureLabel <- sub("^t", "Time", msFeatures$newFeatureLabel)   # 't' becomes 'Time'
msFeatures$newFeatureLabel <- sub("^f", "Freq", msFeatures$newFeatureLabel)   # 'f' becomes 'Freq'
msFeatures$newFeatureLabel <- sub("Acc", "Accelero", msFeatures$newFeatureLabel) # More meaningful
msFeatures$newFeatureLabel <- gsub("-", "", msFeatures$newFeatureLabel)       # Remove all dashes
msFeatures$newFeatureLabel <- sub("mean", "Mean", msFeatures$newFeatureLabel) # Fix capitalization
msFeatures$newFeatureLabel <- sub("std", "Std", msFeatures$newFeatureLabel)   # Fix capitalization
msFeatures$newFeatureLabel <- sub("BodyBody", "Body", msFeatures$newFeatureLabel)  # Remove typos

# Set Column Heading Names in our dataset
setnames(dataSubset, c("subject", "activity", msFeatures$newFeatureLabel))

# Write the new features file for printing to the CodeBook
# write.table(msFeatures, file="./data/features_mean_std_only_newlabels.txt", row.names=TRUE)

## ----------------------------------------------------------------------
##      4.  Use descriptive activity names instead of numbers in the data set
## ----------------------------------------------------------------------

print("Processing activities file", quote=FALSE)

# Read original activities_labels.txt file...  6 rows... contains Activity Id and Description
activities <- data.table(read.table("./UCI HAR Dataset/activity_labels.txt"))

# Make new column for 'activity', but preserve the oldName for easy reference back
activities$newActivityLabel = activities$V2
activities <- cbind("activitiesRowNumber" <- c(1:6),activities)
setnames(activities, c("activitiesRowNumber", "activityId", "oldActivityLabel", "newActivityLabel"))

# In our dataSubset, replace the numeric values with the verbose descriptions
dataSubset$activity <- activities$newActivityLabel[dataSubset$activity]

# Write the new activities file for printing to the CodeBook
# write.table(activities, file="./data/activities_newlabels.txt", row.names=TRUE)

## ----------------------------------------------------------------------
##      5.  From the data set in step 4, create a second, independent tidy data set 
##      with the mean of each variable for each activity and each subject.
##      This output dataset is a txt file created with write.table() using row.name=FALSE. 
##
##      INSTRUCTOR'S NOTE:  Either a wide or a long form of the data is  
##      acceptable if it meets the tidy data principles of week 1:
##      -- Each variable you measure should be in one column, 
##      -- Each different observation of that variable should be in a different row).
## ----------------------------------------------------------------------

# I have chosen to create the 'wide' form of the tidy dataset.  It is tidy because:
# -- The mean of each measurement has its own column.
# -- There is one line for each observation (Every person was recorded as having done 
# every activity; therefore, when the mean is calculated for each observation type, this 
# dataset will be 180 rows (30 subjects x 6 activities each).)

tidyDataset <- dataSubset %>% 
        group_by(subject,activity) %>% 
        summarise_each(funs(mean))
        
# Prepend 'mean' to each of the column headings for proper labeling.
setnames(tidyDataset, 
         c("subject", "activity", 
           paste("mean",colnames(tidyDataset)[3:68],sep="")))

# Write final tidy txt file; Read it back in for easy viewing 
outFile <- "./data/tidy.txt"
write.table(tidyDataset, file=outFile, row.names=FALSE)
tidy_ds <- read.table(outFile, header=TRUE)

# Finalization statements to print to the screen 
print("-----------------------------------------------------------", quote=FALSE)
print(paste("Tidy output filename is", outFile)                    , quote=FALSE)
print("-----------------------------------------------------------", quote=FALSE)
print("To easily view the output file, do:"                        , quote=FALSE)
print("     tidy_ds <- read.table(filename, header=TRUE)     "     , quote=FALSE)
print("     View(tidy_ds)     "                                    , quote=FALSE)
print("-----------------------------------------------------------", quote=FALSE)
message("Processing complete!")
