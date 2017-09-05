setwd("C://Users/FIRSTBEAT/Documents/R/Coursera/EDA Assignment/Emissions Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BA <- NEI[NEI$fips == "24510",]
E2 <- tapply(X = BA$Emissions, BA$year, FUN = sum)

png('plot2.png')
bp2 <- barplot(E2, xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)", 
        main = "Total PM2.5 Emissions in Tons for \nBaltimore City, Maryland by Year")
text(bp2, 0, round(E2, 0), cex = 1, pos = 3)
dev.off()