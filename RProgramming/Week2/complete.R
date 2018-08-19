complete <- function (directory, id = 1:332)
  
{
  file_list <- list.files(directory, full.names = TRUE)
  #print(file_list)
  Val <- data.frame()
  good_count <- data.frame()
  
  for(i in id)
    
  {
    
    #dat <- file_list
    dat <- read.csv(file_list[i], na.strings = 'NA')
   # good <- as.numeric(complete.cases(dat))
    good_count <- sum(as.numeric(complete.cases(dat)))
    Val <- paste ( as.numeric(i) , as.numeric(good_count), sep = "  ")
    print(Val)
    
  }
 
 
}

