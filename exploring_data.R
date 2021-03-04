## Download file

dat_electric <- "consumption.zip"

if (!file.exists(dat_electric)) {
      dat_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(dat_url, dat_electric)
}
if (!file.exists("household_power_consumption.txt")) {
      unzip(dat_electric)
}

## Load flat file and convert class 

library(dplyr)

library(lubridate)

elec_d1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                      dec = ".", na.strings = "?")

elec_d2 <- mutate(elec_d1, Date = dmy(Date), 
                  Time = hms(Time),
                  Global_active_power = as.numeric(Global_active_power, dec = "."),
                  Global_reactive_power = as.numeric(Global_reactive_power, dec = "."),
                  Voltage = as.numeric(Voltage, dec = "."),
                  Global_intensity = as.numeric(Global_intensity, dec = "."),
                  Sub_metering_1 = as.numeric(Sub_metering_1, dec = "."),
                  Sub_metering_2 = as.numeric(Sub_metering_2, dec = "."))

## Subset desired dates
   
electric <- filter(elec_d2, Date >= "2007-02-01", Date <= "2007-02-02")

write.csv(electric, "electric_data.csv")
