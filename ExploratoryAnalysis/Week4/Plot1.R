# To find if  total emissions from PM2.5 decreased in the United States from 1999 to 2008.

setwd("C:/Users/212470996/Desktop/dataset")

if(!exists("NEI"))
{ NEI <- readRDS("./summarySCC_PM25.rds")}

if(!exists("SCC"))
{SCC <- readRDS("./Source_Classification_Code.rds")}


#Get the sum total of Emission per Year 
Emissions_Total <- aggregate(Emissions ~ year, NEI, sum)

png(file="C:/Users/212470996/Desktop/Master_Repo/datasciencecoursera/ExploratoryAnalysis/Week4/Plot1.png",width=480, height=480)
plot(Emissions_Total$year, Emissions_Total$Emissions,col = "red",pch=19)
dev.off()