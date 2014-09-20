# Load data in R
subject_train <- read.csv("subject_train.txt", sep = "", header = FALSE, stringsAsFactor = FALSE)
X_train <- read.csv("X_train.txt", sep = "", header = FALSE, stringsAsFactor = FALSE)
y_train <- read.csv("y_train.txt", sep = "", header = FALSE)
subject_test <- read.csv("subject_test.txt", sep = "", header = FALSE, stringsAsFactor = FALSE)
X_test <- read.csv("X_test.txt", sep = "", header = FALSE, stringsAsFactor = FALSE)
y_test <- read.csv("y_test.txt", sep = "", header = FALSE)
features <- read.csv("features.txt", sep = "", header = FALSE, stringsAsFactor = FALSE)
activities <- read.csv("activity_labels.txt", sep = "", header = FALSE)

y_train[y_train == 1] <- "WALKING"
y_train[y_train == 2] <- "WALKING_UPSTAIRS"
y_train[y_train == 3] <- "WALKING_DOWNSTAIRS"
y_train[y_train == 4] <- "SITTING"
y_train[y_train == 5] <- "STANDING"
y_train[y_train == 6] <- "LAYING"

y_test[y_test == 1] <- "WALKING"
y_test[y_test == 2] <- "WALKING_UPSTAIRS"
y_test[y_test == 3] <- "WALKING_DOWNSTAIRS"
y_test[y_test == 4] <- "SITTING"
y_test[y_test == 5] <- "STANDING"
y_test[y_test == 6] <- "LAYING"

#merge the data in one dataset
library(dplyr)
names(X_train) <- features[,2]
names(X_test) <- features[,2]
names(y_train) <- "activity"
names(y_test) <- "activity"
names(subject_train) <- "subject"
names(subject_test) <- "subject"
dataTrain <- cbind(subject_train, y_train, X_train)
dataTest <- cbind(subject_test, y_test, X_test)
data <- rbind(dataTrain, dataTest)
cols <- c(1,2)
cols <- append(cols,grep("mean", features[,2]) + 2)
cols <- append(cols,grep("Mean", features[,2]) + 2) 
cols <- append(cols,grep("std", features[,2]) + 2)
sort(cols)
data <- data[cols]


data <- tbl_df(data)

#clean memory
rm(X_train)
rm(X_test)
rm(y_train)
rm(y_test)
rm(subject_train)
rm(subject_test)
rm(features)
rm(dataTest)
rm(dataTrain)

group <- group_by(data, subject, activity)
meanPack <- summarise_each(group, funs(mean))
sdPack <- summarise_each(group, funs(sd))
write.table(meanPack, file = "table.txt")
meanPack

