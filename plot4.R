#Plot4
power<-read.csv("household_power_consumption.txt",header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
power[,1]<-as.Date(power[,1], "%d/%m/%Y")
temp1<-power[power[,1]=="2007-02-01",]
temp2<-power[power[,1]=="2007-02-02",]
powerSubset<-rbind(temp1, temp2)

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
plot(powerSubset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", xaxt="n", type="l")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))      

plot(powerSubset$Voltage, xlab="datetime", ylab="Voltage", type="l", xaxt="n")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))      

plot(powerSubset$Sub_metering_1, xlab="", ylab="Energy sub metering", xaxt="n", type="l", col="black")
lines(powerSubset$Sub_metering_2, xlab="", xaxt="n", type="l", col="red")
lines(powerSubset$Sub_metering_3, xlab="", xaxt="n", type="l", col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))      
legend("topright",legend = names(powerSubset)[7:9], col=c("black", "red", "blue"), lwd=1, cex=.75, bty="n")

plot(powerSubset$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l", xaxt="n")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))      

dev.off()
