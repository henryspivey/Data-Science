#1
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png("plot1.png", width = 480, height = 480,units = "px")
boxplot(log10(Emissions) ~ year, NEI, main="Total Emissions (1999 - 2008)")
dev.off()
