
hhConsump<-read.table("household_power_consumption.txt", sep=";", 
                      header=TRUE, colClasses="character", na.strings="NA")

dtColumn <- paste(hhConsump$Date,hhConsump$Time)
dtColumn <- strptime(dtColumn, "%d/%m/%Y %H:%M:%S")
hhConsump$DateTime<-dtColumn

hhConsump$Date<-as.Date(hhConsump$Date,"%d/%m/%Y")
hhConsump<-hhConsump[hhConsump$Date>="2007-02-01" & hhConsump$Date<="2007-02-02",]

hhConsump$Sub_metering_1<-as.numeric(hhConsump$Sub_metering_1)
hhConsump$Sub_metering_2<-as.numeric(hhConsump$Sub_metering_2)
hhConsump$Sub_metering_3<-as.numeric(hhConsump$Sub_metering_3)

png(file="plot3.png")
plot(hhConsump$DateTime,hhConsump$Sub_metering_1,
     xlab="", ylab="Energy sub metering", col="black", type="l")

points(hhConsump$DateTime,hhConsump$Sub_metering_2,col="red",type="l")
points(hhConsump$DateTime,hhConsump$Sub_metering_3,col="blue",type="l")

legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1",
                "Sub_metering_2","Sub_metering_3"))
dev.off()
