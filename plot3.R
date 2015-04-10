
## COURSERA Exploratory Data Analysis  Week 1  Course Project   Plot 3

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

par(mfrow=c(1,1))
y1=as.numeric(as.character((pldata$Sub_metering_1)))
y2=as.numeric(as.character((pldata$Sub_metering_2)))
y3=as.numeric(as.character((pldata$Sub_metering_3)))
x <- paste(pldata$dat, pldata$Time)
x = strptime(x, "%Y-%m-%d %H:%M:%S")
x = as.numeric(x)
plot(y1~x,pch=20,type='n',axes=F,ylim=c(0,38),
     ylab='Energy sub metering',xlab='')
points(y1~x,pch=20,type='l',col='black')
points(y2~x,pch=20,type='l',col='red')
points(y3~x,pch=20,type='l',col='blue')
axis(2)  # default
axis(1,at=c(min(x),mean(x),max(x)),labels=c('Thu','Fri','Sat'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
      col=c('black','red','blue'),lty=1,border = "black")
box(lty='solid')

## saving as PNG-file
dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device
