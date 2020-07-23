
# In this function, the Training and Test Data sets contained in 
# "getdata_projectfiles_UCI HAR Dataset.zip" are getting merged and tidied up 
# into a clean data set. The tidied data table is saved as "Data_Combined_And_Tidied.Rda".
# Additionally, a second Data set is created from the tidy data set, which displays the averages 
# of all values in the Data set, grouped by the Label/Activity and the Subject. 
analyseData <- function() {
  
  # getting the names of the features
  feature_labels <- read.table("./UCI HAR Dataset/features.txt")
  feature_labels <- feature_labels[[2]]
  
  # Getting the Training data from the different source files 
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = feature_labels)
  Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
  Subj_train <-  read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  # Getting the test data from the different source files 
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = feature_labels)
  Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  Subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  # Getting the Values of the Activity Factorial as a vector from the source
  activities <- read.table("./UCI HAR Dataset/activity_labels.txt")[[2]]
  
  # Converting the Labels of the Training Set and the Test Set into the respective Factorials
  Y_train_Label_Name <- sapply(Y_train, function(val) activities[val])
  Y_test_Label_Name <- sapply(Y_test, function(val) activities[val])
  
  # Getting the Column Indice, which contain the mean and std values 
  cols <- grep("-(std|mean)[()]", feature_labels)
  
  # Creating a reduced data frame from the training data, that only contains the mean and std columns
  X_train_reduced <- X_train[cols]
  
  # Attaching a column for the respective Labels and SUbjects to the reduced training data 
  X_train_reduced$Label_Activity <- Y_train_Label_Name
  X_train_reduced$Subject <- Subj_train[[1]]
  
  # Creating a reduced data frame from the test data, that only contains the mean and std columns  
  X_test_reduced <- X_test[cols]
  
  # Attaching a column for the respective Labels and SUbjects to the reduced Test data 
  X_test_reduced$Label_Activity <- Y_test_Label_Name
  X_test_reduced$Subject <- Subj_test[[1]]
  
  # Combining the reduced Training Set and the reduced Test Set into one Data Frame
  X_combined <- rbind(X_train_reduced, X_test_reduced)
  
  # Saving the combined Data Frame as a .Rda File
  save(X_combined, file=("./Data_Combined_And_Tidied.Rda") )
  
  # importing the dplyr package 
  library(dplyr)

  
  # Grouping the Data Frame by Subject and Activity and getting the respective means of all variables 
  average_by_subj_and_activity <- X_combined %>% 
    group_by(
      Subject, 
      Label_Activity
    ) %>% summarise_all(mean)
  
  # Saving the Created Grouping to a .Rda file
  save(average_by_subj_and_activity, file=("./Average_By_Subj_and_Activity.Rda") )
 
  # Returning the Grouped, averaged Data Set  
  average_by_subj_and_activity
}


