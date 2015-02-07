
setwd("C:\\Users\\jvalerio\\Downloads\\Exploratory Data Analysis")
datos<- read.table("household_power_consumption.txt", header= TRUE, sep=";")
head(datos)
class(datos)
datos[,"Date"]<-as.Date(datos[,"Date"], "%d/%m/%Y")
datosfinal<- subset(datos, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
datosfinal$Global_active_power<-as.numeric(levels(datosfinal$Global_active_power))[datosfinal$Global_active_power]

png( file = "plot2.png", width = 480, height = 480 )
plot(datosfinal$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)" ,xlab="", axes=FALSE )
axis(side = 1, at= c(0,1500,2900), labels= c("Thu","Fri","Sat"))
axis(side = 2)
box()
dev.off()


