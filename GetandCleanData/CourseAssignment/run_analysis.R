#############################################
library(dplyr)
### this is where you set your working directory:
#wd <- "~/code/DStoolbox/getandcleandata/crsAssignment/"
#setwd(wd)
### create directory if it doesn't exist
#if (!dir.exists("./dataFile/")){
#    dir.create("./dataFile/")
#}
### download the file from the website
#fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileURL, "./dataFile/data.zip")
###get in datafile
#wd <- paste(wd,"datafile/",sep="")
#setwd(wd)
###unzip the file
#unzip("./data.zip")
###inside dataset
#wd <- paste(wd,"UCI HAR Dataset",sep="")
#setwd(wd)
#############################################

###now the fun begins

###we will start with the test data and merge it so that it means something
## keep in mind this data set only has 30% of the data which is why it has less than
## the training data

###start a data frame which everything will eventually get inputted into
finTest <- data.frame()

###this is the data where we have the unique identifer of the volunteer
vol <- read.table("./test/subject_test.txt",header=FALSE)
###create index for this data
index <- seq(1,nrow(vol))
###merge index and data
vol <- cbind(index,vol)
###create a header for this
colnames(vol) <- c("index","Volunteer")
###add to data frame
finTest <- vol

###move onto the activityID - read first
actID <- read.table("./test/y_test.txt",header=FALSE)
###create index for this data
index <- seq(1,nrow(actID))
###merge index and data
actID <- cbind(index,actID)
###create a header for this
colnames(actID) <- c("index","actID")
###add to data frame
finTest <- merge(finTest,actID,by.x="index",by.y = "index")

###move onto activity Names
actNames <- read.table("./activity_labels.txt",header=FALSE)
###header
colnames(actNames) <- c("ID","actNames")
###merge dataFrame with actNames
finTest <- merge(finTest,actNames,by.x="actID",by.y="ID")
###order by index
finTest <- finTest[order(finTest$index),]

###move onto data (x_test)
testDataX <- read.table("./test/x_test.txt",header=FALSE)
###headers
testDataNames <- read.table("./features.txt",header=FALSE)
colnames(testDataNames) <- c("num","name")
###column names
colnames(testDataX) <- testDataNames[,c("name")]
###create index for this data
index <- seq(1,nrow(testDataX))
###merge index and data
testDataX <- cbind(index,testDataX)
###merge dataFrame with testDataX
finTest <- merge(finTest,testDataX,by.x="index",by.y="index")
###order by index
finTest <- finTest[order(finTest$index),]

########################################
###now need to do the same thing for training material
###start a data frame which everything will eventually get inputted into
finTrain <- data.frame()

###this is the data where we have the unique identifer of the volunteer
vol <- read.table("./train/subject_train.txt",header=FALSE)
###create index for this data
index <- seq(1,nrow(vol))
###merge index and data
vol <- cbind(index,vol)
###create a header for this
colnames(vol) <- c("index","Volunteer")
###add to data frame
finTrain <- vol

###move onto the activityID - read first
actID <- read.table("./train/y_train.txt",header=FALSE)
###create index for this data
index <- seq(1,nrow(actID))
###merge index and data
actID <- cbind(index,actID)
###create a header for this
colnames(actID) <- c("index","actID")
###add to data frame
finTrain <- merge(finTrain,actID,by.x="index",by.y = "index")

###move onto activity Names
actNames <- read.table("./activity_labels.txt",header=FALSE)
###header
colnames(actNames) <- c("ID","actNames")
###merge dataFrame with actNames
finTrain <- merge(finTrain,actNames,by.x="actID",by.y="ID")
###order by index
finTrain <- finTrain[order(finTrain$index),]

###move onto data (x_test)
trainDataX <- read.table("./train/x_train.txt",header=FALSE)
###headers
trainDataNames <- read.table("./features.txt",header=FALSE)
colnames(trainDataNames) <- c("num","name")
###column names
colnames(trainDataX) <- trainDataNames[,c("name")]
###create index for this data
index <- seq(1,nrow(trainDataX))
###merge index and data
trainDataX <- cbind(index,trainDataX)
###merge dataFrame with testDataX
finTrain <- merge(finTrain,trainDataX,by.x="index",by.y="index")
###order by index
finTrain <- finTrain[order(finTrain$index),]

###now to merge the training and the test information
finalSet <- rbind(finTest,finTrain)

### extract only the mean and standard deviation for each measurement
### and add in the actID, volunteerID to this set as well
final <- cbind(finalSet[,2:3],finalSet[,colnames(finalSet[
    ,c(colnames(select(finalSet,contains("mean()")))
       , colnames(select(finalSet,contains("std()")))
       )])
    ])

### from data set 4, create a second, independent data set with average of each variable
### for each activity and each subject
newFinal <- final %>% group_by(Volunteer,actID) %>% summarize_each(funs(mean))

###if you want to write to a file -- uncomment below
#write.table(newFinal, file="Course_Assignment.txt", row.names = FALSE)

###if you want to remove all the variables from the directory -- uncomment below
#rm(actNames,actID,vol,testDataX,finTest,testDataNames,trainDataX,trainDataNames
    #,finTrain,finalSet,newFinal,final)
