
---
title: "Code Book for Course Project"
author: "c2a0s14"
date: "2015-02-21"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Code Book for Course Project}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---

***

####***Dataset Analysis and Tidying for the UCI HAR Dataset* **         
####***Human Activity Recognition Using Smartphones Data Set* **         

***

## Introduction

This CodeBook describes the variables, the data, and any transformations or work performed to clean up the data for the *Human Activity Recognition Using Smartphones Data Set*.


***

## STUDY DESIGN - RAW DATA Used For The Analysis

The data was downloaded on February 5, 2015, at 1:23pm, via the following Coursera website link:

>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The above zipped file contains data collected from the UCI HAR study involving the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

>
Use of this dataset in publications is hereby acknowledged by referencing the following publication:    
- Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.     
- This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.      
- Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


### Excerpt from the original "README.txt" regarding the setup of the study...
Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Excerpt from the original "README.txt" regarding the features that are supplied...
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

**For each record it is provided:**    

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


### The dataset includes the following files:

* 'README.txt': The original README file which describes the experiment, variables, measurements, and processes involved in getting the raw data that was transferred to us.

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.  
+A 561-feature vector with time and frequency domain variables.     
+Each feature vector is a row on the text file containing the featureId and featureLabel.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'train/subject_train.txt': Subject identifies.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'test/subject_test.txt': Subject identifiers.


There are also files available in the "Inertial Signals" subfolders for the train and test data; however, they were not included in this analysis since they are not a factor for the mean() and std() measurements. See './UCI HAR Dataset/features_info.txt' for more info on these files.

### The dataset files have been extracted into a "/UCI HAR Dataset" directory from the working directory.

>
Success - The following directories exist       
[1] UCI HAR Dataset        
[1] UCI HAR Dataset/test        
[1] UCI HAR Dataset/test/Inertial Signals         
[1] UCI HAR Dataset/train          
[1] UCI HAR Dataset/train/Inertial Signals           

>
In those directories, the following files exist         
[1] UCI HAR Dataset/activity_labels.txt           
[1] UCI HAR Dataset/features.txt       
[1] UCI HAR Dataset/features_info.txt          
[1] UCI HAR Dataset/README.txt           
[1] UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt      
[1] UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt     
[1] UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt       
[1] UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt       
[1] UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt         
[1] UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt       
[1] UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt                    
[1] UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt       
[1] UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt       
[1] UCI HAR Dataset/test/subject_test.txt       
[1] UCI HAR Dataset/test/X_test.txt       
[1] UCI HAR Dataset/test/y_test.txt       
[1] UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt       
[1] UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt       
[1] UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt       
[1] UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt       
[1] UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt       
[1] UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt       
[1] UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt       
[1] UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt       
[1] UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt       
[1] UCI HAR Dataset/train/subject_train.txt       
[1] UCI HAR Dataset/train/X_train.txt       
[1] UCI HAR Dataset/train/y_train.txt                    


**NOTE**:  All files in the "Inertial Signals" folders were determined to be unneeded for this assignment.  
- For the assignment, we were asked to process ONLY the variables measured for mean() and std().  
- After visual analysis of all files, it was determined that none of those files contained variables for mean() or std().  

***

## CODEBOOK - DATA DICTIONARY

**SUBJECT**

- *Type:* Integer     
- *Values:* 1 through 30   
- *Missing Values (NAs):* None.  All fields have been populated with valid data.      
- *Description:* The number of each subject (participant) in the study was provided to us.  There was no link available to identify personal information for the subjects; therefore, each subject remains labeled the same as it was provided to us (without change).


**ACTIVITY**

- *Type:* Character String      
- *Values:*  Six unique values as shown in the table below.      
- *Missing Values (NAs):* None.  All fields have been populated with valid data.      
- *Description:* The activity id was provided for each of the activities measured.  This activity id was replaced with a new label to be more descriptive.  i.e. '1' was changed to 'WALKING'.  The original descriptions  are used as-is (without changes) and carried forward into the new tidy dataset.


