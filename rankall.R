#R script to rank all thospitals based on outcome in every state based
rankall<-function(outcome,ranknum="best")
{
  hospitaldata <-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  #create a table of all states in the data file so to obtain number of unique states
  statelist <-data.frame(States = names(tapply(hospitaldata$State, hospitaldata$State, length)),Freq = tapply(hospitaldata$State,hospitaldata$State,length))
  row.names(hospitaldata)<-NULL
  
  inputdf <- data.frame(Outcome=c("heart attack", "heart failure", "pneumonia"), 
                        Col = c(11, 17, 23))
  if(nrow(inputdf[inputdf$Outcome==outcome,])==0)
    stop("Invalid outcome")
  hospitalname <- character(0)
  for (statename in statelist$States)
  {
  
    #creates a dataframe for single state
    statedataframe <- hospitaldata[hospitaldata$State==statename,]
    colnumber <- inputdf[inputdf$Outcome==outcome,2]
    #remove incomplete rows
    statedataframe <- statedataframe[complete.cases(statedataframe[,colnumber]),]
    statedataframe<-statedataframe[order(statedataframe[,colnumber],statedataframe$Hospital.Name),]
    
    #we declare rank number inside this for loop because rank for worst case varies according to size of df
    if (ranknum=="best")
      ranknum<-1
    else if (ranknum=="worst")
      ranknum<-nrow(statedataframe)
    else
      ranknum <-suppressWarnings(as.numeric(ranknum))
    #store the hospital names and rank
    hospitalname <- c(hospitalname,statedataframe[ranknum,]$Hospital.Name)
  }
  return(data.frame(hospital = hospitalname ,state = statelist$States))
  
}