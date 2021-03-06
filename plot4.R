## Read full data
data1 <- read.csv("./RData/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

## Make a subset with the needed data and remove the full data

data <- subset(data1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data1)

x <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(x)
rm(x)

## Plot 4 and save
png("plot4.png", width=480, height=480)
#####four plots in one
par(mfrow=c(2,2))

###Plot1
plot(data$Global_active_power~data$Datetime, type = "l", 
     xlab="", ylab="Global Active Power (kilowatts)")

###Plot2
plot(data$Voltage~data$Datetime, type = "l", 
     xlab="datetime", ylab="Voltage")

###Plot3
plot(data$Datetime,data$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(data$Sub_metering_2~data$Datetime,col='Red')
lines(data$Sub_metering_3~data$Datetime,col='Blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), col=c("black", "red", "blue"), bty="n")

###Plot4
plot(data$Global_reactive_power~data$Datetime, type = "l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()