##download zip data
if (!file.exists("dataset.zip")){
	fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileURL,"dataset.zip")
}

##unzip dataset
if (!file.exists("UCI HAR Dataset")){
	unzip("dataset.zip")
}

##read data from file to variable
TestActivity <- read.table(file.path("UCI HAR Dataset","test","Y_test.txt"), header=FALSE)
TrainActivity <- read.table(file.path("UCI HAR Dataset","train","Y_train.txt"), header=FALSE)

TestSubject <- read.table(file.path("UCI HAR Dataset","test","subject_test.txt"), header=FALSE)
TrainSubject <- read.table(file.path("UCI HAR Dataset","train","subject_train.txt"), header=FALSE)

TestFeature <- read.table(file.path("UCI HAR Dataset","test","X_test.txt"), header=FALSE)
TrainFeature <- read.table(file.path("UCI HAR Dataset","train","X_train.txt"), header=FALSE)


##Merge data - merge column
dtTest <- cbind(TestSubject,TestActivity,TestFeature)
dtTrain <- cbind (TrainSubject,TrainActivity,TrainFeature)

##Merge data - all data
allDt <- rbind(dtTrain,dtTest)
featuresTable <- read.table("UCI HAR Dataset/features.txt")
featuresName <- as.character(featuresTable[,2])
names(allDt) <- c("subject", "activity", featuresName)

##subsetting data with the mean and standar deviation column
chosenFeature <- featuresName[grep("mean\\(\\)|std\\(\\)",featuresName)]
selectedColumn <- c(chosenFeature, "subject", "activity")
allDt <-subset(allDt,select=selectedColumn)

##Uses descriptive activity names to name the activities in the data set
activityLabel <- read.table("UCI HAR Dataset/activity_labels.txt")
allDt$activity <- factor(allDt$activity, levels = activityLabel[,1], labels = activityLabel[,2])

##Appropriately labels the data set with descriptive variable names
names(allDt)<-gsub("^t", "time", names(allDt))
names(allDt)<-gsub("^f", "frequency", names(allDt))
names(allDt)<-gsub("Acc", "Accelerometer", names(allDt))
names(allDt)<-gsub("Gyro", "Gyroscope", names(allDt))
names(allDt)<-gsub("Mag", "Magnitude", names(allDt))
names(allDt)<-gsub("BodyBody", "Body", names(allDt))

##creates a second, independent tidy data set
library(plyr)
Data2 <- aggregate(. ~subject + activity, allDt, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)



