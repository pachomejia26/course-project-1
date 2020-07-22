epc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
epc$Date2<-as.Date(epc$Date,"%d/ %m/ %Y")
epc$Time2<-strptime(epc$Time,"%H:%M:%S")
epc1<-subset(epc,"2007-02-01"<=Date2 & Date2<="2007-02-02")

epc1$Global_active_power2<-as.numeric(epc1$Global_active_power)

epc1$Global_reactive_power2<-as.numeric(epc1$Global_reactive_power)

epc1$Voltage2<-as.numeric(epc1$Voltage)

png(file="plot4.png",width=480,height = 480)

par(mfrow=c(2,2))

plot(epc1$Global_active_power2,type="l",  xlab="",xaxt="n",
     ylab="Global Active Power (kilowatts)")
mtext("Thu",side=1,at=0,line=0.8,cex=1.2)
mtext("Fri",side=1,at=1500,line=0.8,cex=1.2)
mtext("Sat",side=1,at=3000,line=0.8,cex=1.2)


plot(epc1$Voltage2,type="l",  xlab="",xaxt="n", ylim=c(234,246),
     ylab="Voltage")
mtext("Thu",side=1,at=0,line=0.8,cex=1.2)
mtext("Fri",side=1,at=1500,line=0.8,cex=1.2)
mtext("Sat",side=1,at=3000,line=0.8,cex=1.2)
mtext("Datetime",side=1,at=1500,line=2,cex=1)

plot(epc1$Sub_metering_1,type="l",  xlab="",xaxt="n", ylim=c(0,40),
     ylab="")
mtext("Thu",side=1,at=0,line=0.8,cex=1.2)
mtext("Fri",side=1,at=1500,line=0.8,cex=1.2)
mtext("Sat",side=1,at=3000,line=0.8,cex=1.2)
par(new=TRUE)
plot(epc1$Sub_metering_2,type="l",  xlab="",xaxt="n", ylim=c(0,40),
     ylab="Energy sub metering",col="red")
par(new=TRUE)
plot(epc1$Sub_metering_3,type="l",  xlab="",xaxt="n", ylim=c(0,40),
     ylab="",col="blue")

legend("topright",pch=16,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(epc1$Global_reactive_power2,type="l",  xlab="",xaxt="n",ylim=c(0.0,0.5),
     ylab="Global Reactive Power (kilowatts)")
mtext("Thu",side=1,at=0,line=0.8,cex=1.2)
mtext("Fri",side=1,at=1500,line=0.8,cex=1.2)
mtext("Sat",side=1,at=3000,line=0.8,cex=1.2)
mtext("Datetime",side=1,at=1500,line=2,cex=1)


dev.off()