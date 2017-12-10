# Project is to :-
#1.Merge the training and the test sets to create one data set.
#2.Extract only the measurements on the mean and standard deviation for each measurement. 
#3.Use descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Merge the training and the test sets to create one data set.
#Read the data from .txt 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
sub_test <-read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <-read.table("./UCI HAR Dataset/test/y_test.txt")
sub_train <-read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <-read.table("./UCI HAR Dataset/train/y_train.txt")
# Assign Column Name
names(activity_labels)<-c("ActivityID","ActivityDesc")
names(sub_test) <- "SubjectID"
names(sub_train) <- "SubjectID"
names(x_test) <- features$V2
names(x_train) <- features$V2
names(y_test) <- "ActivityID"
names(y_train) <- "ActivityID"
#combine the datasets
train <- cbind(sub_train, y_train, x_train) 
test <- cbind(sub_test, y_test, x_test) 
all <- rbind(train, test) 

#Use descriptive activity names to name the activities in the data set
mall <- merge(all,activity_labels, by="ActivityID")

#Extract only the measurements on the mean and standard deviation for each measurement. 
meanstd <- grepl("SubjectID", names(mall))|grepl("ActivityDesc", names(mall))|grepl("mean\\(\\)", names(mall))|grepl("std\\(\\)", names(mall)) 
combined <- mall[, meanstd]

#Appropriately label the data set with descriptive variable names. 
colnames <-colnames(combined)
colnames <- make.names(colnames, unique=TRUE)
colnamesclean<-gsub("tBody", "Body", colnames)
colnamesclean<-gsub("fBody", "Body", colnamesclean)
colnamesclean<-gsub("tGravity", "Gravity", colnamesclean)
colnamesclean<-gsub("BodyBody", "Body", colnamesclean)
colnamesclean<-gsub("ActivityDesc", "Activity", colnamesclean)
colnamesclean<-gsub("\\.", " ", colnamesclean)
colnamesclean<-gsub("\\   ", " ", colnamesclean)
colnamesclean<-gsub("^\\s+|\\s+$", "", colnamesclean)

colnames(combined) <- colnamesclean

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

melted <- melt(combined, id=c("SubjectID","Activity"))
tidy <- dcast(melted, SubjectID+Activity ~ variable, mean)

write.csv(tidy, "tidy.txt", row.names=FALSE)
