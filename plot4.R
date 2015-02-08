##datos<- read.table("household_power_consumption.txt", header= TRUE, sep=";")
head(datos)
class(datos)
datos[,"Date"]<-as.Date(datos[,"Date"], "%d/%m/%Y")
datosfinal<- subset(datos, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
datosfinal$Global_active_power<-as.numeric(levels(datosfinal$Global_active_power))[datosfinal$Global_active_power]
datosfinal$Sub_metering_1<-as.numeric(levels(datosfinal$Sub_metering_1))[datosfinal$Sub_metering_1]
datosfinal$Sub_metering_2<-as.numeric(levels(datosfinal$Sub_metering_2))[datosfinal$Sub_metering_2]
datosfinal$Sub_metering_3<-as.numeric(levels(datosfinal$Sub_metering_3))[datosfinal$Sub_metering_3]
datosfinal$Voltage<-as.numeric(levels(datosfinal$Voltage))[datosfinal$Voltage]
datosfinal$Global_reactive_power<-as.numeric(levels(datosfinal$Global_reactive_power))[datosfinal$Global_reactive_power]


png( file = "plot4.png", width = 480, height = 480 )
par(mfcol = c(2, 2))

plot(datosfinal$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)" ,xlab="", axes=FALSE )
axis(side = 1, at= c(0,1500,2900), labels= c("Thu","Fri","Sat"))
axis(side = 2)
box()

plot(datosfinal$Sub_metering_1, type = "l", ylab="Energy sub metering" ,xlab="", axes=FALSE, col= "black" )
lines(datosfinal$Sub_metering_2, col = "red")
lines(datosfinal$Sub_metering_3, col = "blue")
axis(side = 1, at= c(0,1500,2900), labels= c("Thu","Fri","Sat"))
axis(side = 2)
box()
legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_2", "Sub_metering_2","Sub_metering_3"), bty = "n" )

plot(datosfinal$Voltage, type = "l", ylab="Voltage", xlab="datetime", axes=FALSE )
axis(side = 1, at= c(0,1500,2900), labels= c("Thu","Fri","Sat"))
axis(side = 2)
box()

plot(datosfinal$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime", axes=FALSE )
axis(side = 1, at= c(0,1500,2900), labels= c("Thu","Fri","Sat"))
axis(side = 2)
box()

dev.off()
