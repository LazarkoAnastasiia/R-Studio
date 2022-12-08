install.packages("dplyr")
library(dplyr)


#Ви повинні створити один R-скрипт, який називається run_analysis.R, який виконує наступні дії.
#1. Об’єднує навчальний та тестовий набори, щоб створити один набір даних.
data <- read.table("D:/UCI HAR Dataset/features.txt", colClasses = "character")[,2]
head(data, 100)

train_x <- read.table("D:/UCI HAR Dataset/train/X_train.txt", col.names = data, check.names = F)
train_y <- read.table("D:/UCI HAR Dataset/train/y_train.txt", col.names = c('activity'))
subject.train <- read.table("D:/UCI HAR Dataset/train/subject_train.txt", col.names = c('subject'))

test_x <- read.table("D:/UCI HAR Dataset/test/X_test.txt", col.names = data, check.names = F)
test_y <- read.table("D:/UCI HAR Dataset/test/Y_test.txt", col.names = c('activity'))
subject.test <- read.table("D:/UCI HAR Dataset/test/subject_test.txt", col.names = c('subject'))

act_labels <- read.table("D:/UCI HAR Dataset/activity_labels.txt", col.names = c('n','text'))


mergeddata <- cbind(rbind(train_x, test_x), rbind(train_y, test_y), rbind(subject.train, subject.test))

data1 <- mergeddata[, !duplicated(colnames(mergeddata))]

#2. Витягує лише вимірювання середнього значення та стандартного відхилення (mean and standard deviation) для кожного вимірювання.
data2 <- select(data1,  matches("mean\\(\\)|std\\(\\)|subject|activity"))
head(data2,5)

#3. Використовує описові назви діяльностей (activity) для найменування діяльностей у наборі даних.
data3 <- within(data2, activity <- factor(activity, labels = act_labels[,2]))


#4. Відповідно присвоює змінним у наборі даних описові імена.
data4 <- aggregate(x = data3[, -c(67,68)], by = list(data3[,'subject'], data3[, 'activity']), FUN = mean)

#5. З набору даних з кроку 4 створити другий незалежний акуратний набір даних (tidy dataset) 
#із середнім значенням для кожної змінної для кожної діяльності та кожного суб’єкту (subject)

write.csv(data4, "tidy_dataset.csv", row.names=F)
setwd("D:/")


