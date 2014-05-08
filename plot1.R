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
#   Plot 1 : histogram Global Active Power (kilowatts)
#------------------------------------------
#   prepare PNG device
png('plot1.png', 480, 480)
hist(x=sub.dat$Global_active_power
     , col="red", main="Global Active Power"
     , xlab="Global Active Power (kilowatts)")
#   write to graphical device
dev.off()