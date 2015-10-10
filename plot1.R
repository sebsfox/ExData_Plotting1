require(lubridate)

df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE) #read data into R
df$Date <- dmy(df$Date) #convert dates using lubridate package
df$Time <- hms(df$Time) #convert times using lubridate package
df <- df[df$Date == dmy("01/02/2007") | df$Date == dmy("02/02/2007"),] #filter for 2 days of interest
df[,3] <- as.numeric(df[,3]) #convert character data to numeric

png(file = "plot1.png")
hist(df$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red",main = "Global Active Power")
dev.off()