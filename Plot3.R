#Load Data and Make Dataframe
housepower <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
housepower$Date <- as.Date(housepower$Date, format="%d/%m/%Y")
febdata <- subset(housepower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(housepower)
datetime <- paste(as.Date(febdata$Date), febdata$Time)
febdata$Datetime <- as.POSIXct(datetime)

#Make Plot3
plot(febdata$Datetime, febdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(febdata$Datetime, febdata$Sub_metering_2, col="red")
lines(febdata$Datetime, febdata$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Copy Plot3 to PNG
dev.copy(png, file ="Plot3.png", height = 480, width = 480)
dev.off()
