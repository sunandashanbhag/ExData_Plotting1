plot3<-function(){
  dat <-read.csv("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=";")
  dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
  dat1<-dat[dat$Date=="2007-02-01"|dat$Date=="2007-02-02",]
  rm(dat)
  dat1$dtTime<-as.POSIXct(paste(dat1$Date, dat1$Time), format="%Y-%m-%d %H:%M:%S")
  png(file="plot3.png", width=480, height=480)
  plot(dat1$dtTime, dat1$Sub_metering_1, xlab="Day", ylab="Energy submetering", type="l")
  lines(dat1$dtTime, dat1$Sub_metering_2, col="orange")
  lines(dat1$dtTime, dat1$Sub_metering_3, col="blue") 
  dev.off()
}