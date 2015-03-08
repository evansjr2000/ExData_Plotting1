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
  power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  power2 <- tbl_df(power)
  power3 <- mutate(power2,Correct_Date = dmy_hms(paste(Date,Time)))
  start_date <- ymd_hms("2007-02-01 0:0:0")
  end_date <- ymd_hms("2007-02-03 0:0:0")
  power <- filter(power3,((Correct_Date >= start_date) & (Correct_Date < end_date)))
  png("plot2.png")

  x <- power$Correct_Date
  y <- power$Global_active_power
  plot(x,y, type="l",xlab="",ylab="Global Activer Power (kilowatts)")
  #dev.copy(png,"plot2.png",width=480,height=480)
  dev.off()
}