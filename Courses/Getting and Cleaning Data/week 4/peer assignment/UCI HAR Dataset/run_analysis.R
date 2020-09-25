library(data.table)
library(reshape2)
labels <- fread("activity_labels.txt", col.names = c("classLabels", "activityName"))
features <- fread("features.txt", col.names = c("index", "featureNames"))

featuresWanted <- grep("(mean|std)\\(\\)", features[,featureNames])
measurements <- features[featuresWanted, featureNames]
measurements <- gsub("[()]", "", measurements)

trainData <- fread("train/X_train.txt")[, featuresWanted, with=FALSE]
data.table::setnames(trainData, colnames(trainData), measurements)

trainActivities <- fread("train/y_train.txt", col.names = c("Activity"))
trainSubjects <- fread("train/subject_train.txt", col.names = c("SubjectNum"))

trainData <- cbind(trainSubjects, trainActivities, trainData)

testData <- fread("test/X_test.txt")[, featuresWanted, with=FALSE]
data.table::setnames(testData, colnames(testData), measurements)

testActivities <- fread("test/y_test.txt", col.names = c("Activity"))
testSubjects <- fread("test/subject_test.txt", col.names = c("SubjectNum"))

testData <- cbind(testSubjects, testActivities, testData)

combined <- rbind(trainData, testData)

combined[["Activity"]] <- factor(combined[, Activity]
                                 , levels = labels[["classLabels"]]
                                 , labels = labels[["activityName"]])
combined[["SubjectNum"]] <- as.factor(combined[, SubjectNum])
combined <- melt(data = combined, id = c("SubjectNum", "Activity"))
combined <- dcast(data = combined, SubjectNum + Activity ~ variable, fun.aggregate = mean)

data.table::fwrite(x = combined, file = "output.txt", quote = FALSE)

