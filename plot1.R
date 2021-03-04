# plot no. 1, GAP histogram

## Download file

library(dplyr)

dat_electric <- "consumption.zip"

if (!file.exists(dat_electric)) {
      dat_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(dat_url, dat_electric)
}
if (!file.exists("household_power_consumption.txt")) {
      unzip(dat_electric)
}

## Load flat file + convert Date class + Subset DF

elec_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                      dec = ".", na.strings = "?")

elec_data <- mutate(elec_data, 
                  Date = as.Date(Date, format="%d/%m/%Y"))

elec_data_sub <- filter(elec_data, Date == "2007-02-01" | Date =="2007-02-02")

## Plot

png("plot1.png", width = 480, height = 480)

      hist(elec_data_sub$Global_active_power, col = "red", main = "Global Active Power",
            xlab = "Global Active Power (kilowatts)")

dev.off()
