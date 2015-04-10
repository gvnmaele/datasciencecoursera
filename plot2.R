
## COURSERA Exploratory Data Analysis  Week 1  Course Project

setwd("C:/Users/UGent/Documents/COURSERA/EDA")
dir()
load("C:/Users/UGent/Documents/COURSERA/EDA/.RData")

pldata <- read.table("household_power_consumption.txt", sep = ";", dec='.',
                     as.is = !stringsAsFactors,header = TRUE)
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


y=as.numeric(as.character((pldata$Global_active_power)))
x <- paste(pldata$dat, pldata$Time)
x = strptime(x, "%Y-%m-%d %H:%M:%S")
x = as.numeric(x)
plot(y~x,pch=20,type='l',axes=F,
     ylab='Global Active Power (kilowatts)',xlab='')
axis(2)  # default
axis(1,at=c(min(x),mean(x),max(x)),labels=c('Thu','Fri','Sat'))
box(lty='solid')

## saving as PNG-file
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device
