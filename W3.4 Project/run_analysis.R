## downloading files required and unzip it for downstreaming operations
if (!file.exists("./wk3_4project")){dir.create("./wk3_4project")}
fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "./wk3_4project/data.zip",method = "curl",mode = "wb")
unzip("./wk3_4project/data.zip",exdir = "./wk3_4project")
dircName = "./wk3_4project/UCI HAR Dataset/train/X_train.txt"

## Read all training and testing files
xtrain <- read.table("./wk3_4project/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./wk3_4project/UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./wk3_4project/UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("./wk3_4project/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./wk3_4project/UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./wk3_4project/UCI HAR Dataset/test/subject_test.txt")

# Merging all datasets into one data set (task1)
dat_train <- cbind(xtrain,ytrain,subjecttrain)
dat_test <- cbind(xtest,ytest,subjecttest)

dat <- rbind(dat_train,dat_test)

## Read feature names and determine if it is mean or std measurement (task2)
mea <- read.table("./wk3_4project/UCI HAR Dataset/features.txt")
mea_res <- grep("mean\\()|std\\()",mea$V2)
dat <- dat[,c(mea_res,562:563)]

## Label the columns with descriptive variable names (task4)
name_res <- mea$V2[mea_res]
names(dat) <- name_res
names(dat)[67:68] <- c("activity","subjectID")

## Uses descriptive activity names to name the activities (task3)
dat$activity <- factor(dat$activity,labels=c("WALKING","WALKING_UPSTAIRS",
                             "WALKING_DOWNSTAIRS","SITTING",
                             "STANDING","LYING"))

## create an independent tidy data set with average of 
## each variable (66 in total) grouping by (activity, subjectID)
## (180 groups in total) (task5)
library(dplyr)
dat2<- dat %>% 
  group_by(activity, subjectID) %>%
  summarise_all("mean")
write.table(dat2,file = "./wk3_4project/tidy_dataset.txt",row.names = FALSE)