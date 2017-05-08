plot1<-function(){
  dat <-read.csv("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=";")
  dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
  dat1<-dat[dat$Date=="2007-02-01"|dat$Date=="2007-02-02",]
  rm(dat)
  png(file="plot1.png", width=480, height=480)
  hist(as.numeric(dat1$Global_active_power[dat1$Global_active_power!="?"]),xlab="Global Active Power (kilowatts)",col="Orange", main="Global Active Power")
  dev.off()
}