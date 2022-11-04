#1. За допомогою download.file() завантажте любий excel файл з порталу 
#http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому  встановить mode = “wb”. Виведіть перші 6 строк отриманого фрейму даних.

install.packages("openxlsx")
library(openxlsx)
download.file('https://data.gov.ua/dataset/c445c6ea-f0c3-4167-abb1-5afb4a0e5499/resource/d55eebcf-4660-4919-96b3-4894be5a6cda/download/nuclear_safety_q4_2021.xlsx', 
destfile = "D:/data_lab1.xlsx", mode = "wb")
data11=read.xlsx("D:/data_lab1.xlsx")
head(data11,6)

#2 За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за посиланням  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv та 
#завантажте дані в R. Code book, що пояснює значення змінних  знаходиться за посиланням https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0 
#Необхідно знайти, скільки property мають value $1000000+

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', destfile = "D:/data2.csv")
data2=read.csv('data2.csv')
head(data2)
val24<-which(data2$VAL==24)
length(val24)

#Зчитайте xml файл за посиланням http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml Скільки ресторанів мають zipcode 21231?

install.packages("XML")
library(XML)
data3=xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternal=TRUE)
rootNode<-xmlRoot(data3)
rootNode[[1]][[1]]
sum(xpathSApply(xmlRoot(data3), "//zipcode", xmlValue)==21231)
