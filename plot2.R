epc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
epc$Date2<-as.Date(epc$Date,"%d/ %m/ %Y")
epc$Time2<-strptime(epc$Time,"%H:%M:%S")
epc1<-subset(epc,"2007-02-01"<=Date2 & Date2<="2007-02-02")

epc1$Global_active_power2<-as.numeric(epc1$Global_active_power)

png(file="plot2.png",width=480,height = 480)
plot(epc1$Global_active_power2,type="l",  xlab="",xaxt="n",
     ylab="Global Active Power (kilowatts)")
mtext("Thu",side=1,at=0,line=0.8,cex=1.2)
mtext("Fri",side=1,at=1500,line=0.8,cex=1.2)
mtext("Sat",side=1,at=3000,line=0.8,cex=1.2)

dev.off()