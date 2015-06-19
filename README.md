README for Coursera's *Getting and Cleaning Data* course project
files hosted at https://github.com/teksaver/GettingCleaningProject

---
title: "README"
author: "Sylvain Tenier"
date: "19/06/2015"
---

# What is inside the repository?

Included are the relevant files for the handout
- *run_analysis.R* : script that completes the assignment
- *README.md*: the current file, describing how the script works
- *tidy.txt*: a space separated tidy data set submitted on Coursera
- *codebook.md*: a description of the all the calculated variables and summaries in the output
- a subset of the *UCI HAR Dataset* folder, containing only the files used by the script.

# How to run the script
- Clone the github repo at https://github.com/teksaver/GettingCleaningProject 
    - Enter *git clone https://github.com/teksaver/GettingCleaningProject* into a terminal
    - Or just download the *run_analysis.R* file from github web interface if you do not want to download the dataset
- Run R from your terminal or R studio.
- Make sure you set your working directory to where the *UCI HAR Dataset* folder is located using the **setwd()** function.
- Enter source(run_analysis.R)

#What do you get upon running the script

- A *tidy.csv* file containing a tidy data set with the average of each variable for each activity and each subject.
- Variables in the R environment, including:
    - *alltogether*: all 10299 observations and 563 variables in a dataframe
    - *cleanset*: all 10299 observations (with descriptive variable names) and only the relevant variables (mean and standard deviation for each measurement). This is the output of step 4 of the assignment
    - *avg_va*:  a second, independent tidy data set with the average of each variable for each activity and each subject. This is the output of step 5 of the assignment. The *tidy.csv* file is generated from this tidy data set.

# How is the result a clean data set ?

The resulting data set repsects the 3 principles of dity data defined in Hadley Wickham's paper, Tidy data (http://vita.had.co.nz/papers/tidy-data.pdf)

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.


# How the script works

- We first load the dplyr library with the *library(dplyr)* command. dplyr provides a set of tools for efficiently manipulating datasets in R
- We check whether the working directory *contains* the *UCI HAR Dataset* folder. In this case, we set the working directory to the actual folder, using the *setwd()* command.
- We load each file in its own dataframe using the *read.table* command. 
    - The content of *subject_train.txt* and *subject_test.txt* is merged into a *subjects* dataframe using dplyrs's *bind_rows* command
    - The content of *y_train.txt.txt* and *y_train.txt.txt* is merged into a *activities* dataframe using dplyrs's *bind_rows* command
    - Features from the *features.txt* file are loaded and cleaned using the gsub command and relevant regular expressions
        - parenthesis are removed, 
        - -- are replaced with _,
        - the output is a *clean_label* vector.
    - The *clean_label* vector is used for column names when loading the measurements from*X_train.txt* and *X_test.txt* files. The output is a *measurement* dataframe containing measurements with valid and relevant variables names. We chose to do this step (step 4 of the assignment) at that time to deal with clean variables names all along.
- We create the data frame with all subjects, activities and measurements using the *data_frame* command. The output is an *alltogether* dataframe containing all 10299 observations and 563 variables.
- We use dplyr's *select* command along with dplyr's *matches* command to keep only :
    - the subject_id column
    - the act_id column
    - columns containing *mean* or *std* at the end or before a _ character using the `*(std|mean)($|_)` regular expression
- The output is a *cleanset* variable containing only the measurements on the mean and standard deviation for each measurement, as requested in step 2 of the assignment.
- We mofify the *cleanset* variable to replace each activity id by a descriptive activity name.
    - We load the *activity_labels.txt* file
    - We use the *inner_join* dplyr command to match each id with the descriptive name
    - We remove the *act_id* column to keep only the descriptive name using dplyr's *select* command.
- Finally, we create a second, independent tidy data set with the average of each variable for each activity and each subject:
    - first we group by subject and activity using dplyr's *group_by* command,
    - then we calculate the mean for each group using dplyrs- *summarise_each* command.
- The output is the *avg_va* variable containing 180 observations (30 subjects, each  performing 6 activities)
- This data frame is exported into the *tidy.csv* file using the *write.table* command. This file has been uploaded as requested in part 1 of the assignment.
    - This file can be loaded into R for inspection with the `read.table("tidy.csv", header = TRUE)` command. If you just generated the file from the script, make sure you go up one directory using the `setwd("..")` command, since the file is created in the folder tha *contains* the *UCI HAR Dataset* folder.