| activitiesRowNumber| activityId|oldActivityLabel   |newActivityLabel   |
|-------------------:|----------:|:------------------|:------------------|
|                   1|          1|WALKING            |WALKING            |
|                   2|          2|WALKING_UPSTAIRS   |WALKING_UPSTAIRS   |
|                   3|          3|WALKING_DOWNSTAIRS |WALKING_DOWNSTAIRS |
|                   4|          4|SITTING            |SITTING            |
|                   5|          5|STANDING           |STANDING           |
|                   6|          6|LAYING             |LAYING             |


**FEATURES**

- *Type:* Numeric         
- *Values:*  - All features and associated calculated means are normalized and bounded within [-1,1].    
- *Missing Values (NAs):* None.  All fields have been populated with valid data.      
- *Description:* Following is an excerpt from the 'features_info.txt' file describing the features in the file.  

>
- The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
- Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
- Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
- These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.        
tBodyAcc-XYZ         
tGravityAcc-XYZ               
tBodyAccJerk-XYZ         
tBodyGyro-XYZ         
tBodyGyroJerk-XYZ         
tBodyAccMag         
tGravityAccMag         
tBodyAccJerkMag         
tBodyGyroMag         
tBodyGyroJerkMag         
fBodyAcc-XYZ         
fBodyAccJerk-XYZ         
fBodyGyro-XYZ         
fBodyAccMag         
fBodyAccJerkMag         
fBodyGyroMag         
fBodyGyroJerkMag   
The set of variables that were estimated from these signals are:  
>**mean(): Mean value**           
>**std(): Standard deviation**   
>...and many others. The complete list of variables of each feature vector is available in 'features.txt'


For this assignment, we were asked to select only the mean() and std() sets of variables.  This totaled to 66 columns of features to select.  

>>
features <- data.table(read.table("./UCI HAR Dataset/features.txt"))       
msFeatures <- features[features[,grepl("mean\\(\\)|std\\(\\)", features$V2)]]

A total of 66 features were selected with a mean() and std() measurement.  With the columns of subject + activity + 66 features, this created our table of 68 columns.

>  

NAME        |    NROW |  NCOL 
------------|---------|------
dataSubset  |  10,299 |  68 

The column headings for all feature ids were then replaced by the descriptive name for that feature.  Furthermore, these descriptive names were modified to be more readable in the tidy data set.  The label descriptions (i.e. column headings) have been modified as follows:
Feature names are derived from the supplied features.txt file by applying the following modifications:     

- All parentheses ('(' and ')') are removed from the label names.    
- All 't' variables are relabeled as 'Time'    
- All 'f' variables are relabeled as 'Freq'    
- All 'Acc' variables are relabeled as 'Accelero' (for 'Accelerometer' to match format 'Gyro' for 'Gyroscope')    
- All dashes '-' are removed    
- All 'mean' become 'Mean'    
- All 'std' become 'Std'     
- Typographical errors for 'BodyBody...' in features #516-543 have been converted to 'Body'.    

The new labels, matched with their respective old labels and index numbers, are shown below:


