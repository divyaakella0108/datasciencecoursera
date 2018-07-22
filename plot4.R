> png(file="C:/Users/212470996/Desktop/datasciencecoursera/plot4.png",width=480, height=480)
> par(mfrow=c(2,2))
> plot(hpc_finalset$DT,hpc_finalset$Global_active_power, type = "l", xlab="", ylab="Global Active Power", ylim = c(0,6) , yaxt = "n")
> axis(side=2, at=c(0,2,4,6))
> 
  > plot(hpc_finalset$DT,hpc_finalset$Voltage, type = "l", ylim=c(234,246), yaxt="n",ylab="voltage", xlab="datetime")
> 
  > axis(side=2,at=c(234,238,242,246))
> plot(hpc_finalset$DT,hpc_finalset$Sub_metering_2, type = "n", ylim=c(0,30), yaxt="n",ylab = "Eneryg Sub Metering")
> axis(side=2,at=c(0,10,20,30))
> lines(hpc_finalset$DT,hpc_finalset$Sub_metering_1, col ="black", type="l")
> lines(hpc_finalset$DT,hpc_finalset$Sub_metering_2, col ="red", type="l")
> lines(hpc_finalset$DT,hpc_finalset$Sub_metering_3, col ="blue", type="l")
> legend ("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col=c("black","red","blue"))
> 
  > plot(hpc_finalset$DT,hpc_finalset$Global_reactive_power, type = "l", ylim=c(0.1,0.5), yaxt="n",ylab="Global_reactive_power", xlab="datetime")
> axis(side=2,at=c(0.1,0.2,0.3,0.4,0.5))
> dev.off()
RStudioGD 
2 