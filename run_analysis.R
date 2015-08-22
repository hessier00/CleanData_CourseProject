
## Read in the activity labels and the feature names
activityLabels<-read.table("UCI HAR Dataset\\activity_labels.txt")
featureNames<-read.table("UCI HAR Dataset\\features.txt")

## Strip off the excess indexing, converting both files to factor vectors
featureNames<-featureNames$V2
activityLabels<-activityLabels$V2

## Read in the test data files
testSubject<-read.table("UCI HAR Dataset\\test\\subject_test.txt")
testX<-read.table("UCI HAR Dataset\\test\\X_test.txt")
testY<-read.table("UCI HAR Dataset\\test\\Y_test.txt")

## Read in the training data files
trainSubject<-read.table("UCI HAR Dataset\\train\\subject_train.txt")
trainX<-read.table("UCI HAR Dataset\\train\\X_train.txt")
trainY<-read.table("UCI HAR Dataset\\train\\Y_train.txt")

## Convert the activity numbers in the trainT and testY datasets to the name of the activity
testY<-cut(testY$V1, 6, labels=activityLabels)
trainY<-cut(trainY$V1, 6, labels=activityLabels)

## Bind the the the train datasets together, adding trainSubject and trainY
## as new columns on the right side of trainX
train<-cbind(trainX,trainSubject,trainY)

## Do the same for the test datasets
test<-cbind(testX,testSubject,testY)

## Append the factors "subject" and "activity" to the existing vector of column names
## First, add the two as new levels
featureNames<-factor(featureNames,levels=c(levels(featureNames),"subject","activity"))
## Then add them as entries in the vector
featureNames[562]="subject"
featureNames[563]="activity"

## Apply column names to both test and train
names(test)<-featureNames
names(train)<-featureNames

## combine the train and test tables into one reconstituted whole
theTable<-rbind(train, test)

## Clean up a bit
rm(test)
rm(testSubject)
rm(testX)
rm(testY)
rm(train)
rm(trainSubject)
rm(trainX)
rm(trainY)

## Extract/shrink the table to just the columns containing a mean, a 
## standard deviation, or subject/activity information
## A reg ex is used to match the following columns, which will be kept:
##  1) any column name containing "mean" directly followed by punctuation
##  2) any column name containing "std" directly followed by punctuation
##  #) any column name containing "subject" (should be only one)
##  4) any column name containing "activity" (should also be only one)
theTable<-theTable[ ,grepl("mean[[:punct:]]|std[[:punct:]]|subject|activity", names(theTable))]

## Build a new table finding the mean of every measurement value for each activity for each subject
## using the aggregate fucntions on the 66 measurement columns, aggregating by subject and then activity
meanTable<-aggregate(theTable[1:66], by=list(activity=theTable$activity, subject=theTable$subject),mean)

## Code to write the file, commented out but included for reference:
## write.table(meanTable,"tidy_data.txt", row.names=FALSE)



