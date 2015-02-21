---
title: "ReadMe for Course Project"
author: "c2a0s14"
date: "2015-02-21"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{ReadMe for Course Project}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---
####***Dataset Analysis and Tidying for UCI HAR Dataset* **         
####***Analyzing Wearable Computing Data from Samsung Galaxy S Smartphone* **         

***

## Introduction

The purpose of this course project is to demonstrate our ability to collect, work with, and clean a data set. 

We are using data collected in a UCI HAR study where they studied signals and readings from the accelerometers from the Samsung Galaxy S smartphone.  The data was provided to us via a link on the course website.   Our assignment is to analyze the data and create one R script called run_analysis.R that does the following. 

>1. Merges the training and the test sets to create one data set.      
2. Extracts only the measurements on the mean and standard deviation for each measurement.        
3. Uses descriptive activity names to name the activities in the data set.         
4. Appropriately labels the data set with descriptive variable names.        
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.         

Our goal is to prepare the tidy dataset that can be used for later analysis. This document explains how the script works and how the files are connected, along with explaining what the analysis file did.


***

## ANALYSIS SCRIPT (run_analysis.R)

#### This script starts with the assumption that the Samsung data is available in the working directory in an unzipped 'UCI HAR Dataseet' folder.    

#### This script can be run from the main directory as long as the Samsung data has been extracted to the "UCI HAR Dataset' subdirectory from within your working directory. 


The run_analysis.R script does the following:

1. Merges the training and the test sets to create one data set.    
2. Extracts only the measurements on the mean and standard deviation for each measurement.     
3. Appropriately labels the data set with descriptive variable names.     
4. Uses descriptive activity names to name the activities in the data set.    
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.    

**To accomplish the above summary steps, we performed analysis, modifications, and summaries as follows:**

First, the system information was recorded to provide troubleshooting abilities and reproducibility.

>
SYSTEM INFORMATION WHEN ANALYSIS WAS PERFORMED

> Sys.time()     
[1] "2015-02-21 00:48:58 EST"    

> Sys.info()        
        sysname         release         version        nodename         machine           login          
      "Windows"         "7 x64"    "build 9200" "CHAAASNEWBABY"        "x86-64"       "c2a0s14"              
           user  effective_user        
      "c2a0s14"       "c2a0s14"              
      
