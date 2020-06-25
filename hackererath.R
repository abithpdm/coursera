cat("")
testcase <- readline(prompt = "")
for (case in testcase)
{
  result <- as.numeric(readline(prompt = ""));
  base<- as.numeric(readline(prompt = ""))
  power<- as.numeric(1)
  count <- 1
  flag <-0
  rescheck<-as.numeric(c(result))
  while(flag==0){
    if (sum(rescheck)==result)
      {print(count)
    break}
    else
    {
      
      power <- power+1
      val <- base^power
      rescheck<-c(rescheck,value)
      count<-count+1
    } 
    
  }
  
}
