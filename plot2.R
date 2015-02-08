library('dplyr')
library('lubridate')
tab5rows <- read.table("household_power_consumption.txt", nrows = 5,header=T,sep=";")
classes <- sapply(tab5rows, class)
tabAll <- read.table("household_power_consumption.txt", header = TRUE, colClasses = classes,sep=";",na.strings=c("?"))
tabAll[tabAll$Date=="1/2/2007" | tabAll$Date=="2/2/2007",]->dat
dmy(dat$Date)+hms(dat$Time)->dat$Time
select(dat,2:9)->dat
rename(dat,datetime=Time)->dat

png(file="plot2.png")
with(dat,plot(Global_active_power~datetime,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()

