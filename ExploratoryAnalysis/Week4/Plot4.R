#To find across the United States, how have emissions from coal
#combustion-related sources changed from 1999-2008

setwd("C:/Users/212470996/Desktop/dataset")

if(!exists("NEI"))
{ NEI <- readRDS("./summarySCC_PM25.rds")}

if(!exists("SCC"))
{SCC <- readRDS("./Source_Classification_Code.rds")}

#Find coal combustion-related sources from SCC Dataset
SCC_sub <- SCC[grepl("coal", SCC$EI.Sector,ignore.case=TRUE ),]

#Merge NEI & SCC_sub Datasets
NEI_SCC <- merge(NEI, SCC_sub, by="SCC")

#Find the Emissions Sum Total
Emissions_Total <- aggregate(Emissions ~ year, NEI_SCC, sum)

png(file="C:/Users/212470996/Desktop/Master_Repo/datasciencecoursera/ExploratoryAnalysis/Week4/Plot4.png",width=480, height=480)

plot(Emissions_Total$year, Emissions_Total$Emissions,col = "red",pch=19)

dev.off()