setwd("C://Users/FIRSTBEAT/Documents/R/Coursera/EDA Assignment/Emissions Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(x = NEI, y = SCC, by = "SCC")

coal <- grepl("Fuel Comb.*Coal", NEISCC$EI.Sector)
NEICoal <- subset(NEISCC, coal, SCC:EI.Sector)

E2 <- tapply(X = NEICoal$Emissions, NEICoal$year, FUN = sum)

png('plot4.png')
bp <- barplot(E2, xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)", 
              main = "Total PM2.5 Emissions Across the US from Coal Sources",
              col = topo.colors(4))
text(bp, 0, round(E2, 0), cex = 1, pos = 3)
dev.off()