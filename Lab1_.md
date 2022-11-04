download.file('https://data.gov.ua/dataset/83464a4f-f8cd-42e6-8b2b-5b16abc6acc3/resource/28ebc80a-d156-4721-9598-e2be45481acd/download/coal_production_2021_10.xlsx', destfile = "D:/data11.xlsx",mode = "wb")

data1<-readRDS('D:/data11.xlsx')

tail(data1,5)


download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', destfile = "./data2.csv")
data2=read.csv('data2.csv')
head(data2)
val24<-which(data2$VAL==24)
length(val24)

data3=xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternal=TRUE)
rootNode=xmlRoot(data3)
xmlName(rootNode)
rootNode[[1]][[1]]
sum(xpathSApply(xmlRoot(data3), "//zipcode", xmlValue)==21231)
