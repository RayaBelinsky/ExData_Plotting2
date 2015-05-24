getwd()
setwd("C:/Users/1/Documents/RProjects/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)
dim(NEI) # 6497651   6
dim(SCC) # 11717   15

##Question2
##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
##from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Subset data and append two years in one data frame
MD <- subset(NEI, fips=='24510')

# Generate the graph in the same directory as the source code
png(filename="plot2.png", width=480, height=480)

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))
