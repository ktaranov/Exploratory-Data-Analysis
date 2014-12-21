setwd("D:/Course_Project2")

# Loading RDS
PM25 <- readRDS("summarySCC_PM25.rds")
print("PM25 finish")
SCC <- readRDS("Source_Classification_Code.rds")
print("SCC finish")

# Aggregates
print("Aggregates start")
Emissions <- aggregate(PM25[, 'Emissions'], by = list(PM25$year), FUN = sum)
Emissions$PM <- round(Emissions[, 2] / 1000, 2)
print("Aggregates finish")

png(filename = "plot1.png")
barplot(Emissions$PM, names.arg = Emissions$Group.1,
        main = expression('Total Emission of PM'[2.5]),
                          xlab = 'Year',
                          ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()
print("png ready")