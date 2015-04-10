
## COURSERA Exploratory Data Analysis  Week 1  Course Project

setwd("C:/Users/UGent/Documents/COURSERA/EDA")
dir()
load("C:/Users/UGent/Documents/COURSERA/EDA/.RData")

pldata <- read.table("household_power_consumption.txt", sep = ";", dec='.',as.is = !stringsAsFactors,header = TRUE)
head(pldata)
dim(pldata)
names(pldata)
pdat=as.Date(pldata$Date,format='%d/%m/%Y')
# pldata[which(pdat>=as.Date('01/02/2007',format='%d/%m/%Y') & 
#   pdat<=as.Date('02/02/2007',format='%d/%m/%Y')),1:4]
pldata = data.frame(dat=pdat[which(pdat>=as.Date('01/02/2007',format='%d/%m/%Y') & 
  pdat<=as.Date('02/02/2007',format='%d/%m/%Y'))],
  pldata[which(pdat>=as.Date('01/02/2007',format='%d/%m/%Y') &
  pdat<=as.Date('02/02/2007',format='%d/%m/%Y')),2:9])
dim(pldata)
head(pldata)
hist(as.numeric(as.character((pldata$Global_active_power))),breaks=12,ylim=c(0,1200),
     xlab='Global Active Power (kilowatts)',main='Global Active Power',col='red')


dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device
