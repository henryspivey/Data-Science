NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 3
library(gridExtra)
baltimore_1999 <- baltimore %>% filter(year == 1999)
plot1 <- ggplot(baltimore_1999, aes(x=log10(Emissions))) + geom_histogram(aes(fill=type)) + ggtitle('1999')

baltimore_2002 <- baltimore %>% filter(year == 2002)
plot2 <- ggplot(baltimore_2002, aes(x=log10(Emissions))) + geom_histogram(aes(fill=type)) + ggtitle('2002')

baltimore_2005 <- baltimore %>% filter(year == 2005)
plot3 <- ggplot(baltimore_2005, aes(x=log10(Emissions))) + geom_histogram(aes(fill=type))+ ggtitle('2005')

baltimore_2008 <- baltimore %>% filter(year == 2008)
plot4 <- ggplot(baltimore_2008, aes(x=log10(Emissions))) + geom_histogram(aes(fill=type))+ ggtitle('2008')

g<-arrangeGrob(plot1, plot2, plot3, plot4,ncol=2)
ggsave(file="plot3.png", g,width = 8, height = 10)
