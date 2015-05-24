##You must address the following questions and tasks in your exploratory analysis. 
##For each question/task you will need to make a single plot. 
##Unless specified, you can use any plotting system in R to make your plot.

##Question1
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of 
##the years 1999, 2002, 2005, and 2008.

getwd()
setwd("C:/Users/1/Documents/RProjects/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)
dim(NEI) # 6497651   6
dim(SCC) # 11717   15

# Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Generate the graph in the same directory as the source code
png(filename="plot1.png", width=412, height=517)

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
