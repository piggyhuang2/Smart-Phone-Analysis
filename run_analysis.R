# get my current work directory
getwd()
# set the directory with datasets as my work directory
setwd("C:\\Users\\Jingmin\\Documents\\getting_cleaning_data")
# read in training and test datasets
training <- read.table("X_train.txt",header=FALSE)
train_y <- read.table("y_train.txt",header=FALSE)
sub_train <- read.table("subject_train.txt",header=FALSE)
colnames(train_y)<- "activity"
colnames(sub_train) <- "subject"
training_data <- cbind(training,sub_train,train_y)
test <- read.table("X_test.txt",header=FALSE)
test_y <- read.table("y_test.txt",header=FALSE)
sub_test <- read.table("subject_test.txt",header=FALSE)
colnames(test_y)<- "activity"
colnames(sub_test) <- "subject"
test_data <- cbind(test,sub_test,test_y)
# merge training and test datasets
data <- rbind(training_data,test_data)
# read in feature list
feature_list <- read.table("features.txt", col.names = c("id", "name"))
features <- c(as.vector(feature_list[, "name"]), "subject", "activity")
# keep only features that have mean or standard deviation in the name
filtered_feature_ids <- which(grepl("mean|std|subject|activity", features) & !grepl("meanFreq", features))
filtered_data <- select(data,filtered_feature_ids)
activity_labels <- read.table("activity_labels.txt",header=FALSE)
colnames(activity_labels) <- c("id","name")
for (i in 1:nrow(activity_labels)) {
    filtered_data$activity[filtered_data$activity == activity_labels[i, "id"]] <- as.character(activity_labels[i, "name"])
}

filtered_feature_names <- features[filtered_feature_ids]
filtered_feature_names <- gsub("\\(\\)", "", filtered_feature_names)
filtered_feature_names <- gsub("Acc", "-acceleration", filtered_feature_names)
filtered_feature_names <- gsub("Mag", "-Magnitude", filtered_feature_names)
filtered_feature_names <- gsub("^t(.*)$", "\\1-time", filtered_feature_names)
filtered_feature_names <- gsub("^f(.*)$", "\\1-frequency", filtered_feature_names)
filtered_feature_names <- gsub("(Jerk|Gyro)", "-\\1", filtered_feature_names)
filtered_feature_names <- gsub("BodyBody", "Body", filtered_feature_names)
filtered_feature_names <- tolower(filtered_feature_names)

# assign names to features
names(filtered_data) <- filtered_feature_names

tidy_data <- tbl_df(filtered_data) %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean)) 

write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)	
	