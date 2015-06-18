library(dplyr)

#if folder script *contains* the data set, go inside
base_dir="UCI HAR Dataset"
if(file.exists(base_dir))
    setwd(base_dir)
#else we assume the script is already in the data folder

#Merge the training and the test sets to create one data set.
    #merge subjects
    train_subjects <- read.table("train/subject_train.txt",col.names="subject_id")
    test_subjects <- read.table("test/subject_test.txt",col.names="subject_id")
    subjects <- bind_rows(train_subjects,test_subjects)

    #merge training activity labels
    train_activities <- read.table("train/y_train.txt",col.names="act_id")
    test_activities  <- read.table("test/y_test.txt",col.names="act_id")
    activities <- bind_rows(train_activities,test_activities)

    # Load measurements set with descriptive features labels
    # Data is appropriately labelled by removing special chars (parenthesis, -)
    features <- read.table("features.txt",col.names=c("id","label"))
    clean_label <- gsub("\\(|\\)","",features$label)
    clean_label <- gsub("-","_",clean_label)
    train_set <- read.table("train/X_train.txt",col.names=clean_label)
    test_set <- read.table("test/X_test.txt",col.names=clean_label)
    measurements <- bind_rows(train_set,test_set)


#create data frame with all attributes and observations
alltogether <- data.frame(subjects,activities,measurements)

#2 Extract only the measurements on the mean and standard deviation for each measurement.
justcols <- select(alltogether,subject_id,act_id,matches("*(std|mean)($|_)",ignore.case = FALSE))

#3 Use descriptive activity names to name the activities in the data set
features <- read.table("activity_labels.txt",col.names=c("act_id","act_name"))
withdesc<-justcols %>%
    inner_join(features) %>%
    select(subject_id,act_name,everything(),-act_id)

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
avg_va <-withdesc %>%
    group_by(subject_id,act_name) %>%
    summarise_each(funs(mean))



