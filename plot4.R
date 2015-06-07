plot4 <- function()
{
# There are 96 pixels per inch when translating from Cairo graphics to PNG.
# So 5 inches is 5 x 96, or 480 pixels.

  mydev <- X11(width=5,height=5,type="cairo")
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
           cex = 0.5, lty=(c(1,1,1)))
  
  y4 <- power$Global_reactive_power
  plot(x,y4,type="l", xlab="datetime",ylab="Global_reactive_power")
  
  message("Graph plotted")
  Sys.sleep(10)
  # The commented out below stopped working when I upgraded to CentOS 7.
  # (font problem)
  #dev.copy(png,"plot2.png",width=480,height=480)
  #dev.off()
  savePlot(filename = "plot4.png", type = "png", device =  dev.cur())
  dev.off()
  #mydev <- dev.copy(png,"plot4.png",width=480,height=480)
  #dev.off()
}