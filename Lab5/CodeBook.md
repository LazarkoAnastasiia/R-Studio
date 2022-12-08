install.packages("dplyr")
library(dplyr)


#Ви повинні створити один R-скрипт, який називається run_analysis.R, який виконує наступні дії.
#1. Об’єднує навчальний та тестовий набори, щоб створити один набір даних.
```{r}
data <- read.table("D:/UCI HAR Dataset/features.txt", colClasses = "character")[,2]
head(data, 100)

 [1] "tBodyAcc-mean()-X"             "tBodyAcc-mean()-Y"             "tBodyAcc-mean()-Z"             "tBodyAcc-std()-X"             
 [5] "tBodyAcc-std()-Y"              "tBodyAcc-std()-Z"              "tBodyAcc-mad()-X"              "tBodyAcc-mad()-Y"             
 [9] "tBodyAcc-mad()-Z"              "tBodyAcc-max()-X"              "tBodyAcc-max()-Y"              "tBodyAcc-max()-Z"             
 [13] "tBodyAcc-min()-X"              "tBodyAcc-min()-Y"              "tBodyAcc-min()-Z"              "tBodyAcc-sma()"    
 [17] "tBodyAcc-energy()-X"           "tBodyAcc-energy()-Y"           "tBodyAcc-energy()-Z"           "tBodyAcc-iqr()-X"             
 [21] "tBodyAcc-iqr()-Y"              "tBodyAcc-iqr()-Z"              "tBodyAcc-entropy()-X"          "tBodyAcc-entropy()-Y"         
 [25] "tBodyAcc-entropy()-Z"          "tBodyAcc-arCoeff()-X,1"        "tBodyAcc-arCoeff()-X,2"        "tBodyAcc-arCoeff()-X,3"       
 [29] "tBodyAcc-arCoeff()-X,4"        "tBodyAcc-arCoeff()-Y,1"        "tBodyAcc-arCoeff()-Y,2"        "tBodyAcc-arCoeff()-Y,3"       
 [33] "tBodyAcc-arCoeff()-Y,4"        "tBodyAcc-arCoeff()-Z,1"        "tBodyAcc-arCoeff()-Z,2"        "tBodyAcc-arCoeff()-Z,3"       
 [37] "tBodyAcc-arCoeff()-Z,4"        "tBodyAcc-correlation()-X,Y"    "tBodyAcc-correlation()-X,Z"    "tBodyAcc-correlation()-Y,Z"   
 [41] "tGravityAcc-mean()-X"          "tGravityAcc-mean()-Y"          "tGravityAcc-mean()-Z"          "tGravityAcc-std()-X"          
 [45] "tGravityAcc-std()-Y"           "tGravityAcc-std()-Z"           "tGravityAcc-mad()-X"           "tGravityAcc-mad()-Y"          
 [49] "tGravityAcc-mad()-Z"           "tGravityAcc-max()-X"           "tGravityAcc-max()-Y"           "tGravityAcc-max()-Z"          
 [53] "tGravityAcc-min()-X"           "tGravityAcc-min()-Y"           "tGravityAcc-min()-Z"           "tGravityAcc-sma()"            
 [57] "tGravityAcc-energy()-X"        "tGravityAcc-energy()-Y"        "tGravityAcc-energy()-Z"        "tGravityAcc-iqr()-X"          
 [61] "tGravityAcc-iqr()-Y"           "tGravityAcc-iqr()-Z"           "tGravityAcc-entropy()-X"       "tGravityAcc-entropy()-Y"      
 [65] "tGravityAcc-entropy()-Z"       "tGravityAcc-arCoeff()-X,1"     "tGravityAcc-arCoeff()-X,2"     "tGravityAcc-arCoeff()-X,3"    
 [69] "tGravityAcc-arCoeff()-X,4"     "tGravityAcc-arCoeff()-Y,1"     "tGravityAcc-arCoeff()-Y,2"     "tGravityAcc-arCoeff()-Y,3"    
 [73] "tGravityAcc-arCoeff()-Y,4"     "tGravityAcc-arCoeff()-Z,1"     "tGravityAcc-arCoeff()-Z,2"     "tGravityAcc-arCoeff()-Z,3"    
 [77] "tGravityAcc-arCoeff()-Z,4"     "tGravityAcc-correlation()-X,Y" "tGravityAcc-correlation()-X,Z" "tGravityAcc-correlation()-Y,Z"
 [81] "tBodyAccJerk-mean()-X"         "tBodyAccJerk-mean()-Y"         "tBodyAccJerk-mean()-Z"         "tBodyAccJerk-std()-X"         
 [85] "tBodyAccJerk-std()-Y"          "tBodyAccJerk-std()-Z"          "tBodyAccJerk-mad()-X"          "tBodyAccJerk-mad()-Y"         
 [89] "tBodyAccJerk-mad()-Z"          "tBodyAccJerk-max()-X"          "tBodyAccJerk-max()-Y"          "tBodyAccJerk-max()-Z"         
 [93] "tBodyAccJerk-min()-X"          "tBodyAccJerk-min()-Y"          "tBodyAccJerk-min()-Z"          "tBodyAccJerk-sma()"           
 [97] "tBodyAccJerk-energy()-X"       "tBodyAccJerk-energy()-Y"       "tBodyAccJerk-energy()-Z"       "tBodyAccJerk-iqr()-X"  




train_x <- read.table("D:/UCI HAR Dataset/train/X_train.txt", col.names = data, check.names = F)
train_y <- read.table("D:/UCI HAR Dataset/train/y_train.txt", col.names = c('activity'))
subject.train <- read.table("D:/UCI HAR Dataset/train/subject_train.txt", col.names = c('subject'))

test_x <- read.table("D:/UCI HAR Dataset/test/X_test.txt", col.names = data, check.names = F)
test_y <- read.table("D:/UCI HAR Dataset/test/Y_test.txt", col.names = c('activity'))
subject.test <- read.table("D:/UCI HAR Dataset/test/subject_test.txt", col.names = c('subject'))

act_labels <- read.table("D:/UCI HAR Dataset/activity_labels.txt", col.names = c('n','text'))


mergeddata <- cbind(rbind(train_x, test_x), rbind(train_y, test_y), rbind(subject.train, subject.test))

data1 <- mergeddata[, !duplicated(colnames(mergeddata))]

```

