rankhospital <- function(state ,outcome ,num="best")
{
  hospitaldata <-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  soutcome <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  if (any(names(soutcome)==outcome)==FALSE){stop("Invalid Outcome")}
  if(any(hospitaldata$State==state)==FALSE){stop("Invalid State")}
}
