require(lubridate)

df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE) #read data into R
df$Date <- dmy(df$Date) #convert dates using lubridate package
df$Time <- hms(df$Time) #convert times using lubridate package
df <- df[df$Date == dmy("01/02/2007") | df$Date == dmy("02/02/2007"),] #filter for 2 days of interest
df[,7] <- as.numeric(df[,7]) #convert character data to numeric
df[,8] <- as.numeric(df[,8]) #convert character data to numeric
df[,9] <- as.numeric(df[,9]) #convert character data to numeric
df$DateTime = df$Date + df$Time #create single column of date and time

png(file = "plot3.png")
with(df,plot(x=DateTime,y=Sub_metering_1, xlab="", 
             ylab="Energy sub metering",type="l",col="black"))
with(df,lines(x=DateTime,y=Sub_metering_2, xlab="", 
             ylab="Energy sub metering",col="red"))
with(df,lines(x=DateTime,y=Sub_metering_3, xlab="", 
              ylab="Energy sub metering",col="blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()