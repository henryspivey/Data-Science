NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# 4 
coal_data <- SCC[grep("[Cc]oal",SCC$Short.Name),]
us_coal_only <- NEI %>% filter(SCC %in% coal_data$SCC)
head(coal)
g <- ggplot(coal, aes(x=year, y=log10(Emissions))) + geom_point() + geom_smooth() + ggtitle("Emissions from Coal Combustion sources")
ggsave(file="plot4.png", g, width = 8,height = 10)