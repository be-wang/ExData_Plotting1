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

#Combine Date and Time columns, and convert to Date object
subset$datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), 
                           format = "%d/%m/%Y  %H:%M:%S")

#Create plot
png("plot2.png", width=480, height=480)
with(subset,
     plot(x=datetime,
          y=Global_active_power,
          ylab = "Global Active Power (kilowatts)",
          xlab = NA,
          type = "l"
     ))
dev.off()



