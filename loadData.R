#------------------------------------------
#   Read data : household_power_consumption.txt
#------------------------------------------
#     Date                  : Date in format dd/mm/yyyy
#     Time                  : time in format hh:mm:ss
#     Global_active_power   : household global minute-averaged active power (in kilowatt)
#     Global_reactive_power : household global minute-averaged reactive power (in kilowatt)
#     Voltage               : minute-averaged voltage (in volt)
#     Global_intensity      : household global minute-averaged current intensity (in ampere)
#     Sub_metering_1        : energy sub-metering No. 1 (in watt-hour of active energy). 
#                             It corresponds to the kitchen, containing mainly a dishwasher, 
#                             an oven and a microwave (hot plates are not electric but gas powered).
#     Sub_metering_2        : energy sub-metering No. 2 (in watt-hour of active energy). 
#                             It corresponds to the laundry room, containing a washing-machine, 
#                             a tumble-drier, a refrigerator and a light.
#     Sub_metering_3        : energy sub-metering No. 3 (in watt-hour of active energy). 
#                             It corresponds to an electric water-heater and an air-conditioner.
# the dataset must be in current working directory
ori.dat <- fread("household_power_consumption.txt"
      , sep=";"
      , na.strings="?"
      , stringsAsFactors=FALSE)

#------------------------------------------
#   Subset data: from 2007-02-01 to 2007-02-02
#------------------------------------------
#   subsetting function
is.between<-function(x, a="2007-02-01", b="2007-02-02") { 
        (x >= a) & (x <=b) 
} 
#   subset data
sub.dat <- ori.dat[is.between(as.Date(ori.dat$Date,  format="%d/%m/%Y")),]

#------------------------------------------
#   Create R.date.time column for easy plotting
#------------------------------------------
R.date.time <- strptime(paste(sub.dat$Date, sub.dat$Time), format='%d/%m/%Y %H:%M:%S')
R.date.time
#   add R.dat.time column to sub.dat and 
#   remove the original Date and Time columns
sub.dat <- data.table(cbind(R.date.time, data.frame(sub.dat[,-c(1,2),with=F])))
names(sub.dat)

#------------------------------------------
#   Convert columns to numeric
#------------------------------------------
sub.dat <- sub.dat[, Global_active_power:=as.numeric(Global_active_power)]
sub.dat <- sub.dat[, Global_reactive_power:=as.numeric(Global_reactive_power)]
sub.dat <- sub.dat[, Voltage:=as.numeric(Voltage)]
sub.dat <- sub.dat[, Global_intensity:=as.numeric(Global_intensity)]
sub.dat <- sub.dat[, Sub_metering_1:=as.numeric(Sub_metering_1)]
sub.dat <- sub.dat[, Sub_metering_2:=as.numeric(Sub_metering_2)]
sub.dat <- sub.dat[, Sub_metering_3:=as.numeric(Sub_metering_3)]
