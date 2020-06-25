#reading csv , use download.package() using url prior importing csv file
datafile <- read.csv("commundata.csv")
count<-sum(datafile$VAL==24,na.rm = T)

#read excel file
dat <- read.xlsx("govdata.xlsx",sheetIndex = 1,colIndex = 7:15,rowIndex = 18:23)
#read xml file 
xmlfile <- xmlTreeParse("xmldata.xml",useInternalNodes= TRUE)
rootnode <-xmlRoot(xmlfile)
postcode <- xpathSApply(rootnode,"//zipcode==21231",xmlValue)
table(postcode==21231)

#using fread to read data
DT<- fread("americandata.csv")