| featureId|oldFeatureLabel             |newFeatureLabel             | tidyColumnNumber|
|---------:|:---------------------------|:---------------------------|----------------:|
|         1|tBodyAcc-mean()-X           |TimeBodyAcceleroMeanX       |                3|
|         2|tBodyAcc-mean()-Y           |TimeBodyAcceleroMeanY       |                4|
|         3|tBodyAcc-mean()-Z           |TimeBodyAcceleroMeanZ       |                5|
|         4|tBodyAcc-std()-X            |TimeBodyAcceleroStdX        |                6|
|         5|tBodyAcc-std()-Y            |TimeBodyAcceleroStdY        |                7|
|         6|tBodyAcc-std()-Z            |TimeBodyAcceleroStdZ        |                8|
|        41|tGravityAcc-mean()-X        |TimeGravityAcceleroMeanX    |                9|
|        42|tGravityAcc-mean()-Y        |TimeGravityAcceleroMeanY    |               10|
|        43|tGravityAcc-mean()-Z        |TimeGravityAcceleroMeanZ    |               11|
|        44|tGravityAcc-std()-X         |TimeGravityAcceleroStdX     |               12|
|        45|tGravityAcc-std()-Y         |TimeGravityAcceleroStdY     |               13|
|        46|tGravityAcc-std()-Z         |TimeGravityAcceleroStdZ     |               14|
|        81|tBodyAccJerk-mean()-X       |TimeBodyAcceleroJerkMeanX   |               15|
|        82|tBodyAccJerk-mean()-Y       |TimeBodyAcceleroJerkMeanY   |               16|
|        83|tBodyAccJerk-mean()-Z       |TimeBodyAcceleroJerkMeanZ   |               17|
|        84|tBodyAccJerk-std()-X        |TimeBodyAcceleroJerkStdX    |               18|
|        85|tBodyAccJerk-std()-Y        |TimeBodyAcceleroJerkStdY    |               19|
|        86|tBodyAccJerk-std()-Z        |TimeBodyAcceleroJerkStdZ    |               20|
|       121|tBodyGyro-mean()-X          |TimeBodyGyroMeanX           |               21|
|       122|tBodyGyro-mean()-Y          |TimeBodyGyroMeanY           |               22|
|       123|tBodyGyro-mean()-Z          |TimeBodyGyroMeanZ           |               23|
|       124|tBodyGyro-std()-X           |TimeBodyGyroStdX            |               24|
|       125|tBodyGyro-std()-Y           |TimeBodyGyroStdY            |               25|
|       126|tBodyGyro-std()-Z           |TimeBodyGyroStdZ            |               26|
|       161|tBodyGyroJerk-mean()-X      |TimeBodyGyroJerkMeanX       |               27|
|       162|tBodyGyroJerk-mean()-Y      |TimeBodyGyroJerkMeanY       |               28|
|       163|tBodyGyroJerk-mean()-Z      |TimeBodyGyroJerkMeanZ       |               29|
|       164|tBodyGyroJerk-std()-X       |TimeBodyGyroJerkStdX        |               30|
|       165|tBodyGyroJerk-std()-Y       |TimeBodyGyroJerkStdY        |               31|
|       166|tBodyGyroJerk-std()-Z       |TimeBodyGyroJerkStdZ        |               32|
|       201|tBodyAccMag-mean()          |TimeBodyAcceleroMagMean     |               33|
|       202|tBodyAccMag-std()           |TimeBodyAcceleroMagStd      |               34|
|       214|tGravityAccMag-mean()       |TimeGravityAcceleroMagMean  |               35|
|       215|tGravityAccMag-std()        |TimeGravityAcceleroMagStd   |               36|
|       227|tBodyAccJerkMag-mean()      |TimeBodyAcceleroJerkMagMean |               37|
|       228|tBodyAccJerkMag-std()       |TimeBodyAcceleroJerkMagStd  |               38|
|       240|tBodyGyroMag-mean()         |TimeBodyGyroMagMean         |               39|
|       241|tBodyGyroMag-std()          |TimeBodyGyroMagStd          |               40|
|       253|tBodyGyroJerkMag-mean()     |TimeBodyGyroJerkMagMean     |               41|
|       254|tBodyGyroJerkMag-std()      |TimeBodyGyroJerkMagStd      |               42|
|       266|fBodyAcc-mean()-X           |FreqBodyAcceleroMeanX       |               43|
|       267|fBodyAcc-mean()-Y           |FreqBodyAcceleroMeanY       |               44|
|       268|fBodyAcc-mean()-Z           |FreqBodyAcceleroMeanZ       |               45|
|       269|fBodyAcc-std()-X            |FreqBodyAcceleroStdX        |               46|
|       270|fBodyAcc-std()-Y            |FreqBodyAcceleroStdY        |               47|
|       271|fBodyAcc-std()-Z            |FreqBodyAcceleroStdZ        |               48|
|       345|fBodyAccJerk-mean()-X       |FreqBodyAcceleroJerkMeanX   |               49|
|       346|fBodyAccJerk-mean()-Y       |FreqBodyAcceleroJerkMeanY   |               50|
|       347|fBodyAccJerk-mean()-Z       |FreqBodyAcceleroJerkMeanZ   |               51|
|       348|fBodyAccJerk-std()-X        |FreqBodyAcceleroJerkStdX    |               52|
|       349|fBodyAccJerk-std()-Y        |FreqBodyAcceleroJerkStdY    |               53|
|       350|fBodyAccJerk-std()-Z        |FreqBodyAcceleroJerkStdZ    |               54|
|       424|fBodyGyro-mean()-X          |FreqBodyGyroMeanX           |               55|
|       425|fBodyGyro-mean()-Y          |FreqBodyGyroMeanY           |               56|
|       426|fBodyGyro-mean()-Z          |FreqBodyGyroMeanZ           |               57|
|       427|fBodyGyro-std()-X           |FreqBodyGyroStdX            |               58|
|       428|fBodyGyro-std()-Y           |FreqBodyGyroStdY            |               59|
|       429|fBodyGyro-std()-Z           |FreqBodyGyroStdZ            |               60|
|       503|fBodyAccMag-mean()          |FreqBodyAcceleroMagMean     |               61|
|       504|fBodyAccMag-std()           |FreqBodyAcceleroMagStd      |               62|
|       516|fBodyBodyAccJerkMag-mean()  |FreqBodyAcceleroJerkMagMean |               63|
|       517|fBodyBodyAccJerkMag-std()   |FreqBodyAcceleroJerkMagStd  |               64|
|       529|fBodyBodyGyroMag-mean()     |FreqBodyGyroMagMean         |               65|
|       530|fBodyBodyGyroMag-std()      |FreqBodyGyroMagStd          |               66|
|       542|fBodyBodyGyroJerkMag-mean() |FreqBodyGyroJerkMagMean     |               67|
|       543|fBodyBodyGyroJerkMag-std()  |FreqBodyGyroJerkMagStd      |               68|

