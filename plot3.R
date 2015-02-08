library('dplyr')
library('lubridate')
tab5rows <- read.table("household_power_consumption.txt", nrows = 5,header=T,sep=";")
classes <- sapply(tab5rows, class)
tabAll <- read.table("household_power_consumption.txt", header = TRUE, colClasses = classes,sep=";",na.strings=c("?"))
tabAll[tabAll$Date=="1/2/2007" | tabAll$Date=="2/2/2007",]->dat
dmy(dat$Date)+hms(dat$Time)->dat$Time
select(dat,2:9)->dat
rename(dat,datetime=Time)->dat

png(file="plot3.png")
with(dat,plot(Sub_metering_1~datetime,type="l",xlab="",ylab="Energy sub metering"))
with(dat,points(Sub_metering_2~datetime,col="red",type="l"))
with(dat,points(Sub_metering_3~datetime,col="blue",type="l"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()

