
##setwd("C:\\Users\\jvalerio\\Downloads\\Exploratory Data Analysis")
datos<- read.table("household_power_consumption.txt", header= TRUE, sep=";")
head(datos)
class(datos)
datos[,"Date"]<-as.Date(datos[,"Date"], "%d/%m/%Y")
datosfinal<- subset(datos, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
datosfinal$Global_active_power<-as.numeric(levels(datosfinal$Global_active_power))[datosfinal$Global_active_power]
datosfinal$Sub_metering_1<-as.numeric(levels(datosfinal$Sub_metering_1))[datosfinal$Sub_metering_1]
datosfinal$Sub_metering_2<-as.numeric(levels(datosfinal$Sub_metering_2))[datosfinal$Sub_metering_2]
datosfinal$Sub_metering_3<-as.numeric(levels(datosfinal$Sub_metering_3))[datosfinal$Sub_metering_3]

png( file = "plot3.png", width = 480, height = 480 )
plot(datosfinal$Sub_metering_1, type = "l", ylab="Energy sub metering" ,xlab="", axes=FALSE, col= "black" )
lines(datosfinal$Sub_metering_2, col = "red")
lines(datosfinal$Sub_metering_3, col = "blue")
axis(side = 1, at= c(0,1500,2900), labels= c("Thu","Fri","Sat"))
axis(side = 2)
box()
legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_2", "Sub_metering_2","Sub_metering_3"))
dev.off()
