# Before running this R script, please ensure that the raw data is
# already unzipped into the working directory.

RunAnalysis <- function() {

  # Prepare the names of the needed files.
  datafolder <- "UCI HAR Dataset"
  datafile <- c("activity_labels.txt", "features.txt",
                "test\\subject_test.txt", "test\\X_test.txt", "test\\y_test.txt",
                "train\\subject_train.txt", "train\\X_train.txt", "train\\y_train.txt")
  datafile <- paste(datafolder, "\\", datafile, sep = "")
  
  # Select only measurements on mean and std.
  selection <- c(1:6, 41:46, 81:86, 121:126, 161:166,
      201:202, 214:215, 227:228, 240:241, 253:254, 266:271,
      345:350, 424:429, 503:504, 516:517, 529:530, 542:543)
  
  features <- read.table(datafile[2])[[2]]
  features <- features[selection]
  
  # Optional cosmetic changes to variables names.
  features <- gsub("\\(", "", features)
  features <- gsub("\\)", "", features)
  features <- gsub("-", ".", features)
  features <- tolower(features)
  
  # Merge training/test sets to create one data set.
  x <- rbind(read.table(datafile[4]),
             read.table(datafile[7]))
  x <- x[selection]
  
  # Label the data set with descriptive variable names.
  names(x) <- features
  
  y <- rbind(read.table(datafile[5]),
             read.table(datafile[8]))
  x$activity <- y[[1]]
  subject <- rbind(read.table(datafile[3]),
                   read.table(datafile[6]))
  x$subject <- subject[[1]]

  # Create the final data set.
  library(plyr)
  result <- ddply(x, .(activity, subject), numcolwise(mean))

  # Alternative way to Create an identical final data set.
  # result <- aggregate(x[, -c(ncol(x) - 1, ncol(x))], list(x$activity, x$subject), mean)
  # result <- result[order(result[1], result[2]),]
  # names(result)[1:2] <- c("activity", "subject")
  # row.names(result) <- NULL
  
  # Use descriptive activity names to name the activities in the data set.
  activity <- read.table(datafile[1])
  result$activity <- factor(result$activity, levels = activity[[1]], labels = activity[[2]])
  
  write.table(result, file = "result.txt", row.names = FALSE)
}
