# To compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles 

setwd("C:/Users/212470996/Desktop/dataset")

if(!exists("NEI"))
{ NEI <- readRDS("./summarySCC_PM25.rds")}

if(!exists("SCC"))
{SCC <- readRDS("./Source_Classification_Code.rds")}

#get the subsets of Baltimore & LA Data
NEI_BC <-   subset(NEI, fips == "24510" & type =="ON-ROAD")
NEI_LA <-   subset(NEI, fips == "06037" & type =="ON-ROAD")

#Get the sum total of Emission per Year for Balimore & LA.  
#Add new column to identify the cities
Emissions_Total_BC <- cbind(aggregate(Emissions ~ year, NEI_BC, sum),city = "Baltimore")
Emissions_Total_LA <- cbind(aggregate(Emissions ~ year, NEI_LA, sum),city = "Los Angeles")

#Use rbind to join the datasets.
Emissions_Total <- rbind(Emissions_Total_BC,Emissions_Total_LA )

png(file="C:/Users/212470996/Desktop/Master_Repo/datasciencecoursera/ExploratoryAnalysis/Week4/Plot6.png",width=480, height=480)


qplot( year,Emissions,data = Emissions_Total, color = city, size = 1, main = "Comparison of Total Annual Vehicle Emissions in Baltimore and Los Angeles")

dev.off()