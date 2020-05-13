#Download data
url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if(!file.exists('household_power_consumption.txt')){
        download.file(url, 'exdata_data_household_power_consumption.zip', 'curl')
        unzip('exdata_data_household_power_consumption.zip')
}

#Import data and subset
data <- read.table('household_power_consumption.txt',
                   header = TRUE,
                   sep = ';',
                   na.strings="?",
                   stringsAsFactors=FALSE,
                   nrows= 2075259)

subset <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
subset$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Create global active power histogram and save to png
png("plot1.png", width=480, height=480)
with(subset,
     hist(Global_active_power,
          breaks=15,
          col="red",
          main = "Global Active Power",
          xlab="Global Active Power (kilowatts)",
          ylab = "Frequency"))
dev.off()
         