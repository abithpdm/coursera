
best<-function(state,outcome)
{
  #read the csv file
  hospitaldata<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  #set index for the diseases already mentioned
  soutcome <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  if (any(names(soutcome)==outcome)== FALSE){stop("Invalid outcome")}
  if(any(hospitaldata$State==state)==FALSE){ stop("Invalid state")}
  #yields hospital with given state
  hosp<-c()
  states <- subset(hospitaldata,hospitaldata$State==state)
 hospname <-which.min(states[,soutcome[outcome]])
 states[hospname,]$Hospital.Name


 
  
  
}

