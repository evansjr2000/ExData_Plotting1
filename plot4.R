library(dplyr)
library(lubridate)

plot4 <- function()
{
  png("plot4.png")
  power2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  power <- tbl_df(power2)
  power2 <- mutate(power,Correct_Date = dmy_hms(paste(Date,Time)))
  start_date <- ymd_hms("2007-02-01 0:0:0")
  end_date <- ymd_hms("2007-02-03 0:0:0")
  power <- filter(power2,((Correct_Date >= start_date) & (Correct_Date < end_date)))
  x <- power$Correct_Date
  y1 <- power$Sub_metering_1
  y2 <- power$Sub_metering_2
  y3 <- power$Sub_metering_3
  #png("plot4.png")
  par(mfrow = c(2,2))
  
  
  y5 <- power$Global_active_power
  plot(x,y5,type="l",xlab="",ylab="Global Active Power")
  
  y6 <- power$Voltage
  plot(x,y6,type="l", xlab="daytime", ylab="Voltage")
  
  plot(x,y1, type="l",xlab="",ylab="Energy sub metering")
  points(x,y2,type="l",col="red")
  points(x,y3,type="l",col="blue")
  
  legend("topright", col = c("black","red", "blue"), legend =
           c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         lty=(c(1,1,1)), cex=0.8)
  
  y4 <- power$Global_reactive_power
  plot(x,y4,type="l", xlab="datetime",ylab="Global_reactive_power")
  
   
  dev.off()
}