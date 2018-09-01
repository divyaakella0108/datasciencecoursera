#To find if the four types of sources (point, nonpoint, onroad, nonroad)
#seen decreases in emissions from 1999-2008 for Baltimore City.


setwd("C:/Users/212470996/Desktop/dataset")

if(!exists("NEI"))
{ NEI <- readRDS("./summarySCC_PM25.rds")}

if(!exists("SCC"))
{SCC <- readRDS("./Source_Classification_Code.rds")}

#Find the emissions for Baltimore City
NEI_Sub <- subset(NEI, fips == "24510")

# Ensure to find the sum total of emissions aggregated by year & type
Emissions_Total <- aggregate(Emissions ~ year+type, NEI_Sub, sum)

png(file="C:/Users/212470996/Desktop/Master_Repo/datasciencecoursera/ExploratoryAnalysis/Week4/Plot3.png",width=480, height=480)

qplot( year,Emissions,data = Emissions_Total, color = year, facets = .~type, size = 1, main = "Total Annual Emissions in Baltimore by Year")

dev.off()