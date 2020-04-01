# create a histogram for Global Active Power. Must have the txt file saved to working directory

data <- read.table("household_power_consumption.txt", sep = ";", skip = 64800, nrows = 7200)
data_names <- read.table("household_power_consumption.txt", sep = ";", nrows = 1, colClasses = "character")

#rename data frame with meaningful column names. change format for date column and subset desired dates

names(data) <- data_names[1,]
data$Date <- dmy(as.character(data$Date))
data_sub <- data[which(data$Date >= "2007-02-01" & data$Date < "2007-02-03"),]

#create new column for date and time column for easier use
data_sub <- mutate(data_sub, Full_date = paste(Date, Time))
data_sub$Full_date <- ymd_hms(data_sub$Full_date)  

#create png file
png(filename = "plot2.png")
plot(data_sub$Full_date, data_sub$Global_active_power, type = "l", ylab = "Global Active Power (killowatts)", xlab = "")
dev.off()