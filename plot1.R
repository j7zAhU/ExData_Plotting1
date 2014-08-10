#plot1
power<-read.csv("household_power_consumption.txt",header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
power[,1]<-as.Date(power[,1], "%d/%m/%Y")
temp1<-power[power[,1]=="2007-02-01",]
temp2<-power[power[,1]=="2007-02-02",]
powerSubset<-rbind(temp1, temp2)

png("plot1.png", width = 480, height = 480)
hist(powerSubset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()