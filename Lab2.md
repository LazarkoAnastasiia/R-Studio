## В цій лабораторній роботі побудуємо за даними детектора гравітаційних волн LIGO графік злиття двох нейтронних зір. Подія GW170817 
## https://uk.wikipedia.org/wiki/GW170817. Лабораторну роботу створено на основі https://losc.ligo.org/tutorial00/
#1. Завантажте файл з даними за посиланням https://dcc.ligo.org/public/0146/P1700337/001/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5 
#2. Встановить в R пакет для роботи з HDF5 файлами.
#3. Виведіть зміст файлу командою h5ls().

install.packages("BiocManager")
BiocManager::install("rhdf5", force = TRUE)
library(rhdf5)
h5ls('D:/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5',all=TRUE)

#4.Зчитайте результати вимірів. Для цього зчитайте name Strain з групи strain в змінну strain.

strain <- h5read("D:/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", "strain/Strain")
strain

#5.Також з «strain/Strain» зчитайте атрибут (функція h5readAttributes) Xspacing в змінну st та виведіть її. Це інтервал часу між вимірами.

st <- h5readAttributes("D:/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", "/strain/Strain")$Xspacing
st

# 6.Знайдіть час початку події та її тривалість. Для цього з групи meta зчитайте в змінну gpsStart name GPSstart та в змінну duration name Duration.

gpsStart <- h5read("D:/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", "meta/GPSstart")
duration <- h5read("D:/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", "meta/Duration")
print(gpsStart)
print(duration)

# 7.Знайдіть час закінчення події та збережіть його в змінну gpsEnd.

gpsEnd <- gpsStart + duration
gpsEnd

# 8. Створіть вектор з часу вимірів і збережіть у змінну myTime. Початок послідовності – gpsStart, кінець – gpsEnd, крок – st.

myTime <- seq(gpsStart, gpsEnd, st)
tail(myTime, 5)
head(myTime, 5)

# 9. Побудуємо графік тільки для першого мільйону вимірів. Для цього створіть змінну numSamples, яка дорівнює 1000000.

numSamples = 1000000
numSamples

# 10. Побудуйте графік за допомогою функції plot(myTime[0:numSamples], strain[0:numSamples], type = “l”, xlab = “GPS Time (s)”, ylab = “H1 Strain”)

plot(myTime[0:numSamples], strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")
