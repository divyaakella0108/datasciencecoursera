<- read.table("C:/Users/212470996/Desktop/datasciencecoursera/household_power_consumption.txt", header = TRUE, sep =";")
> finaldata <- subset(hpc, (as.Date(as.character(hpc$Date) , "%m/%d/%Y") >= "2007-2-1")& (as.Date(as.character(hpc$Date) , "%m/%d/%Y") <= "2007-2-2"))
> head(finaldata)
          Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2
23437 2/1/2007 00:00:00               0.442                 0.122 241.060            1.800          0.000          0.000
23438 2/1/2007 00:01:00               0.370                 0.000 241.220            1.600          0.000          0.000
23439 2/1/2007 00:02:00               0.368                 0.000 241.030            1.600          0.000          0.000
23440 2/1/2007 00:03:00               0.370                 0.000 241.410            1.600          0.000          0.000
23441 2/1/2007 00:04:00               0.370                 0.000 241.220            1.600          0.000          0.000
23442 2/1/2007 00:05:00               0.368                 0.000 241.030            1.600          0.000          0.000
      Sub_metering_3
23437              0
23438              0
23439              0
23440              0
23441              0
23442              0
> GlobalActivePowerKW <- as.numeric(as.character(finaldata$Global_active_power))
> png(file="C:/Users/212470996/Desktop/datasciencecoursera/plot1.png",width=480, height=480)
>  hist(GlobalActivePowerKW, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", xlim = c(0,6), xaxt = "n", breaks =13)
> axis(side=1, at=c(0,2,4,6))
> dev.off()
windows 
      2 
> 
