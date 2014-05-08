#------------------------------------------
#   File dependecies: loadData.R
#                     household_power_consumption.txt                
#------------------------------------------

#------------------------------------------
#   check for data
#------------------------------------------
if(!("sub.dat" %in% ls())){
        source("loadData.R")
}

#------------------------------------------
#   Plot 2 : time series Global Active Power (kilowatts)
#------------------------------------------
#   prepare PNG device
png('plot2.png', 480, 480)
plot(x=sub.dat$R.date.time
     , y=sub.dat$Global_active_power
     , ylab="Global Active Power (kilowatts)"
     , xlab=""
     , type="l")
#   write to graphical device
dev.off()
