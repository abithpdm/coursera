rankhospital <- function(state ,outcome ,num="best")
{
  hospitaldata <-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  soutcome <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  if (any(names(soutcome)==outcome)==FALSE){stop("Invalid Outcome")}
  if(any(hospitaldata$State==state)==FALSE){stop("Invalid State")}
  states <-subset(hospitaldata,hospitaldata$State==state)
 sortedlist <- order(states[,soutcome[outcome]])
 if(num=="best")
 {
   index<-1
 }
 else if (num=="worst")
 {
   index<-length(sortedlist)
 }
 else
 {
   index<-num
 }
 print(sortedlist)

 
 
}
