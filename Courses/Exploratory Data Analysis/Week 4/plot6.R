#6

los_angeles_motor_vehicle <- NEI %>% filter(fips == '06037') %>% filter(SCC %in% motor_vehicle_data$SCC)
png("plot6.png", width = 480, height = 480,units = "px")
par(mfrow=c(2,1), mar=c(2,2,2,2))
with(baltimore_motor_vehicle, boxplot(log10(Emissions) ~ year, main="Baltimore"))
with(los_angeles_motor_vehicle, boxplot(log10(Emissions) ~ year,main="Los Angeles"))
dev.off()