***

## OUTPUT FILE

Before writing the tidy output file, the entries were grouped by subject+activity, and the mean was calculated for each of the selected features:

> tidyDataset <- dataSubset %>%       
        group_by(subject,activity) %>%       
        summarise_each(funs(mean))       
        
Then, column headings were again modified to indicate that the value is actually the "mean" of the selected variables.

> setnames(tidyDataset,     
         c("subject", "activity",     
           paste("mean",colnames(tidyDataset)[3:68],sep="")))      

**The output files have been created in a data directory from the working directory.**      

The full tidy dataset is written to "./data/tidy.txt".       
The column names are written to the file.          
The row names are NOT written to the file.    

> outFile <- "./data/tidy.txt"

> write.table(tidyDataset, file=outFile, row.names=FALSE)

The structure of the data for the output file is as follows:

> str(tidy_ds)

- 'data.frame':        180 obs. of  68 variables:     

1. subject                        : int  1 1 1 1 1 1 2 2 2 2 ...    
2. activity                       : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...     
3. meanTimeBodyAcceleroMeanX      : num  0.222 0.261 0.279 0.277 0.289 ...
4. meanTimeBodyAcceleroMeanY      : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
5. meanTimeBodyAcceleroMeanZ      : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
6. meanTimeBodyAcceleroStdX       : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
7. meanTimeBodyAcceleroStdY       : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
8. meanTimeBodyAcceleroStdZ       : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
9. meanTimeGravityAcceleroMeanX   : num  -0.249 0.832 0.943 0.935 0.932 ...
10. meanTimeGravityAcceleroMeanY   : num  0.706 0.204 -0.273 -0.282 -0.267 ...
11. meanTimeGravityAcceleroMeanZ   : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
12. meanTimeGravityAcceleroStdX    : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
13. meanTimeGravityAcceleroStdY    : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
14. meanTimeGravityAcceleroStdZ    : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
15. meanTimeBodyAcceleroJerkMeanX  : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
16. meanTimeBodyAcceleroJerkMeanY  : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
17. meanTimeBodyAcceleroJerkMeanZ  : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
18. meanTimeBodyAcceleroJerkStdX   : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
19. meanTimeBodyAcceleroJerkStdY   : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
20. meanTimeBodyAcceleroJerkStdZ   : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
21. meanTimeBodyGyroMeanX          : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
22. meanTimeBodyGyroMeanY          : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
23. meanTimeBodyGyroMeanZ          : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
24. meanTimeBodyGyroStdX           : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
25. meanTimeBodyGyroStdY           : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
26. meanTimeBodyGyroStdZ           : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
27. meanTimeBodyGyroJerkMeanX      : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
28. meanTimeBodyGyroJerkMeanY      : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
29. meanTimeBodyGyroJerkMeanZ      : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
30. meanTimeBodyGyroJerkStdX       : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
31. meanTimeBodyGyroJerkStdY       : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
32. meanTimeBodyGyroJerkStdZ       : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
33. meanTimeBodyAcceleroMagMean    : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
34. meanTimeBodyAcceleroMagStd     : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
35. meanTimeGravityAcceleroMagMean : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
36. meanTimeGravityAcceleroMagStd  : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
37. meanTimeBodyAcceleroJerkMagMean: num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
38. meanTimeBodyAcceleroJerkMagStd : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
39. meanTimeBodyGyroMagMean        : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
40. meanTimeBodyGyroMagStd         : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
41. meanTimeBodyGyroJerkMagMean    : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
42. meanTimeBodyGyroJerkMagStd     : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
43. meanFreqBodyAcceleroMeanX      : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
44. meanFreqBodyAcceleroMeanY      : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
45. meanFreqBodyAcceleroMeanZ      : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
46. meanFreqBodyAcceleroStdX       : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
47. meanFreqBodyAcceleroStdY       : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
48. meanFreqBodyAcceleroStdZ       : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
49. meanFreqBodyAcceleroJerkMeanX  : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
50. meanFreqBodyAcceleroJerkMeanY  : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
51. meanFreqBodyAcceleroJerkMeanZ  : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
52. meanFreqBodyAcceleroJerkStdX   : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
53. meanFreqBodyAcceleroJerkStdY   : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
54. meanFreqBodyAcceleroJerkStdZ   : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
55. meanFreqBodyGyroMeanX          : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
56. meanFreqBodyGyroMeanY          : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
57. meanFreqBodyGyroMeanZ          : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
58. meanFreqBodyGyroStdX           : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
59. meanFreqBodyGyroStdY           : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
60. meanFreqBodyGyroStdZ           : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
61. meanFreqBodyAcceleroMagMean    : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
62. meanFreqBodyAcceleroMagStd     : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
63. meanFreqBodyAcceleroJerkMagMean: num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
64. meanFreqBodyAcceleroJerkMagStd : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
65. meanFreqBodyGyroMagMean        : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
66. meanFreqBodyGyroMagStd         : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
67. meanFreqBodyGyroJerkMagMean    : num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
68. meanFreqBodyGyroJerkMagStd     : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...

