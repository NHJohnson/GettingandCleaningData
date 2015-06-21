run_analysis<-function(){
# This code forms various text files representing data obtained by the accelerometer and gyroscope of a Samsung 
# Galaxy S smartphone as carried by 30 subjects as they performed six activities into a single data frame and then
# subsets it to isolate the means of the recorded means and standard deviations for each subject-activity combination.
# It should be run from the directory containing the UCI HAR Dataset directory once that has been downloaded.
  
# First we install and load in the gdata and dplyr packages if they are not already present.
  if("gdata" %in% rownames(installed.packages()) == FALSE){
    install.packages('gdata') 
    library(gdata)
  }
  if("dplyr" %in% rownames(installed.packages()) == FALSE){
    install.packages('dplyr') 
    library(dplyr)
  }
  
# This section reads in the 'test' and 'train' portions of the dataset along with the suitable Activity and Subject 
# information and column labels. Everything is then concatenated into a single data frame, mergetest.
  features <- read.table('UCI HAR Dataset//features.txt')
  xtest <- read.table('UCI HAR Dataset/test/X_test.txt')
  names(xtest) <- features$V2
  subjecttest<-read.table('UCI HAR Dataset//test//subject_test.txt')
  names(subjecttest) <- c('Subject')
  xtest$Subject <- subjecttest$Subject
  ytest<-read.table('UCI HAR Dataset/test/y_test.txt')
  names(ytest)<-c('Activity')
  xtest$Activity<-ytest$Activity
  xtrain <- read.table('UCI HAR Dataset/train/X_train.txt')
  names(xtrain) <- features$V2
  subjecttrain<-read.table('UCI HAR Dataset//train//subject_train.txt')
  names(subjecttrain) <- c('Subject')
  xtrain$Subject <- subjecttrain$Subject
  ytrain<-read.table('UCI HAR Dataset/train/y_train.txt')
  names(ytrain)<-c('Activity')
  xtrain$Activity<-ytrain$Activity
  mergetest<-rbind(xtest,xtrain)

# This section uses matchcols to parse the column names in order to reduce the data set to only those columns 
# containing means and standard deviations. Some columns contain the string 'mean' but are actually mean-frequency
# data; these are excluded in a second step. The reduced dataset has 66 data columns, plus Subject and Activity.
  goodnames <- matchcols(mergetest,with=c('-mean','-std'),method='or')
  goodvec <- c(goodnames$'-mean',goodnames$'-std','Activity','Subject')
  meanstd <- mergetest[,goodvec]
  goodnames <- matchcols(meanstd,with=c('-'),without=c('meanFreq'),method='or')
  goodvec <- c(goodnames,'Activity','Subject')
  meanstdonly <- meanstd[,goodvec]

# The Subject and Activity columns currently are of integer type and must be cast into numeric form prior to being
# transformed to factors using 'cut'. The labels of the factor levels are changed at the same time, so the activities
# are better described.
  meanstdonly$Activity <- as.numeric(meanstdonly$Activity)
  meanstdonly$Activity<-cut(meanstdonly$Activity,breaks=6,labels=c('WALKING','WALKING.UPSTAIRS','WALKING.DOWNSTAIRS','SITTING','STANDING','LYING.DOWN'))
  meanstdonly$Subject <- as.numeric(meanstdonly$Subject)
  meanstdonly$Subject<-cut(meanstdonly$Subject,breaks=30,labels=as.character(1:30))

# Using 'aggregate', the mean and std measurements making up the first 66 columns of the data frame are grouped by 
# the Subject and Activity factors and the means of each column taken within each group. There are 30 subjects and 
# six activities, so the resulting data frame has 180 rows of data. The Subject and Activity columns have been renamed
# 'Group.1' and 'Group.2' by aggregate and must be renamed.
  groupmeans <- aggregate(meanstdonly[1:66],list(meanstdonly$Subject,meanstdonly$Activity),mean)
  groupmeans <- rename(groupmeans,Subject=Group.1,Activity=Group.2)
# The resulting data frame is written to 'tidymeans.txt' in the current directory. Use header=TRUE when pulling back
# into R with read.table.
  write.table(groupmeans,file='tidymeans.txt',row.names=FALSE)
}