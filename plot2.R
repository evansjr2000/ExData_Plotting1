get_power_data <- function()
{
  power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  power2 <- tbl_df(power)
  power3 <- mutate(power2,Correct_Date = dmy_hms(paste(Date,Time)))
  start_date <- ymd_hms("2007-02-01 0:0:0")
  end_date <- ymd_hms("2007-02-03 0:0:0")
  power4 <- filter(power3,((Correct_Date >= start_date) & (Correct_Date < end_date)))
}

plot2 <- function()
{
  X11(width=5,height=5,type="cairo")
  power <- get_power_data()
  x <- power$Correct_Date
  y <- power$Global_active_power
  plot(x,y, type="l",xlab="",ylab="Global Activer Power (kilowatts)")
  message("Graph plotted")
  Sys.sleep(10)
  # The commented out below stopped working when I upgraded to CentOS 7.
  # (font problem)
  #dev.copy(png,"plot2.png",width=480,height=480)
  #dev.off()
  savePlot(filename = "plot2.png", type = "png", device =  dev.cur())
  dev.off()
  
}