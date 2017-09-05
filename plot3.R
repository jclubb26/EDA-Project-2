setwd("C://Users/FIRSTBEAT/Documents/R/Coursera/EDA Assignment/Emissions Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BA <- NEI[NEI$fips == "24510",]

BA$type <- as.factor(BA$type)
BA$year <- as.factor(BA$year)

library(ggplot2)
png('plot3.png')
g <- qplot(x = year, y = Emissions, data = BA, facets = . ~ type,
           main = "Baltimore City Emissions by Type", xlab = "Year", 
           ylab = "PM2.5 Emissions (tons)")
g + geom_bar(aes(fill = type), stat = "identity")
dev.off()