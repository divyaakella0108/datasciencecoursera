> png(file="C:/Users/212470996/Desktop/datasciencecoursera/plot3.png",width=480, height=480)
> plot(hpc_finalset$DT,hpc_finalset$Sub_metering_2, type = "n", ylim=c(0,30), yaxt="n",ylab="Energy sub metering", xlab="")
> lines(hpc_finalset$DT,hpc_finalset$Sub_metering_1, col ="black", type="l")
> 
> lines(hpc_finalset$DT,hpc_finalset$Sub_metering_2, col ="red", type="l")
> 
> lines(hpc_finalset$DT,hpc_finalset$Sub_metering_3, col ="blue", type="l")
> legend ("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col=c("black","red","blue"))
> dev.off()
RStudioGD 
        2 