> sessionInfo()         
R version 3.1.2 (2014-10-31)      
Platform: x86_64-w64-mingw32/x64 (64-bit)                
locale:                
[1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252             
[3] LC_MONETARY=English_United States.1252 LC_NUMERIC=C                                  
[5] LC_TIME=English_United States.1252                        
attached base packages:            
[1] stats     graphics  grDevices utils     datasets  methods   base                     
other attached packages:           
[1] dplyr_0.4.1      data.table_1.9.4    
loaded via a namespace (and not attached):            
 [1] assertthat_0.1 chron_2.3-45   DBI_0.3.1      magrittr_1.5   parallel_3.1.2 plyr_1.8.1     Rcpp_0.11.4               
 [8] reshape2_1.4.1 stringr_0.6.2  tools_3.1.2                 



Then, an analysis was done to verify the "UCI HAR Dataset" directory existed.  If it existed, this script continued processing assuming the dataset files had all been extracted into that directory.

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
Ready for processing       



A visual analysis was done to verify we had the correct counts of rows and columns for each of the files.  An analysis of the structures of the files is shown in the table below.  

> 

NAME              |      NROW | NCOL         
------------------|-----------|-----                  
subject_test      |     2,947 |    1         
X_test            |     2,947 |  561          
y_test            |     2,947 |    1
subject_train     |     7,352 |    1       
X_train           |     7,352 |  561        
y_train           |     7,352 |    1     
activities        |         6 |    2          
features          |       561 |    2          

**NOTE**:  All files in the "Inertial Signals" folders were determined to be unneeded for this assignment.  

- For the assignment, we were asked to process ONLY the variables measured for mean() and std().  
- After visual analysis of all files, it was determined that none of those files contained variables for mean() or std().  

Once everything checked out visually, then the "test" and "train" files above were merged together to form one united dataset as follows:

>
"Processing test Files"      
sTest <- data.table(read.table("./UCI HAR Dataset/test/subject_test.txt"))       
yTest <- data.table(read.table("./UCI HAR Dataset/test/y_test.txt"))      
xTest <- data.table(read.table("./UCI HAR Dataset/test/X_test.txt"))  

>
"Processing train Files"      
sTrain <- data.table(read.table("./UCI HAR Dataset/train/subject_train.txt"))       
yTrain <- data.table(read.table("./UCI HAR Dataset/train/y_train.txt"))      
xTrain <- data.table(read.table("./UCI HAR Dataset/train/X_train.txt"))  

>
test    <- bind_cols(sTest, yTest, xTest)      
train   <- bind_cols(sTrain, yTrain, xTrain)      
dataset <- rbind(test, train)      

This gave us one big dataset with which to work:

> 

NAME        |    NROW |  NCOL      
------------|---------|------
dataset     |  10,299 |  563 

For this assignment, we were asked to select only the mean() and std() sets of variables.  This totaled to 66 columns of features to select out of the total 561.  

>>
features <- data.table(read.table("./UCI HAR Dataset/features.txt"))       
msFeatures <- features[features[,grepl("mean\\(\\)|std\\(\\)", features$V2)]]

A total of 66 features were selected with a mean() and std() measurement.  With the columns of subject + activity + 66 features, this created our table of 68 columns.

>  

NAME        |    NROW |  NCOL 
------------|---------|------
dataSubset  |  10,299 |  68 

From there, the activity labels and the feature labels were modified to make them more machine-friendly and more readable.  These modifications are extensively detailed in the CodeBook.md and are also commented heavily in the run_analysis.R script.  A brief synopsis follows:

- *Activities* - The activity id was provided for each of the activities measured.  This activity id was replaced with a new label to be more descriptive.  i.e. '1' was changed to 'WALKING'.  The original descriptions  are used as-is (without changes) and carried forward into the new tidy dataset.

- *Features* - - The features selected for this database basically come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  Many features were estimated based upon the signals, and measurements were generated from that.  These features and measurements are all fully documented in the 'CodeBook.md' file, as well as the 'features_info.txt' file included with the raw data files.  

The column headings for all feature ids were then replaced by the descriptive name for that feature.  Furthermore, these descriptive names were modified to be more readable and descriptive in the tidy data set.  The label descriptions (i.e. column headings) have been modified as follows:
Feature names are derived from the supplied features.txt file by applying the following modifications:     

>
+All parentheses ('(' and ')') are removed from the label names.    
+All 't' variables are relabeled as 'Time'    
+All 'f' variables are relabeled as 'Freq'    
+All 'Acc' variables are relabeled as 'Accelero' (for 'Accelerometer' to match format 'Gyro' for 'Gyroscope')    
+All dashes '-' are removed    
+All 'mean' become 'Mean'    
+All 'std' become 'Std'     
+Typographical errors for 'BodyBody...' in features #516-543 have been converted to 'Body'.    


Now the file has been narrowed down to our subset, has been cleaned up, and has relabeled column headings and activity descriptions.  It was then time to calculate the mean for each of the selected features and put the dataset into its tidy form.  I have chosen to use the 'wide' form which allows the mean of each feature to remain in a separate column. 

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
The full structure and description of the output file are included in 'CodeBook.md'.

> outFile <- "./data/tidy.txt"

> write.table(tidyDataset, file=outFile, row.names=FALSE)

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

>**With the above command, make sure to use a capital "V" for "View"**  

***

**NOTE:** The project discussed above contains data collected from the UCI HAR study involving the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

>
Use of this dataset in publications is hereby acknowledged by referencing the following publication:    
- Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.     
- This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.      
- Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


