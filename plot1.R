plot1 <- function()
{
  mydev <- png("plot1.png")
  power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  power2 <- tbl_df(power)
  power3 <- mutate(power2,Correct_Date = dmy_hms(paste(Date,Time)))
  start_date <- ymd_hms("2007-02-01 0:0:0")
  end_date <- ymd_hms("2007-02-03 0:0:0")
  power4 <- filter(power3,((Correct_Date >= start_date) & (Correct_Date < end_date)))
  hist(power4$Global_active_power, col = "red",xlab="Global Active Power (kilowatts)",
       main = "Global Active Power")
  #dev.copy(png,"plot1.png",width=480,height=480)
  dev.off()
  
 # rug(power4$Global_active_power)
  
}