To show the dataset in its wide tidy form, I am printing the first few rows and columns here.  This demonstrates that there is only one observation for each row (observation=each subject/activity combination). Additionally, there is only one variable per column (variable=the mean of each measurement selected).  Per our instructions, this meets the definition of the wide form for a tidy dataset.


```r
knitr::kable(read.table("./data/tidy.txt", header=TRUE, nrows=18)[1:12])
```



| subject|activity           | meanTimeBodyAcceleroMeanX| meanTimeBodyAcceleroMeanY| meanTimeBodyAcceleroMeanZ| meanTimeBodyAcceleroStdX| meanTimeBodyAcceleroStdY| meanTimeBodyAcceleroStdZ| meanTimeGravityAcceleroMeanX| meanTimeGravityAcceleroMeanY| meanTimeGravityAcceleroMeanZ| meanTimeGravityAcceleroStdX|
|-------:|:------------------|-------------------------:|-------------------------:|-------------------------:|------------------------:|------------------------:|------------------------:|----------------------------:|----------------------------:|----------------------------:|---------------------------:|
|       1|LAYING             |                 0.2215982|                -0.0405140|                -0.1132036|               -0.9280565|               -0.8368274|               -0.8260614|                   -0.2488818|                    0.7055498|                    0.4458177|                  -0.8968300|
|       1|SITTING            |                 0.2612376|                -0.0013083|                -0.1045442|               -0.9772290|               -0.9226186|               -0.9395863|                    0.8315099|                    0.2044116|                    0.3320437|                  -0.9684571|
|       1|STANDING           |                 0.2789176|                -0.0161376|                -0.1106018|               -0.9957599|               -0.9731901|               -0.9797759|                    0.9429520|                   -0.2729838|                    0.0134906|                  -0.9937630|
|       1|WALKING            |                 0.2773308|                -0.0173838|                -0.1111481|               -0.2837403|                0.1144613|               -0.2600279|                    0.9352232|                   -0.2821650|                   -0.0681029|                  -0.9766096|
|       1|WALKING_DOWNSTAIRS |                 0.2891883|                -0.0099185|                -0.1075662|                0.0300353|               -0.0319359|               -0.2304342|                    0.9318744|                   -0.2666103|                   -0.0621200|                  -0.9505598|
|       1|WALKING_UPSTAIRS   |                 0.2554617|                -0.0239531|                -0.0973020|               -0.3547080|               -0.0023203|               -0.0194792|                    0.8933511|                   -0.3621534|                   -0.0754029|                  -0.9563670|
|       2|LAYING             |                 0.2813734|                -0.0181587|                -0.1072456|               -0.9740595|               -0.9802774|               -0.9842333|                   -0.5097542|                    0.7525366|                    0.6468349|                  -0.9590144|
|       2|SITTING            |                 0.2770874|                -0.0156880|                -0.1092183|               -0.9868223|               -0.9507045|               -0.9598282|                    0.9404773|                   -0.1056300|                    0.1987268|                  -0.9799888|
|       2|STANDING           |                 0.2779115|                -0.0184208|                -0.1059085|               -0.9872719|               -0.9573050|               -0.9497419|                    0.8969286|                   -0.3700627|                    0.1297472|                  -0.9866858|
|       2|WALKING            |                 0.2764266|                -0.0185949|                -0.1055004|               -0.4236428|               -0.0780913|               -0.4252575|                    0.9130173|                   -0.3466071|                    0.0847271|                  -0.9726932|
|       2|WALKING_DOWNSTAIRS |                 0.2776153|                -0.0226614|                -0.1168129|                0.0463667|                0.2628818|               -0.1028379|                    0.8618313|                   -0.3257801|                   -0.0438890|                  -0.9403618|
|       2|WALKING_UPSTAIRS   |                 0.2471648|                -0.0214121|                -0.1525139|               -0.3043764|                0.1080273|               -0.1121210|                    0.7907174|                   -0.4162149|                   -0.1958882|                  -0.9344077|
|       3|LAYING             |                 0.2755169|                -0.0189557|                -0.1013005|               -0.9827766|               -0.9620575|               -0.9636910|                   -0.2417585|                    0.8370321|                    0.4887032|                  -0.9825122|
|       3|SITTING            |                 0.2571976|                -0.0035030|                -0.0983579|               -0.9710101|               -0.8566178|               -0.8751102|                    0.9010990|                    0.1273034|                    0.1390206|                  -0.9573245|
|       3|STANDING           |                 0.2800465|                -0.0143377|                -0.1016217|               -0.9667425|               -0.8934493|               -0.9114190|                    0.9350308|                   -0.3017351|                    0.0247631|                  -0.9820204|
|       3|WALKING            |                 0.2755675|                -0.0171768|                -0.1126749|               -0.3603567|               -0.0699141|               -0.3874120|                    0.9365067|                   -0.2619864|                   -0.1381079|                  -0.9777716|
|       3|WALKING_DOWNSTAIRS |                 0.2924235|                -0.0193554|                -0.1161398|               -0.0574100|               -0.0331504|               -0.3622402|                    0.9390578|                   -0.2288292|                   -0.1023528|                  -0.9500611|
|       3|WALKING_UPSTAIRS   |                 0.2608199|                -0.0324109|                -0.1100649|               -0.3131234|                0.0116281|               -0.3697546|                    0.8835334|                   -0.3828512|                   -0.1629440|                  -0.9440408|

To easily view the full output file, use the following commands:

> tidy_ds <- read.table("./data/tidy.txt", header=TRUE)

> View(tidy_ds)      
Note:  With the above command, make sure to use a capital "V" for "View"   

*** 

**NOTE:** The project discussed above contains data collected from the UCI HAR study involving the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

>
Use of this dataset in publications is hereby acknowledged by referencing the following publication:    
- Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.     
- This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.      
- Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



