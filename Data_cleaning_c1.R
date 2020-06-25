file<-read.csv("datacleaning.csv")
count <- sum(file$VAL==24,na.rm = T)

xcelfiel <- read_excel("gasfile.xlsx")
dat<-xcelfiel[18:23,7:15]
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xmlfile <- xmlParse(url)
#install and load package data.frame
DT <- fread("commundata.csv")

