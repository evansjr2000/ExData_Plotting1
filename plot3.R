get_power_data <- function()
{
  power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  power2 <- tbl_df(power)
  power3 <- mutate(power2,Correct_Date = dmy_hms(paste(Date,Time)))
  start_date <- ymd_hms("2007-02-01 0:0:0")
  end_date <- ymd_hms("2007-02-03 0:0:0")
  power4 <- filter(power3,((Correct_Date >= start_date) & (Correct_Date < end_date)))
}

plot3 <- function()
{
  X11(width=5,height=5,type="cairo")
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
  plot(x,y1, type="l",xlab="",ylab="Energy sub metering")
  points(x,y2,type="l",col="red")
  points(x,y3,type="l",col="blue")
  
  legend("topright", col = c("black","red", "blue"), legend =
    c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=(c(1,1,1)))
  message("Graph plotted")
  Sys.sleep(10)
  # The commented out below stopped working when I upgraded to CentOS 7.
  # (font problem)
  #dev.copy(png,"plot2.png",width=480,height=480)
  #dev.off()
  savePlot(filename = "plot3.png", type = "png", device =  dev.cur())
  dev.off()
}