#R script to rank all thospitals based on outcome in every state
rankall<-function(outcome,num="best")
{
  hospitaldata <-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  #create a table of all states in the data file
  statelist <-data.frame(States = names(tapply(hospitaldata$State, hospitaldata$State, length)),Freq = tapply(hospitaldata$State,hospitaldata$State,length))
  row.names(hospitaldata)<-NULL
  
  inputdf <- data.frame(Outcome=c("heart attack", "heart failure", "pneumonia"), 
                        Col = c(11, 17, 23))
  if(nrow(inputdf[inputdf$Outcome==outcome,])==0)
    stop("Invalid outcome")
  for (statename in statelist$States)
  {
    #creates a dataframe of individual states
    statedataframe <- hospitaldata[hospitaldata$State==statename]
    colnumber <- inputdf[inputdf$Outcome==outcome,2]
    #remove incomplete rows
    statedataframe <- statedataframe[complete.cases(statedataframe[,colnumber])]
  }
  
  
}