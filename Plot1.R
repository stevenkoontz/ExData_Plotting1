#Load Data and Make Dataframe
housepower <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
housepower$Date <- as.Date(housepower$Date, format="%d/%m/%Y")
febdata <- subset(housepower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(housepower)
datetime <- paste(as.Date(febdata$Date), febdata$Time)
febdata$Datetime <- as.POSIXct(datetime)

#Make Plot1
hist(febdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Copy Plot1 to PNG
dev.copy(png, file ="Plot1.png", height = 480, width = 480)
dev.off()
