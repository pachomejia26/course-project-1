epc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
epc$Date2<-as.Date(epc$Date,"%d/ %m/ %Y")
epc$Time2<-strptime(epc$Time,"%H:%M:%S")
epc1<-subset(epc,"2007-02-01"<=Date2 & Date2<="2007-02-02")

epc1$Global_active_power2<-as.numeric(epc1$Global_active_power)

png(file="plot1.png",width=480,height = 480)
hist(epc1$Global_active_power2,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")



dev.off()