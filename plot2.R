# plot2.R for Exploratory Data Analysis
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

# plot active power by day and save as a png
png("plot2.png")
plot(
  strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M"),
  data$Global_active_power,
  type="l",
  xlab="",
  ylab="Global Active Power (kilowatts)"
)
dev.off()
