rankhospital <- function(state ,outcome ,num="best")
{
  #use string as factor while reading the csv
  hospitaldata <-read.csv("outcome-of-care-measures.csv",colClasses = "character",na.strings = c("NA","Not Available"),stringsAsFactors = FALSE)
  soutcome <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  if (any(names(soutcome)==outcome)==FALSE){stop("Invalid Outcome")}
  if(any(hospitaldata$State==state)==FALSE){stop("Invalid State")}
  states<-data.frame()
  states <-subset(hospitaldata,hospitaldata$State==state)
  sortedlist <- states[order(as.integer(states[,soutcome[outcome]]),states$Hospital.Name),]
  #sortedlist <- states[order(states[,soutcome[outcome]],states$Hospital.Name),]
  sortedlist<-sortedlist[complete.cases(sortedlist[,soutcome[outcome]])]
  
  if(num=="best")
 {
   index<-1
 }
 else if (num=="worst")
 {
   index<-as.numeric(nrow(sortedlist))
 }
 else
 {
   index<-num
 }
sortedlist

}
