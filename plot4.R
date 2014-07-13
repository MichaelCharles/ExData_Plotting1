# plot4.R for Exploratory Data Analysis
# download power consumption data via url
if(!file.exists("./data")) {dir.create("./data")}
Url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url, destfile="./data/household_power_consumption.zip") 
unzip("./data/household_power_consumption.zip", exdir="data")

# read only two dates into a data frame
data<-read.table("./data/household_power_consumption.txt",
                 header=T,sep=";",na.strings="?",
                 colClasses=c(rep("character",2),rep("numeric",7)))
data<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# convert date/time to 1 object
times<-strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M") 

# 2x2 plots - first plot is power by time 
png("plot4.png")      # save as a png
par(mfrow=c(2,2))
plot(
  times,
  data$Global_active_power,
  type="l",
  xlab="",
  ylab="Global Active Power"
)

# second plot is voltage by time
plot(
  times,
  data$Voltage,
  type="l",
  xlab="datetime",
  ylab="Voltage"
)

# third plot is energy sub-metering by time
plot(
  times,
  data$Sub_metering_1,
  type="n",
  xlab="",
  ylab="Energy sub metering"
)
points(times,data$Sub_metering_1,type="l",col="black")
points(times,data$Sub_metering_2,type="l",col="red")
points(times,data$Sub_metering_3,type="l",col="blue")
legend("topright",pch="-",legend=names(data)[7:9],col=c("black", "red","blue"),bty="n")

# fourth plot is reactive power by time
plot(
  times,
  data$Global_reactive_power,
  type="l",
  xlab="datetime",
  ylab="Global_reactive_power"
)
dev.off()
