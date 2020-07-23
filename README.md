# Getting_and_Cleaning_Data
Repository for the course Project: Getting and Cleaning Data

The Aim of this Project is to provide cleaned Data Sets from the Raw Data of:
"Human Activity Recognition Using Smartphones Data Set" Provided by the Center for Machine Learning and and Intelliigent Systems. 

## Getting the raw Data
The Raw Dataset can be found in "./getdata_projectfiles_UCI HAR Dataset.zip"
Aswell as https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

1. The first step necessary For the Project is to get the compressed Dataset from the above sources and unpack it into the root folder of this project as "UCI HAR Dataset"

## The Analysis 
For the Analysis of the raw data, the function analyseData()  in "./run_analysis.R" is used. The function loads all necessary raw Data from the Folder you created in 1. It then cleans the data and reduces them into the mean and standard deviation values of each Variable.

## The Tidy Datasets

The tidied Datasets produced by analyseData() are: 

###Data_Combined_And_Tidied.Rda 
This R Data.Frame Object contains the merged Data of the Training and Test Sets. It also Combined the X Values of each trial/observation with their respective Label, provided in the Y_(...).txt files.
Additionally, the contained Variables of the raw Data got reduced to only the means and standard deviations in thiis Dataset. 

###Average_By_Subj_and_Activity.Rda
This is an R Object, created with the "deplyr" package. THrough the group_by() function, The Data of the Data_Combined_And_Tidied Dataset got grouped by Subject and Activity. The Object contains the average of the variables, dependent on Subject and Activity.  

## Further Information on the variables
For more information on the variables in the Tidy Datasets, refer to the "./CodeBook" folder containing all necessary information. 

For information on the raw Dataset refer to the CodeBook provided with the zip-compressed package.
