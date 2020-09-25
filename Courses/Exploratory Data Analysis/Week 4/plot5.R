NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#5 
motor_vehicle_data <- SCC[grep("[Vv]ehicle", SCC$Short.Name),]
baltimore_motor_vehicle <- baltimore %>% filter(SCC %in% motor_vehicle_data$SCC)
png("plot5.png", width = 480, height = 480,units = "px")
with(baltimore_motor_vehicle, boxplot(log10(Emissions) ~ year,main="Baltimore"))
dev.off()