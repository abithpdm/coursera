
best<-function(state,outcome)
{
  #read the csv file
 hospitaldata<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
 
   #set index for the diseases already mentioned
  soutcome <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  
  # check if both state and outcomes present in the data file
  
  if (any(names(soutcome)==outcome)== FALSE){stop("Invalid outcome")}
  if(any(hospitaldata$State==state)==FALSE){ stop("Invalid state")}
 
   #seperate hospital with given state
  
  states <- subset(hospitaldata,hospitaldata$State==state)
  
  #retreive name of the hospital with the condition
  
 hospname <-which.min(states[,soutcome[outcome]])
 states[hospname,]$Hospital.Name


 
  
  
}