#2. Витягує лише вимірювання середнього значення та стандартного відхилення (mean and standard deviation) для кожного вимірювання.
```{r}
data2 <- select(data1,  matches("mean\\(\\)|std\\(\\)|subject|activity"))
head(data2,5)


  tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tBodyAcc-std()-X tBodyAcc-std()-Y tBodyAcc-std()-Z tGravityAcc-mean()-X
1         0.2885845       -0.02029417        -0.1329051       -0.9952786       -0.9831106       -0.9135264            0.9633961
2         0.2784188       -0.01641057        -0.1235202       -0.9982453       -0.9753002       -0.9603220            0.9665611
3         0.2796531       -0.01946716        -0.1134617       -0.9953796       -0.9671870       -0.9789440            0.9668781
4         0.2791739       -0.02620065        -0.1232826       -0.9960915       -0.9834027       -0.9906751            0.9676152
5         0.2766288       -0.01656965        -0.1153619       -0.9981386       -0.9808173       -0.9904816            0.9682244
  tGravityAcc-mean()-Y tGravityAcc-mean()-Z tGravityAcc-std()-X tGravityAcc-std()-Y tGravityAcc-std()-Z tBodyAccJerk-mean()-X
1           -0.1408397           0.11537494          -0.9852497          -0.9817084          -0.8776250            0.07799634
2           -0.1415513           0.10937881          -0.9974113          -0.9894474          -0.9316387            0.07400671
3           -0.1420098           0.10188392          -0.9995740          -0.9928658          -0.9929172            0.07363596
4           -0.1439765           0.09985014          -0.9966456          -0.9813928          -0.9784764            0.07732061
5           -0.1487502           0.09448590          -0.9984293          -0.9880982          -0.9787449            0.07344436
  tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z tBodyAccJerk-std()-X tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z tBodyGyro-mean()-X
1           0.005000803          -0.067830808           -0.9935191           -0.9883600           -0.9935750       -0.006100849
2           0.005771104           0.029376633           -0.9955481           -0.9810636           -0.9918457       -0.016111620
3           0.003104037          -0.009045631           -0.9907428           -0.9809556           -0.9896866       -0.031698294
4           0.020057642          -0.009864772           -0.9926974           -0.9875527           -0.9934976       -0.043409983
5           0.019121574           0.016779979           -0.9964202           -0.9883587           -0.9924549       -0.033960416
 tBodyGyro-mean()-Y tBodyGyro-mean()-Z tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z tBodyGyroJerk-mean()-X
1        -0.03136479         0.10772540        -0.9853103        -0.9766234        -0.9922053            -0.09916740
2        -0.08389378         0.10058429        -0.9831200        -0.9890458        -0.9891212            -0.11050283
3        -0.10233542         0.09612688        -0.9762921        -0.9935518        -0.9863787            -0.10848567
4        -0.09138618         0.08553770        -0.9913848        -0.9924073        -0.9875542            -0.09116989
5        -0.07470803         0.07739203        -0.9851836        -0.9923781        -0.9874019            -0.09077010
  tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z tBodyAccMag-mean()
1            -0.05551737            -0.06198580            -0.9921107            -0.9925193            -0.9920553         -0.9594339
2            -0.04481873            -0.05924282            -0.9898726            -0.9972926            -0.9938510         -0.9792892
3            -0.04241031            -0.05582883            -0.9884618            -0.9956321            -0.9915318         -0.9837031
4            -0.03633262            -0.06046466            -0.9911194            -0.9966410            -0.9933289         -0.9865418
5            -0.03763253            -0.05828932            -0.9913545            -0.9964730            -0.9945110         -0.9928271
  tBodyAccMag-std() tGravityAccMag-mean() tGravityAccMag-std() tBodyAccJerkMag-mean() tBodyAccJerkMag-std() tBodyGyroMag-mean()
1        -0.9505515            -0.9594339           -0.9505515             -0.9933059            -0.9943364          -0.9689591
2        -0.9760571            -0.9792892           -0.9760571             -0.9912535            -0.9916944          -0.9806831
3        -0.9880196            -0.9837031           -0.9880196             -0.9885313            -0.9903969          -0.9763171
4        -0.9864213            -0.9865418           -0.9864213             -0.9930780            -0.9933808          -0.9820599
5        -0.9912754            -0.9928271           -0.9912754             -0.9934800            -0.9958537          -0.9852037
 tBodyGyroMag-std() tBodyGyroJerkMag-mean() tBodyGyroJerkMag-std() fBodyAcc-mean()-X fBodyAcc-mean()-Y fBodyAcc-mean()-Z
1         -0.9643352              -0.9942478             -0.9913676        -0.9947832        -0.9829841        -0.9392687
2         -0.9837542              -0.9951232             -0.9961016        -0.9974507        -0.9768517        -0.9735227
3         -0.9860515              -0.9934032             -0.9950910        -0.9935941        -0.9725115        -0.9833040
4         -0.9873511              -0.9955022             -0.9952666        -0.9954906        -0.9835697        -0.9910798
5         -0.9890626              -0.9958076             -0.9952580        -0.9972859        -0.9823010        -0.9883694
  fBodyAcc-std()-X fBodyAcc-std()-Y fBodyAcc-std()-Z fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z
1       -0.9954217       -0.9831330       -0.9061650            -0.9923325            -0.9871699            -0.9896961
2       -0.9986803       -0.9749298       -0.9554381            -0.9950322            -0.9813115            -0.9897398
3       -0.9963128       -0.9655059       -0.9770493            -0.9909937            -0.9816423            -0.9875663
4       -0.9963121       -0.9832444       -0.9902291            -0.9944466            -0.9887272            -0.9913542
5       -0.9986065       -0.9801295       -0.9919150            -0.9962920            -0.9887900            -0.9906244
  fBodyAccJerk-std()-X fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z fBodyGyro-mean()-X fBodyGyro-mean()-Y fBodyGyro-mean()-Z
1           -0.9958207           -0.9909363           -0.9970517         -0.9865744         -0.9817615         -0.9895148
2           -0.9966523           -0.9820839           -0.9926268         -0.9773867         -0.9925300         -0.9896058
3           -0.9912488           -0.9814148           -0.9904159         -0.9754332         -0.9937147         -0.9867557
4           -0.9913783           -0.9869269           -0.9943908         -0.9871096         -0.9936015         -0.9871913
5           -0.9969025           -0.9886067           -0.9929065         -0.9824465         -0.9929838         -0.9886664
 fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z fBodyAccMag-mean() fBodyAccMag-std() fBodyBodyAccJerkMag-mean()
1        -0.9850326        -0.9738861        -0.9940349         -0.9521547        -0.9561340                 -0.9937257
2        -0.9849043        -0.9871681        -0.9897847         -0.9808566        -0.9758658                 -0.9903355
3        -0.9766422        -0.9933990        -0.9873282         -0.9877948        -0.9890155                 -0.9892801
4        -0.9928104        -0.9916460        -0.9886776         -0.9875187        -0.9867420                 -0.9927689
5        -0.9859818        -0.9919558        -0.9879443         -0.9935909        -0.9900635                 -0.9955228
  fBodyBodyAccJerkMag-std() fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std() fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()
1                -0.9937550              -0.9801349             -0.9613094                  -0.9919904                 -0.9906975
2                -0.9919603              -0.9882956             -0.9833219                  -0.9958539                 -0.9963995
3                -0.9908667              -0.9892548             -0.9860277                  -0.9950305                 -0.9951274
4                -0.9916998              -0.9894128             -0.9878358                  -0.9952207                 -0.9952369
5                -0.9943890              -0.9914330             -0.9890594                  -0.9950928                 -0.9954648
  activity subject
1        5       1
2        5       1
3        5       1
4        5       1
5        5       1
```
#3. Використовує описові назви діяльностей (activity) для найменування діяльностей у наборі даних.
```{r}
data3 <- within(data2, activity <- factor(activity, labels = act_labels[,2]))

```
#4. Відповідно присвоює змінним у наборі даних описові імена.
```{r}
data4 <- aggregate(x = data3[, -c(67,68)], by = list(data3[,'subject'], data3[, 'activity']), FUN = mean)
```

#5. З набору даних з кроку 4 створити другий незалежний акуратний набір даних (tidy dataset) 
#із середнім значенням для кожної змінної для кожної діяльності та кожного суб’єкту (subject)
```{r}
write.csv(data4, "tidy_dataset.csv", row.names=F)
setwd("D:/")
```
