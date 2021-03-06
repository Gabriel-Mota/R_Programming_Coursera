complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  setwd(directory)
  
  id2 <- NULL
  nobs <- NULL
  
  for(i in id){
    ##Read files
    if(i<100){
      i <- formatC(i, digits=2, flag="0")
      i<-paste(i, ".csv", sep ="")
    }
    else{
      i<-paste(i, ".csv", sep = "")
    }
    x <- read.csv(i)

    y <- x[complete.cases(x),]
    id2 <- c(id2, i)
    nobs <- c(nobs, nrow(y))
  }
  
  z <- data.frame(id, nobs)
  z
  
}