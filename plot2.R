## plot no. 2, GAP

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

elec_data <- mutate(elec_data, Dateint = paste(Date, Time))

energy <- mutate(elec_data, 
                    Date = as.Date(Date, format="%d/%m/%Y"))

energy_sub <- filter(energy, Date == "2007-02-01" | Date =="2007-02-02")

energy_sub <- mutate(energy_sub, Daytime = strptime(Dateint, format = "%d/%m/%Y %H:%M:%S"))


## Plot

png("plot2.png", width = 480, height = 480)

with(energy_sub, 
     plot (x = Daytime, y = Global_active_power,
           ylab = "Global Active Power (kilowatts)", 
           main = " ",
           xlab = " ",
           type = "l"
     )
)

dev.off()






      


