setwd("C:/Users/212470996/Desktop/dataset")

if(!exists("NEI"))
{ NEI <- readRDS("./summarySCC_PM25.rds")}

if(!exists("SCC"))
{SCC <- readRDS("./Source_Classification_Code.rds")}

#Find subset of NEI where  fips == "24510" & type =="ON-ROAD"
NEI_sub <-   subset(NEI, fips == "24510" & type =="ON-ROAD")


#Get the sum total of Emission per Year 
Emissions_Total <- aggregate(Emissions ~ year, NEI_sub, sum)

png(file="C:/Users/212470996/Desktop/Master_Repo/datasciencecoursera/ExploratoryAnalysis/Week4/Plot5.png",width=480, height=480)

plot(Emissions_Total$year, Emissions_Total$Emissions,col = "red",pch=19)

dev.off()