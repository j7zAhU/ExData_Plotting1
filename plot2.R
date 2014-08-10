#plot2
power<-read.csv("household_power_consumption.txt",header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
power[,1]<-as.Date(power[,1], "%d/%m/%Y")
temp1<-power[power[,1]=="2007-02-01",]
temp2<-power[power[,1]=="2007-02-02",]
powerSubset<-rbind(temp1, temp2)

png("plot2.png", width = 480, height = 480)
plot(powerSubset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", xaxt="n", type="l")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))      
dev.off()
