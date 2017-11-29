
hhConsump<-read.table("household_power_consumption.txt", sep=";", 
                      header=TRUE, colClasses="character", na.strings="NA")

dtColumn <- paste(hhConsump$Date,hhConsump$Time)
dtColumn <- strptime(dtColumn, "%d/%m/%Y %H:%M:%S")
hhConsump$DateTime<-dtColumn

hhConsump$Date<-as.Date(hhConsump$Date,"%d/%m/%Y")
hhConsump<-hhConsump[hhConsump$Date>="2007-02-01" & hhConsump$Date<="2007-02-02",]

hhConsump$Global_active_power<-as.numeric(hhConsump$Global_active_power)
hhConsump$Global_reactive_power<-as.numeric(hhConsump$Global_reactive_power)
hhConsump$Voltage<-as.numeric(hhConsump$Voltage)
hhConsump$Global_intensity<-as.numeric(hhConsump$Global_intensity)
hhConsump$Sub_metering_1<-as.numeric(hhConsump$Sub_metering_1)
hhConsump$Sub_metering_2<-as.numeric(hhConsump$Sub_metering_2)
hhConsump$Sub_metering_3<-as.numeric(hhConsump$Sub_metering_3)

png(file="plot4.png")
par(mfcol=c(2,2))

# topleft plot
plot(hhConsump$DateTime, hhConsump$Global_active_power,type="l",
     xlab="",ylab="Global Active Power")

# topright plot
plot(hhConsump$DateTime,hhConsump$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="", col="black",
     type="l")

points(hhConsump$DateTime,hhConsump$Sub_metering_2,col="red",type="l")
points(hhConsump$DateTime,hhConsump$Sub_metering_3,col="blue",type="l")

legend("topright",lwd=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))

# bottomleft plot
plot(hhConsump$DateTime,hhConsump$Voltage,
                    xlab="datetime",
                    type="l")

# bottomright plot
plot(hhConsump$DateTime,hhConsump$Global_reactive_power,
                    xlab="datetime",
                    type="l")

dev.off()