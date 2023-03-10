# reading files
train.x = read.table("../datasciencecoursera/UCI HAR Dataset/train/X_train.txt")
train.y = read.table("../datasciencecoursera/UCI HAR Dataset/train/Y_train.txt")
train.subject = read.table("../datasciencecoursera/UCI HAR Dataset/train/subject_train.txt")

test.x = read.table("../datasciencecoursera/UCI HAR Dataset/test/X_test.txt")
test.y = read.table("../datasciencecoursera/UCI HAR Dataset/test/Y_test.txt")
test.subject = read.table("../datasciencecoursera/UCI HAR Dataset/test/subject_test.txt")

# renaming files
features = read.table("../datasciencecoursera/UCI HAR Dataset/features.txt")

names(train.subject) = "subject_id"
names(train.y) = "activity_labels"
names(train.x) = features$V2

names(test.subject) = "subject_id"
names(test.y) = "activity_labels"
names(test.x) = features$V2

# merging test files
merged_test = cbind.data.frame(test.subject, test.y, test.x)
# merging train files
merged_train = cbind.data.frame(train.subject, train.y, train.x)
# merging train with test files
merged = rbind.data.frame(merged_test, merged_train)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_index = grep("mean", names(merged))
std_index = grep("std", names(merged))

merged_filtered = merged[, c(1, 2, mean_index, std_index)]


# Appropriately labels the data set with descriptive variable names. 
labels = read.table("../datasciencecoursera/UCI HAR Dataset/activity_labels.txt")

merged_filtered["activity_labels"][merged_filtered["activity_labels"] == "1"] = "WALKING"
merged_filtered["activity_labels"][merged_filtered["activity_labels"] == "2"] = "WALKING_UPSTAIRS"
merged_filtered["activity_labels"][merged_filtered["activity_labels"] == "3"] = "WALKING_DOWNSTAIRS"
merged_filtered["activity_labels"][merged_filtered["activity_labels"] == "4"] = "SITTING"
merged_filtered["activity_labels"][merged_filtered["activity_labels"] == "5"] = "STANDING"
merged_filtered["activity_labels"][merged_filtered["activity_labels"] == "6"] = "LAYING"


################################################################################

# for the independant dataset

library(dplyr)
second = merged_filtered %>% group_by(subject_id, activity_labels) %>% 
  summarise(across(everything(), mean))


second_df = second %>% as.data.frame()
