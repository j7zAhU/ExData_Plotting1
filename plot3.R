#plot3
power<-read.csv("household_power_consumption.txt",header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
power[,1]<-as.Date(power[,1], "%d/%m/%Y")
temp1<-power[power[,1]=="2007-02-01",]
temp2<-power[power[,1]=="2007-02-02",]
powerSubset<-rbind(temp1, temp2)

png("plot3.png", width = 480, height = 480)
plot(powerSubset$Sub_metering_1, xlab="", ylab="Energy sub metering", xaxt="n", type="l", col="black")
lines(powerSubset$Sub_metering_2, xlab="", xaxt="n", type="l", col="red")
lines(powerSubset$Sub_metering_3, xlab="", xaxt="n", type="l", col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))      
legend("topright",legend = names(powerSubset)[7:9], col=c("black", "red", "blue"), lwd=1)
dev.off()