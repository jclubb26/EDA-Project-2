setwd("C://Users/FIRSTBEAT/Documents/R/Coursera/EDA Assignment/Emissions Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BA2 <- NEI[NEI$fips == "24510" & grepl("^ON-ROAD", NEI$type),] 

library(ggplot2)
png('plot5.png')
ggplot(BA2, aes(factor(year), Emissions)) + 
  geom_bar(aes(fill = year), stat = "identity") + 
  xlab("Year") + 
  ylab("PM2.5 Emissions (tons)") + 
  ggtitle("Baltimore City Emissions by Motor Vehicles Sources")
dev.off()