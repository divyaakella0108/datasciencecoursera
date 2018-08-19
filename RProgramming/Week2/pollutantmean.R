pollutantmean <- function(directory, pollutant, id = 1:332)
{
  #sensor1 <- read.csv("./specdata/001.csv",header=TRUE)[,"nitrate"]
  #print(mean(sensor1,na.rm = TRUE))
  
  #folder <- "C:/Users/212470996/Desktop/spec"
  file_list <- list.files(directory, full.names=TRUE)
  #print(file_list)
  dat<-data.frame()
      for (i in id)
          {
         
          dat <- rbind(dat,read.csv(file_list[i]))
          
      }
 
dat_subset <- dat[,pollutant]   #subsets the rows that match the 'day' argument
  print(mean(dat_subset, na.rm=TRUE)  )
 
}