## В цій лабораторній роботі побудуємо за даними детектора гравітаційних волн LIGO графік злиття двох нейтронних зір. Подія GW170817 
## https://uk.wikipedia.org/wiki/GW170817. Лабораторну роботу створено на основі https://losc.ligo.org/tutorial00/
# 1. Завантажте файл з даними за посиланням https://dcc.ligo.org/public/0146/P1700337/001/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5 
# 2. Встановить в R пакет для роботи з HDF5 файлами.
# 3. Виведіть зміст файлу командою h5ls().

```{r}
install.packages("BiocManager")
BiocManager::install("rhdf5", force = TRUE)
library(rhdf5)
h5ls('D:/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5',all=TRUE)

                 group            name         ltype cset       otype num_attrs  dclass          dtype  stype rank      dim   maxdim
0                    /            meta H5L_TYPE_HARD    0   H5I_GROUP         0                                  0                  
1                /meta     Description H5L_TYPE_HARD    0 H5I_DATASET         0  STRING     H5T_STRING SCALAR    0    ( 0 )    ( 0 )
2                /meta  DescriptionURL H5L_TYPE_HARD    0 H5I_DATASET         0  STRING     H5T_STRING SCALAR    0    ( 0 )    ( 0 )
3                /meta        Detector H5L_TYPE_HARD    0 H5I_DATASET         0  STRING     H5T_STRING SCALAR    0    ( 0 )    ( 0 )
4                /meta        Duration H5L_TYPE_HARD    0 H5I_DATASET         0 INTEGER  H5T_STD_I64LE SCALAR    0    ( 0 )    ( 0 )
5                /meta        GPSstart H5L_TYPE_HARD    0 H5I_DATASET         0 INTEGER  H5T_STD_I64LE SCALAR    0    ( 0 )    ( 0 )
6                /meta     Observatory H5L_TYPE_HARD    0 H5I_DATASET         0  STRING     H5T_STRING SCALAR    0    ( 0 )    ( 0 )
7                /meta            Type H5L_TYPE_HARD    0 H5I_DATASET         0  STRING     H5T_STRING SCALAR    0    ( 0 )    ( 0 )
8                /meta        UTCstart H5L_TYPE_HARD    0 H5I_DATASET         0  STRING     H5T_STRING SCALAR    0    ( 0 )    ( 0 )
9                    /         quality H5L_TYPE_HARD    0   H5I_GROUP         0                                  0                  
10            /quality          detail H5L_TYPE_HARD    0   H5I_GROUP         0                                  0                  
11            /quality      injections H5L_TYPE_HARD    0   H5I_GROUP         0                                  0                  
12 /quality/injections InjDescriptions H5L_TYPE_HARD    0 H5I_DATASET         0  STRING     H5T_STRING SIMPLE    1        5        5
13 /quality/injections   InjShortnames H5L_TYPE_HARD    0 H5I_DATASET         0  STRING     H5T_STRING SIMPLE    1        5        5
14 /quality/injections         Injmask H5L_TYPE_HARD    0 H5I_DATASET         8 INTEGER  H5T_STD_U32LE SIMPLE    1     4096     4096
15            /quality          simple H5L_TYPE_HARD    0   H5I_GROUP         0                                  0                  
16     /quality/simple  DQDescriptions H5L_TYPE_HARD    0 H5I_DATASET         0  STRING     H5T_STRING SIMPLE    1        7        7
17     /quality/simple    DQShortnames H5L_TYPE_HARD    0 H5I_DATASET         0  STRING     H5T_STRING SIMPLE    1        7        7
18     /quality/simple          DQmask H5L_TYPE_HARD    0 H5I_DATASET         8 INTEGER  H5T_STD_U32LE SIMPLE    1     4096     4096
19                   /          strain H5L_TYPE_HARD    0   H5I_GROUP         0                                  0                  
20             /strain          Strain H5L_TYPE_HARD    0 H5I_DATASET         7   FLOAT H5T_IEEE_F64LE SIMPLE    1 16777216 16777216
```
# 4.Зчитайте результати вимірів. Для цього зчитайте name Strain з групи strain в змінну strain.
```{r}
strain <- h5read("D:/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", "strain/Strain")
head(strain,5)

[1] -2.391646e-18 -2.411660e-18 -2.427382e-18 -2.426351e-18 -2.427996e-18
```
# 5.Також з «strain/Strain» зчитайте атрибут (функція h5readAttributes) Xspacing в змінну st та виведіть її. Це інтервал часу між вимірами.
```{r}
st <- h5readAttributes("D:/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", "/strain/Strain")$Xspacing
st

[1] 0.0002441406
```
# 6.Знайдіть час початку події та її тривалість. Для цього з групи meta зчитайте в змінну gpsStart name GPSstart та в змінну duration name Duration.
```{r}
gpsStart <- h5read("D:/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", "meta/GPSstart")
duration <- h5read("D:/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", "meta/Duration")
print(gpsStart)
print(duration)

[1] 1187006834
[1] 4096
```
# 7.Знайдіть час закінчення події та збережіть його в змінну gpsEnd.
```{r}
gpsEnd <- gpsStart + duration
gpsEnd

[1] 1187010930
```
# 8. Створіть вектор з часу вимірів і збережіть у змінну myTime. Початок послідовності – gpsStart, кінець – gpsEnd, крок – st.
```{r}
myTime <- seq(gpsStart, gpsEnd, st)
tail(myTime, 5)
head(myTime, 5)

[1] 1187010930 1187010930 1187010930 1187010930 1187010930

[1] 1187006834 1187006834 1187006834 1187006834 1187006834
```
# 9. Побудуємо графік тільки для першого мільйону вимірів. Для цього створіть змінну numSamples, яка дорівнює 1000000.
```{r}
numSamples = 1000000
numSamples

[1] 1e+06
```
# 10. Побудуйте графік за допомогою функції plot(myTime[0:numSamples], strain[0:numSamples], type = “l”, xlab = “GPS Time (s)”, ylab = “H1 Strain”)
```{r}
plot(myTime[0:numSamples], strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")

![image](https://user-images.githubusercontent.com/81391791/201246849-bd3c7bd9-cd63-449d-a852-283aa860e288.png)


```
