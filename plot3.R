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
#   Plot 3 : time series Energy sub metering 1,2,3
#------------------------------------------
#   prepare PNG device
png('plot3.png', 480, 480)
plot(x=sub.dat$R.date.time
     , y=sub.dat$Sub_metering_1
     , ylab="Energy sub metering"
     , xlab=""
     , type="l")
lines(x=sub.dat$R.date.time
      , y=sub.dat$Sub_metering_2
      , type="l"
      , col="red")
lines(x=sub.dat$R.date.time
      , y=sub.dat$Sub_metering_3
      , type="l"
      , col="blue")
legend("topright"
       , cex=1.0 
       , lty = 1 
       , col = c("black", "red", "blue")
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#   write to graphical device
dev.off()