> png(file="C:/Users/212470996/Desktop/datasciencecoursera/plot2.png",width=480, height=480)
> plot(hpc_finalset$DT,hpc_finalset$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)", ylim = c(0,6) , yaxt = "n")
> axis(side=2, at=c(0,2,4,6))
> 
  > dev.off()
RStudioGD 
2 