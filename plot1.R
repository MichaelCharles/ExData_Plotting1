# plot1.R for Exploratory Data Analysis
# download power consumption data via url
if(!file.exists("./data")) {dir.create("./data")}
Url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url, destfile="./data/household_power_consumption.zip") 
unzip("./data/household_power_consumption.zip", exdir="data")

# read only two dates into a data frame
data<-read.table("./data/household_power_consumption.txt",
                 header=T,sep=";",na.strings="?",
                 colClasses=c("character","character",rep("numeric",7)))
data<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# plot histogram of active power by freq and save as png
png("plot1.png")
hist(data$Global_active_power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
