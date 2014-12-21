setwd("D:/Course_Project2")

# Loads RDS
PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

MD <- subset(PM25, fips == '24510')  ## Baltimore City

png(filename = 'plot2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum),
        main = 'Total Emission in Baltimore City, MD',
        xlab = 'Year',
        ylab = expression('PM'[2.5]))
dev.off()
