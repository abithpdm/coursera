#reading csv , use download.package() using url prior importing csv file
datafile <- read.csv("commundata.csv")
count<-sum(datafile$VAL==24,na.rm = T)

dat <- read.xlsx("govdata.xlsx",sheetIndex = 1,colIndex = 7:15,rowIndex = 18:23)
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xmlfile <- xmlTreeParse("xmldata.xml",useInternalNodes= TRUE)
rootnode <-xmlRoot(xmlfile)
postcode <- xpathSApply(rootnode,"//zipcode",xmlValue)