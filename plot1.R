setwd("C://Users/FIRSTBEAT/Documents/R/Coursera/EDA Assignment/Emissions Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

E1 <- tapply(X = NEI$Emissions, NEI$year, FUN = sum)

png('plot1.png')
bp <- barplot(E1, xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)", 
        main = "Total PM2.5 Emissions in Tons from All Sources by Year")
text(bp, 0, round(E1, 0), cex = 1, pos = 3)
dev.off()