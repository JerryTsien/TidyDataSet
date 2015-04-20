#Tidy Data Set On Human Activity Recognition Using Smartphones
##Version 1.0

This project is based on the works of SmartLab Laboratory, University of Genova in November 2012 (For details, see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). It can read the data from their experiments on human activity recognition using smartphones, and then make a tidy data set of the means of selected features by different activities and subjects.


##The project includes the following files:

 - __readme.md__

 - __run_analysis.R__: The R code for creating the tidy data set.

 - __codebook.md__: Code book for the study design of the project and the structure of tidy data set.


##Follow these steps to get the final tidy data set:

1. Prepare the input. Download the file _getdata_projectfiles_UCI HAR Dataset.zip_ from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it's contents into the R working directory.

2. Prepare the program. Put the file _run_analysis.R_ in the R working directory too.

3. Execute the program. Use the following commands in RStudio:
```
source("run_analysis.R")
RunAnalysis()
```

4. Get the output. The tidy data set will be the newly-created file named _result.txt_ in the R working directory.
