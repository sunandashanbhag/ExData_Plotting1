plot4<-function(){
  dat <-read.csv("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=";")
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat1<-dat[dat$Date=="2007-02-01"|dat$Date=="2007-02-02",]
rm(dat)
dat1$dtTime<-as.POSIXct(paste(dat1$Date, dat1$Time), format="%Y-%m-%d %H:%M:%S")
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(dat1$dtTime, dat1$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
plot(dat1$dtTime, dat1$Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(dat1$dtTime, dat1$Sub_metering_1, xlab="", ylab="Energy submetering", type="l")
lines(dat1$dtTime, dat1$Sub_metering_2, col="orange")
lines(dat1$dtTime, dat1$Sub_metering_3, col="blue")
plot(dat1$dtTime, dat1$Global_reactive_power, xlab="datetime", ylab="Global Reactive power", type="l")
dev.off()

}