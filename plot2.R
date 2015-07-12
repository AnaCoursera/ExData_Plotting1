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

## Plot 2 and save
png("plot2.png", width=480, height=480)
plot(data$Global_active_power~data$Datetime, type = "l", 
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()