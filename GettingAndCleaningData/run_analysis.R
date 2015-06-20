####################### TOP LEVEL OPTIONS
rm(list=ls())
require(dplyr)

## Should we download and save data?
SAVEDATA<-FALSE

## Working directory
workingDir<-'G:\\Courses\\DataScience\\GettingAndCleaningData\\Project'
setwd(workingDir)

####### Data operation - download and save data
if(SAVEDATA)
{
        fileURL<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
        download.file(fileURL,destfile='SmartPhoneData.zip',mode='wb')
        unzip('SmartPhoneData.zip')
}

####### LOAD RELEVANT DATA
##### The features information set
featuresNames<-read.table('./UCI HAR Dataset/features.txt',stringsAsFactors=FALSE)
## Order by index
featuresNames<-featuresNames[order(featuresNames[,1]),]
names(featuresNames)<-c('INDEX','FEATURE')
## Duplicate feature names - make unique
featuresNames<-mutate(featuresNames,UNIQUEFEATURE=make.unique(FEATURE))
duplicates<-filter(featuresNames,FEATURE!=UNIQUEFEATURE)

## Get length
featuresNamesLen<-length(featuresNames)


##### The labels information set
labels<-read.table('./UCI HAR Dataset/activity_labels.txt')
labels<-labels[order(labels[,1]),]

##### LOAD TRAINING DATA SET
trainX<-read.table(file='./UCI HAR Dataset/train/X_train.txt',header=FALSE)
trainY<-read.table(file='./UCI HAR Dataset/train/Y_train.txt',header=FALSE)
names(trainY)<-"ACTIVITY"
trainS<-read.table(file='./UCI HAR Dataset/train/subject_train.txt',header=FALSE)
names(trainS)<-"SUBJECT"

##### Some basic dimension checks
## do the subject vector, tarining/fature matrix and labels vector dimensions match
if(dim(trainX)[1]!=dim(trainY)[1]||dim(trainX)[1]!=dim(trainS)[1]) stop('Dimensions of training set does not match')
## does the training set and feature names match
if(dim(trainX)[2]!=dim(featuresNames)[1]) stop("Feature names length and feature matrix column length not matching")

###### Set names of the feature matrix columns and only select the mean/standard deviation
names(trainX)<-featuresNames$UNIQUEFEATURE
trainX<-select(trainX,which(grepl('mean\\(\\)|std\\(\\)',featuresNames$UNIQUEFEATURE,
                              ignore.case=TRUE)==TRUE))
training<-cbind(trainS,trainY) %>% mutate(SET='train') %>% cbind(trainX) 

##### LOAD TESTING DATA SET
testX<-read.table(file='./UCI HAR Dataset/test/X_test.txt',header=FALSE)
testY<-read.table(file='./UCI HAR Dataset/test/Y_test.txt',header=FALSE)
names(testY)<-"ACTIVITY"
testS<-read.table(file='./UCI HAR Dataset/test/subject_test.txt',header=FALSE)
names(testS)<-"SUBJECT"

##### Some basic dimension checks
## do the subject vector, tarining/fature matrix and labels vector dimensions match
if(dim(testX)[1]!=dim(testY)[1]||dim(testX)[1]!=dim(testS)[1]) stop('Dimensions of testing set does not match')
## does the testing set and feature names match
if(dim(testX)[2]!=dim(featuresNames)[1]) stop("Feature names length and feature matrix column length not matching")

###### Set names of the feature matrix columns and only select the mean/standard deviation
names(testX)<-featuresNames$UNIQUEFEATURE
testX<-select(testX,which(grepl('mean\\(\\)|std\\(\\)',featuresNames$UNIQUEFEATURE,
                                  ignore.case=TRUE)==TRUE))
testing<-cbind(testS,testY) %>% mutate(SET='test') %>% cbind(testX) 

##### BIND THE TRAINING AND TESTING SETS
data<-rbind(training,testing)

### Rename feature colmuns
nmes<-names(data)
from<-c('\\-mean\\(\\)','\\-std\\(\\)','-X$','-Y$','-Z$')
to<-c('.MEAN','.STD','.X','.Y','.Z')
for(i in seq_along(from))
        nmes<-gsub(from[i],to[i],nmes)

namesMap<-data.frame(ORIGINAL=names(data),stringsAsFactors=FALSE)
namesMap<-mutate(namesMap,CHANGED=nmes)

## Which names changed?
namesChged<-filter(namesMap,ORIGINAL!=CHANGED)

## Reassign
names(data)<-nmes

## Rename activity
data<-mutate(data,ACTIVITY=sapply(ACTIVITY,function(x){return(labels[x,2])})) %>% mutate(ACTIVITY=factor(ACTIVITY))

##### GROUP AND AVERAGE
data<-group_by(data,ACTIVITY,SUBJECT)

dataSummary<-select(data,-(SUBJECT:SET)) %>% summarise_each(funs(mean))

##### SAVE DATA
write.table(dataSummary,file='FeatureSummary.txt',row.names=FALSE)
